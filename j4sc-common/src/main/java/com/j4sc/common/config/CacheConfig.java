package com.j4sc.common.config;

import com.j4sc.common.properties.RedisProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisPassword;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import java.time.Duration;
import java.util.HashMap;
import java.util.Map;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/28 17:32
 * @Version: 1.0
 **/
@Configuration
@EnableCaching
@EnableConfigurationProperties(RedisProperties.class)
public class CacheConfig {

    @Autowired
    RedisProperties redisProperties;

    @Bean
    public RedisStandaloneConfiguration redisStandaloneConfiguration(){
        RedisStandaloneConfiguration redisStandaloneConfiguration = new RedisStandaloneConfiguration();
        redisStandaloneConfiguration.setDatabase(redisProperties.getDatabase());
        redisStandaloneConfiguration.setHostName(redisProperties.getHost());
        redisStandaloneConfiguration.setPassword(RedisPassword.of(redisProperties.getPassword()));
        redisStandaloneConfiguration.setPort(redisProperties.getPort());
        return redisStandaloneConfiguration;
    }
    @Bean
    public RedisConnectionFactory redisConnectionFactory() {
        //return new LettuceConnectionFactory();
        JedisConnectionFactory jedisConnectionFactory = new JedisConnectionFactory(redisStandaloneConfiguration());
        return jedisConnectionFactory;
    }
    @Bean
    public RedisTemplate<Object, Object> redisTemplate() {
        RedisTemplate<Object, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(redisConnectionFactory());
        return  template;
    }
    @Bean
    public CacheManager cacheManager(RedisConnectionFactory redisConnectionFactory) {
        RedisCacheConfiguration redisCacheConfiguration =  RedisCacheConfiguration.defaultCacheConfig() .entryTtl(Duration.ofSeconds(300))
                //禁止value为空
                .disableCachingNullValues();
                //.computePrefixWith(cacheName -> "yourAppName".concat(":").concat(cacheName).concat(":"))
                //.serializeKeysWith(RedisSerializationContext.SerializationPair.fromSerializer(new StringRedisSerializer()))
                //.serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(createJackson2JsonRedisSerializer(objectMapper)));
        return RedisCacheManager.RedisCacheManagerBuilder.fromConnectionFactory(redisConnectionFactory).cacheDefaults(redisCacheConfiguration).build();
    }
}
