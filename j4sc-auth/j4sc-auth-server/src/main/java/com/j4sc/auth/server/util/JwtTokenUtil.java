package com.j4sc.auth.server.util;

import com.j4sc.auth.common.util.JwtUtil;
import com.j4sc.auth.server.config.RsaConfig;
import com.j4sc.common.base.BaseJWTInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.Protocol;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 10:53
 * @Version: 1.0
 **/
@Component
public class JwtTokenUtil {

    @Value("${jwt.expire}")
    private int expire;
    @Autowired
    private RsaConfig rsaConfig;


    public String generateToken(BaseJWTInfo jwtInfo) throws Exception {
        return JwtUtil.generateToken(jwtInfo, rsaConfig.getUserPriKey(),expire);
    }

    public <T extends BaseJWTInfo> T getInfoFromToken(String token,Class<T> clazz) throws Exception {
        return JwtUtil.getInfoFromToken(token, rsaConfig.getUserPubKey(),clazz);
    }

//    public static void main(String[] args) {
//        JedisPoolConfig config = new JedisPoolConfig();
//        config.setMaxTotal(1024); // 可用连接实例的最大数目,如果赋值为-1,表示不限制.
//        config.setMaxIdle(5); // 控制一个Pool最多有多少个状态为idle(空闲的)jedis实例,默认值也是8
//        config.setMaxWaitMillis(1000 * 100); // 等待可用连接的最大时间,单位毫秒,默认值为-1,表示永不超时/如果超过等待时间,则直接抛出异常
//        config.setTestOnBorrow(true); // 在borrow一个jedis实例时,是否提前进行validate操作,如果为true,则得到的jedis实例均是可用的
//        //JedisPool jedisPool = new JedisPool(config, "120.79.63.106", 6379);
//        JedisPool jedisPool = new JedisPool(config, "120.79.63.106", 6379, Protocol.DEFAULT_TIMEOUT,"j4scredis");
//        jedisPool.getResource().set("s","sss");
//    }

}

