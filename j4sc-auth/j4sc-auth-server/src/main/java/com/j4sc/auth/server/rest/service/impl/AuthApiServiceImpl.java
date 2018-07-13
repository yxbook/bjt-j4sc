package com.j4sc.auth.server.rest.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.j4sc.auth.common.jwt.JwtInfo;
import com.j4sc.auth.server.util.JwtTokenUtil;
import com.j4sc.auth.dao.entity.*;
import com.j4sc.auth.rest.api.*;
import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.util.MD5Util;
import com.netflix.hystrix.contrib.javanica.cache.annotation.CacheRemove;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 13:35
 * @Version: 1.0
 **/
@Service
@Transactional
@BaseService
@RequestMapping("api")
@RestController
@ApiIgnore
public class AuthApiServiceImpl implements AuthApiService{
    private static final Logger LOGGER = LoggerFactory.getLogger(AuthApiServiceImpl.class);

    @Value("${server.port}")
    String port;

    @Autowired
    private AuthUserService authUserService;
    @Autowired
    private AuthRoleService authRoleService;
    @Autowired
    private AuthUserRoleService authUserRoleService;
    @Autowired
    private AuthPermissionService authPermissionService;
    @Autowired
    private AuthUserPermissionService authUserPermissionService;
    @Autowired
    private AuthRolePermissionService authRolePermissionService;
    @Autowired
    private AuthLogService authLogService;
    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    /**
     * 根据用户名 和 密码 登录获取token
     *
     * @param authUser
     * @return
     */
    @Override
    public String login(AuthUser authUser) throws Exception{
        if (StringUtils.isBlank(authUser.getUsername())) {
            throw new Exception("帐号不能为空！");
        }
        if (StringUtils.isBlank(authUser.getPassword())) {
            throw new Exception("密码不能为空！");
        }
        // 查询用户信息
        AuthUser _authUser = selectAuthUserByUsername(authUser.getUsername());
        if (null == _authUser) {
            throw new Exception("账号错误！");
        }
        if (!_authUser.getPassword().equals(MD5Util.md5(authUser.getPassword() + _authUser.getSalt()))) {
            throw new Exception("账号或密码错误！");
        }
        if (_authUser.getLocked() == 1) {
            throw new Exception("账号被锁定！");
        }
        final String token = jwtTokenUtil.generateToken(new JwtInfo(_authUser.getUsername(),_authUser.getUserId()+"",_authUser.getRealname()));
        return token;
    }

    /**
     * 获取所有权限
     * @return
     */
    @Override
    public List<AuthPermission> getAllPermission() {
        return authPermissionService.selectList(new EntityWrapper<>());
    }
    /**
     * 获取所有权限根据系统ID
     * @return
     */
    @Override
    public List<AuthPermission> getAllPermissionBySystemId(int systemId) {
        return authPermissionService.selectList(new EntityWrapper<AuthPermission>().eq("system_id",systemId));
    }

    /**
     * 根据用户id获取所拥有的权限(用户和角色权限合集)
     * @param authUserId
     * @return
     */
    @Override
    public List<AuthPermission> selectAuthPermissionByAuthUserId(String authUserId) {
        // 用户不存在或锁定状态
        AuthUser authUser = authUserService.selectById(authUserId);
        if (null == authUser || 1 == authUser.getLocked()) {
            LOGGER.info("selectAuthRoleByAuthUserId : authUserId={}", authUserId);
            return null;
        }
        List<AuthUserPermission> authUserPermissionList = authUserPermissionService.selectList(new EntityWrapper<AuthUserPermission>().eq("user_id",authUserId));
        List<Integer> inpermissionIdList = new ArrayList<Integer>();
        inpermissionIdList.add(-1);
        List<Integer> unpermissionIdList = new ArrayList<Integer>();
        unpermissionIdList.add(-1);
        authUserPermissionList.forEach(v ->{
            if (v.getType() == 1){inpermissionIdList.add(v.getPermissionId());}
            else {unpermissionIdList.add(v.getPermissionId());}
        });
        List<AuthUserRole> authUserRoleList = authUserRoleService.selectList(new EntityWrapper<AuthUserRole>().eq("user_id",authUserId));
        List<Integer> roleIdList = new ArrayList<Integer>();
        roleIdList.add(-1);
        authUserRoleList.forEach(v ->{
            roleIdList.add(v.getRoleId());
        });
        List<AuthRolePermission> authRolePermissionList = authRolePermissionService.selectList(new EntityWrapper<AuthRolePermission>().in("role_id",roleIdList));
        authRolePermissionList.forEach(v ->{
           inpermissionIdList.add(v.getPermissionId());
        });

        return authPermissionService.selectList(new EntityWrapper<AuthPermission>().in("permission_id",
                inpermissionIdList).notIn("permission_id",unpermissionIdList).eq("status",1));
    }
    /**
     * 根据用户id获取所拥有的权限(用户和角色权限合集)
     * @param authUserId
     * @return
     */
    @Override
    @Cacheable(value = "j4cf-auth-rpc-service-ehcache", key = "'selectAuthPermissionByAuthUserId_' + #authUserId")
    public List<AuthPermission> selectAuthPermissionByAuthUserIdByCache(String authUserId) {
        return selectAuthPermissionByAuthUserId(authUserId);
    }
    /**
     * 根据用户id获取所属的角色
     * @param authUserId
     * @return
     */
    @Override
    public List<AuthRole> selectAuthRoleByAuthUserId(String authUserId) {
        // 用户不存在或锁定状态
        AuthUser authUser = authUserService.selectById(authUserId);
        if (null == authUser || 1 == authUser.getLocked()) {
            LOGGER.info("selectAuthRoleByAuthUserId : authUserId={}", authUserId);
            return null;
        }
        List<AuthUserRole> authUserRoleList = authUserRoleService.selectList(new EntityWrapper<AuthUserRole>().eq("user_id",authUserId));
        List<Integer> roleIdList = new ArrayList<Integer>();
        roleIdList.add(-1);
        authUserRoleList.forEach(v ->{
            roleIdList.add(v.getRoleId());
        });
        return authRoleService.selectList(new EntityWrapper<AuthRole>().in("role_id",roleIdList));
    }
    /**
     * 根据用户id获取所属的角色
     * @param authUserId
     * @return
     */
    @Override
    @Cacheable(value = "j4cf-auth-rpc-service-ehcache", key = "'selectAuthRoleByAuthUserId_' + #authUserId")
    public List<AuthRole> selectAuthRoleByAuthUserIdByCache(String authUserId) {
        return selectAuthRoleByAuthUserId(authUserId);
    }
    /**
     * 根据角色id获取所拥有的权限
     * @param authRoleId
     * @return
     */
    @Override
    public List<AuthRolePermission> selectAuthRolePermisstionByAuthRoleId(String authRoleId) {
        return authRolePermissionService.selectList(new EntityWrapper<AuthRolePermission>().eq("role_id",authRoleId));
    }
    /**
     * 根据用户id获取所拥有的权限
     * @param authUserId
     * @return
     */
    @Override
    public List<AuthUserPermission> selectAuthUserPermissionByAuthUserId(String authUserId) {
        return authUserPermissionService.selectList(new EntityWrapper<AuthUserPermission>().eq("user_id",authUserId));
    }

    @Override
    public List<AuthSystem> selectAuthSystemByExample(AuthSystem authSystemExample) {
        return null;
    }
    /**
     * 根据条件获取组织数据
     * @param authOrganizationExample
     * @return
     */
    @Override
    public List<AuthOrganization> selectAuthOrganizationByExample(AuthOrganization authOrganizationExample) {
        return null;
    }

    /**
     * 根据username获取AuthUser
     * @param username
     * @return
     */
    @Override
    public AuthUser selectAuthUserByUsername(@RequestParam("username") String username) {
        System.out.println("hi "+username+",i am from port:" +port);
        return authUserService.selectOne(new EntityWrapper<AuthUser>().eq("username",username));
    }
    /**
     * 写入操作日志
     * @param record
     * @return
     */
    @Override
    public boolean insertAuthLogSelective(@RequestBody AuthLog record) {
        return authLogService.insert(record);
    }
}
