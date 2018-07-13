package com.j4sc.gateway.server.filter;

import com.alibaba.fastjson.JSONObject;
import com.j4sc.auth.common.config.UserAuthConfig;
import com.j4sc.auth.common.jwt.JwtInfo;
import com.j4sc.auth.common.util.UserAuthUtil;
import com.j4sc.auth.dao.entity.AuthLog;
import com.j4sc.auth.dao.entity.AuthPermission;
import com.j4sc.bjt.system.dao.entity.BjtSystemLog;
import com.j4sc.bjt.user.dao.entity.BjtUserPermission;
import com.j4sc.common.base.BaseJWTInfo;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import com.j4sc.common.context.BaseContextHandler;
import com.j4sc.common.util.AESUtil;
import com.j4sc.gateway.server.client.AuthApiClient;
import com.j4sc.gateway.server.client.AuthKeyClient;
import com.j4sc.gateway.server.client.BjtSystemLogClient;
import com.j4sc.gateway.server.client.BjtUserApiClient;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.cloud.gateway.support.ServerWebExchangeUtils;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.function.Predicate;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Component
public class AccessGatewayFilter implements GlobalFilter {
    @Value("${j4sc.ignore.url}")
    private String ignoreUrl;

    @Autowired
    private UserAuthConfig userAuthConfig;
    @Autowired
    private UserAuthUtil userAuthUtil;
    @Autowired
    @Lazy
    AuthApiClient authApiClient;
    @Autowired
    @Lazy
    BjtUserApiClient bjtUserApiClient;
    @Autowired
    @Lazy
    BjtSystemLogClient bjtSystemLogClient;

    @Autowired
    private AuthKeyClient authKeyClient;

    @Override
    public Mono<Void> filter(ServerWebExchange serverWebExchange, GatewayFilterChain gatewayFilterChain) {
        System.out.println("check token and user permission....");
        ServerHttpRequest request = serverWebExchange.getRequest();
        final String requestUri = request.getPath().pathWithinApplication().value();
        final String method = request.getMethod().toString();
        ServerHttpRequest.Builder mutate = request.mutate();
        if (request.getURI().getHost().equals("")){

        }
        String host = "";
        try {
            LinkedHashSet requiredAttribute = serverWebExchange.getRequiredAttribute(ServerWebExchangeUtils.GATEWAY_ORIGINAL_REQUEST_URL_ATTR);
            if (null != requiredAttribute){
                Iterator<URI> iterator = requiredAttribute.iterator();
                final URI _uri =iterator.next();
                final URI uri = requiredAttribute.size()>1? iterator.next():_uri;
                host = uri.getHost();
            }
        }catch (IllegalArgumentException e){

        }

        if (host.equals("j4sc-auth-server")){
            //admin 路由处理
            // 不进行拦截的地址
            if (isStartWith(requestUri)) {
                ServerHttpRequest build = mutate.build();
                return gatewayFilterChain.filter(serverWebExchange.mutate().request(build).build());
            }
            BaseJWTInfo user = null;
            try {
                user = getJWTUser(request, mutate);
            }catch (Exception e){
                System.out.println("admin用户Token过期异常");
                return getVoidMono(serverWebExchange, new BaseResult(BaseResultEnum.NOACCESS,"User Token Forbidden or Expired!"));
            }
            //半拦截。 -- -- -- -- - 仅拦截已注册的权限


            //根据系统ID获取所有权限
            List<AuthPermission> permissionIfs = authApiClient.getAllPermissionBySystemId(1);
            // 判断资源是否启用权限约束
            Stream<AuthPermission> stream = getPermissionIfs(requestUri, method, permissionIfs);
            List<AuthPermission> result = stream.collect(Collectors.toList());
            AuthPermission[] permissions = result.toArray(new AuthPermission[]{});
            if (permissions.length > 0) {
                if (checkUserPermission(permissions, serverWebExchange, user)) {
                    return getVoidMono(serverWebExchange, new BaseResult(BaseResultEnum.NOACCESS,"User Forbidden!Does not has Permission!"));
                }
            }
            // 申请客户端密钥头 服务间通信授权
            mutate.header("userId",user.getId());
            //mutate.header(serviceAuthConfig.getTokenHeader(), serviceAuthUtil.getClientToken());
            ServerHttpRequest build = mutate.build();
            return gatewayFilterChain.filter(serverWebExchange.mutate().request(build).build());
        }else if (host.equals("bjt-api-server")){
            //APP接口拦截处理
            // 不进行拦截的地址
            if (isStartWith(requestUri)) {
                ServerHttpRequest build = mutate.build();
                return gatewayFilterChain.filter(serverWebExchange.mutate().request(build).build());
            }
            //系统管理拦截限制
            if (requestUri.startsWith("/system")) {
                BaseJWTInfo user = null;
                try {
                    user = getJWTUser(request, mutate);
                }catch (Exception e){
                    System.out.println("appSystem用户Token过期异常");
                    return getVoidMono(serverWebExchange, new BaseResult(BaseResultEnum.NOACCESS,"User Token Forbidden or Expired!"));
                }
                //获取权限信息 - 全拦截 3号系统
                if (checkUserPermissionAll(requestUri,method, serverWebExchange, user,3)) {
                    return getVoidMono(serverWebExchange, new BaseResult(BaseResultEnum.NOACCESS,"User Forbidden!Does not has Permission!"));
                }
                mutate.header("userId",user.getId());
                ServerHttpRequest build = mutate.build();
                return gatewayFilterChain.filter(serverWebExchange.mutate().request(build).build());
            }
            //用户系统管理拦截限制
            if (requestUri.startsWith("/admin")) {
                BaseJWTInfo user = null;
                try {
                    user = getAppJWTUser(request, mutate);
                }catch (Exception e){
                    System.out.println("appUser用户Token过期异常");
                    return getVoidMono(serverWebExchange, new BaseResult(BaseResultEnum.NOACCESS,"User Token Forbidden or Expired!"));
                }
                //获取权限信息 - 全拦截
                if (checkUserPermissionAndBuildId(requestUri,method, serverWebExchange, user,request)) {
                    return getVoidMono(serverWebExchange, new BaseResult(BaseResultEnum.NOACCESS,"User Forbidden!Does not has Permission!"));
                }
                mutate.header("userId",user.getId());
                mutate.header("buildId",request.getHeaders().get("j4sc-b-token").get(0));
                ServerHttpRequest build = mutate.build();
                return gatewayFilterChain.filter(serverWebExchange.mutate().request(build).build());
            }


            BaseJWTInfo user = null;
            try {
                user = getAppJWTUser(request, mutate);
            }catch (Exception e){
                System.out.println("app用户Token过期异常");
                return getVoidMono(serverWebExchange, new BaseResult(BaseResultEnum.NOACCESS,"User Token Forbidden or Expired!"));
            }
            mutate.header("userId",user.getId());
            // 申请客户端密钥头 服务间通信授权
            //mutate.header(serviceAuthConfig.getTokenHeader(), serviceAuthUtil.getClientToken());
            ServerHttpRequest build = mutate.build();
            return gatewayFilterChain.filter(serverWebExchange.mutate().request(build).build());
        }

        ServerHttpRequest build = mutate.build();
        return gatewayFilterChain.filter(serverWebExchange.mutate().request(build).build());
    }
    /**
     * 检查权限
     *
     * @param requestUri
     * @param ctx
     * @param user
     * @return
     */
    private boolean checkUserPermissionAll(String requestUri,String method, ServerWebExchange ctx, BaseJWTInfo user,int systemId) {
        //改成缓存
        //List<AuthPermission> permissionInfos = authApiClient.selectAuthPermissionByAuthUserId(user.getId());
        List<AuthPermission> permissionInfos = authApiClient.selectAuthPermissionByAuthUserIdByCache(user.getId());
        if (null == permissionInfos) {return true;}
        // 判断是否拥有权限
        Stream<AuthPermission> stream = getPermissionIfs(requestUri, method, permissionInfos);
        List<AuthPermission> result = stream.collect(Collectors.toList());
        AuthPermission[] permissions = result.toArray(new AuthPermission[]{});
        AuthPermission current = null;
        for (AuthPermission info : permissions) {
            boolean anyMatch = permissionInfos.parallelStream().anyMatch(new Predicate<AuthPermission>() {
                @Override
                public boolean test(AuthPermission permissionInfo) {
                    return permissionInfo.getStatus() == 1 && permissionInfo.getPermissionId().equals(info.getPermissionId()) && info.getSystemId() == systemId;
                }
            });
            if (anyMatch) {
                current = info;
                break;
            }
        }
        if (current == null) {
            return true;
        } else {
            if (!RequestMethod.GET.toString().equals(current.getMethod())) {
                setCurrentUserInfoAndLog(ctx, user, current);
            }
            return false;
        }
    }
    /**
     * 检查权限 检查BUILDID
     *
     * @param requestUri
     * @param ctx
     * @param user
     * @return
     */
    private boolean checkUserPermissionAndBuildId(String requestUri,String method, ServerWebExchange ctx, BaseJWTInfo user,
                                                  ServerHttpRequest request) {
        List<String> strings = request.getHeaders().get("j4sc-b-token");
        String buildId = null;
        if (strings != null) {
            buildId = strings.get(0);
        }
        if (StringUtils.isBlank(buildId)) {
            return true;
        }
        //改成缓存 selectPermissionByUserIdByCache
        BaseResult baseResult = bjtUserApiClient.selectPermissionByUserId(user.getId(),buildId);
        if (baseResult.getStatus() != BaseResultEnum.SUCCESS.getStatus()){return true;}
        List<BjtUserPermission> permissionInfos = (List<BjtUserPermission>)baseResult.getData();
        if (null == permissionInfos || permissionInfos.size() == 0) {return true;}
        // 判断是否拥有权限
        Stream<BjtUserPermission> stream = getPermissionIfsByBjt(requestUri, method, permissionInfos);
        List<BjtUserPermission> result = stream.collect(Collectors.toList());
        BjtUserPermission[] permissions = result.toArray(new BjtUserPermission[]{});
        BjtUserPermission current = null;
        for (BjtUserPermission info : permissions) {
            boolean anyMatch = permissionInfos.parallelStream().anyMatch(new Predicate<BjtUserPermission>() {
                @Override
                public boolean test(BjtUserPermission permissionInfo) {
                    return permissionInfo.getStatus() == 1 && permissionInfo.getPermissionId().equals(info.getPermissionId());
                }
            });
            if (anyMatch) {
                current = info;
                break;
            }
        }
        if (current == null) {
            return true;
        } else {
            if (!RequestMethod.GET.toString().equals(current.getMethod())) {
                //写入帮家团日志
                setCurrentUserInfoAndLog(ctx, user, current);
            }
            return false;
        }
    }
    /**
     * 检查权限
     *
     * @param permissions
     * @param ctx
     * @param user
     * @return
     */
    private boolean checkUserPermission(AuthPermission[] permissions, ServerWebExchange ctx, BaseJWTInfo user) {
        List<AuthPermission> permissionInfos = authApiClient.selectAuthPermissionByAuthUserIdByCache(user.getId());
        AuthPermission current = null;
        for (AuthPermission info : permissions) {
            boolean anyMatch = permissionInfos.parallelStream().anyMatch(new Predicate<AuthPermission>() {
                @Override
                public boolean test(AuthPermission permissionInfo) {
                    return permissionInfo.getStatus() == 1 && permissionInfo.getPermissionId().equals(info.getPermissionId());
                }
            });
            if (anyMatch) {
                current = info;
                break;
            }
        }
        if (current == null) {
            return true;
        } else {
            if (!RequestMethod.GET.toString().equals(current.getMethod())) {
                setCurrentUserInfoAndLog(ctx, user, current);
            }
            return false;
        }
    }
    /**
     * 日志记录
     *
     * @param serverWebExchange
     * @param user
     * @param pm
     * @return
     */
    private void setCurrentUserInfoAndLog(ServerWebExchange serverWebExchange, BaseJWTInfo user, AuthPermission pm) {
        //String host = ClientUtil.getClientIp((HttpServletRequest) serverWebExchange.getRequest());
        String host = serverWebExchange.getRequest().getRemoteAddress().getAddress().getHostAddress();
        AuthLog authLog = new AuthLog();
        authLog.setBasePath(pm.getUri());
        authLog.setIp(host);
        authLog.setUsername(user.getUniqueName());
        authLog.setDescription(pm.getName());
        authLog.setStartTime(System.currentTimeMillis());
        authLog.setMethod(pm.getMethod());
        authLog.setPermissions(pm.getPermissionValue());
        authLog.setUri(serverWebExchange.getRequest().getURI().toString());
        authLog.setUserAgent(serverWebExchange.getRequest().getHeaders().get("User-Agent").get(0));
        MultiValueMap<String, String> sss = serverWebExchange.getRequest().getQueryParams();
        authLog.setParameter(serverWebExchange.getRequest().getQueryParams().toString());
        authApiClient.insertAuthLogSelective(authLog);
    }/**
     * 日志记录
     *
     * @param serverWebExchange
     * @param user
     * @param pm
     * @return
     */
    private void setCurrentUserInfoAndLog(ServerWebExchange serverWebExchange, BaseJWTInfo user, BjtUserPermission pm) {
        //String host = ClientUtil.getClientIp((HttpServletRequest) serverWebExchange.getRequest());
        String host = serverWebExchange.getRequest().getRemoteAddress().getAddress().getHostAddress();
        BjtSystemLog authLog = new BjtSystemLog();
        authLog.setBasePath(pm.getUri());
        authLog.setIp(host);
        authLog.setUsername(user.getUniqueName());
        authLog.setDescription(pm.getName());
        authLog.setStartTime(System.currentTimeMillis());
        authLog.setMethod(pm.getMethod());
        authLog.setPermissions(pm.getPermissionValue());
        authLog.setUri(serverWebExchange.getRequest().getURI().toString());
        authLog.setUserAgent(serverWebExchange.getRequest().getHeaders().get("User-Agent").get(0));
        MultiValueMap<String, String> sss = serverWebExchange.getRequest().getQueryParams();
        authLog.setParameter(serverWebExchange.getRequest().getQueryParams().toString());
        authLog.setBuildId(Integer.parseInt(serverWebExchange.getRequest().getHeaders().get("j4sc-b-token").get(0)));
        bjtSystemLogClient.insert(authLog);
    }

    /**
     * 获取目标权限资源
     *
     * @param requestUri
     * @param method
     * @param serviceInfo
     * @return
     */
    private Stream<AuthPermission> getPermissionIfs(final String requestUri, final String method, List<AuthPermission> serviceInfo) {
        return serviceInfo.parallelStream().filter(new Predicate<AuthPermission>() {
            @Override
            public boolean test(AuthPermission authPermission) {
                String url = authPermission.getUri();
                if (authPermission.getType() != 3 || null == url)return false;
                String uri = url.replaceAll("\\{\\*\\}", "[a-zA-Z\\\\d]+");
                String regEx = "^" + uri + "$";
                return (Pattern.compile(regEx).matcher(requestUri).find() || requestUri.startsWith(url + "/"))
                        && method.equals(authPermission.getMethod());
            }
        });
    }
    /**
     * 获取目标权限资源 - 帮家团
     *
     * @param requestUri
     * @param method
     * @param serviceInfo
     * @return
     */
    private Stream<BjtUserPermission> getPermissionIfsByBjt(final String requestUri, final String method, List<BjtUserPermission> serviceInfo) {
        return serviceInfo.parallelStream().filter(new Predicate<BjtUserPermission>() {
            @Override
            public boolean test(BjtUserPermission authPermission) {
                String url = authPermission.getUri();
                if (authPermission.getType() != 3 || null == url)return false;
                String uri = url.replaceAll("\\{\\*\\}", "[a-zA-Z\\\\d]+");
                String regEx = "^" + uri + "$";
                return (Pattern.compile(regEx).matcher(requestUri).find() || requestUri.startsWith(url + "/"))
                        && method.equals(authPermission.getMethod());
            }
        });
    }


    /**
     * 返回session中的用户信息
     *
     * @param request
     * @param ctx
     * @return
     */
    private BaseJWTInfo getJWTUser(ServerHttpRequest request, ServerHttpRequest.Builder ctx) throws Exception{
        List<String> strings = request.getHeaders().get(userAuthConfig.getTokenHeader());
        String authToken = null;
        if (strings != null) {
            authToken = strings.get(0);
        }
        if (StringUtils.isBlank(authToken)) {
            strings = request.getQueryParams().get("token");
            if (strings != null) {
                authToken = strings.get(0);
            }
        }
        ctx.header(userAuthConfig.getTokenHeader(), authToken);
        BaseContextHandler.setToken(authToken);
        return userAuthUtil.getInfoFromToken(authToken, JwtInfo.class);
    }
    /**
     * 返回session中的APP用户信息
     *
     * @param request
     * @param ctx
     * @return
     */
    private BaseJWTInfo getAppJWTUser(ServerHttpRequest request, ServerHttpRequest.Builder ctx) throws Exception{
        List<String> strings = request.getHeaders().get("j4sc-bjt-token");
        String authToken = null;
        if (strings != null) {
            authToken = strings.get(0);
        }
        if (StringUtils.isBlank(authToken)) {
            strings = request.getQueryParams().get("token");
            if (strings != null) {
                authToken = strings.get(0);
            }
        }
        authToken = AESUtil.aesDecode(authToken);
        ctx.header(userAuthConfig.getTokenHeader(), authToken);
        BaseContextHandler.setToken(authToken);
        return userAuthUtil.getInfoFromToken(authToken, JwtInfo.class);
    }

    /**
     * URI是否以什么打头
     *
     * @param requestUri
     * @return
     */
    private boolean isStartWith(String requestUri) {
        boolean flag = false;
        for (String s : ignoreUrl.split(",")) {
            if (requestUri.startsWith(s)) {
                return true;
            }
        }
        return flag;
    }

    /**
     * 网关抛异常
     *
     * @param body
     */
    private Mono<Void> getVoidMono(ServerWebExchange serverWebExchange, BaseResult body) {
        serverWebExchange.getResponse().setStatusCode(HttpStatus.OK);
        byte[] bytes = JSONObject.toJSONString(body).getBytes(StandardCharsets.UTF_8);
        DataBuffer buffer = serverWebExchange.getResponse().bufferFactory().wrap(bytes);
        return serverWebExchange.getResponse().writeWith(Flux.just(buffer));
    }

    /**
     * 网关抛异常
     *
     * @param body
     * @param code
     */
    private Mono<Void> setFailedRequest(ServerWebExchange serverWebExchange, String body, int code) {
        serverWebExchange.getResponse().setStatusCode(HttpStatus.OK);
        return serverWebExchange.getResponse().setComplete();
    }

}
