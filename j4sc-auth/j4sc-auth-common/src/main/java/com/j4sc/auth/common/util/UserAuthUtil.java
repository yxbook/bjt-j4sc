package com.j4sc.auth.common.util;

import com.j4sc.auth.common.config.UserAuthConfig;
import com.j4sc.common.base.BaseJWTInfo;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.SignatureException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 11:28
 * @Version: 1.0
 **/
@Component
public class UserAuthUtil {
    @Autowired
    private UserAuthConfig userAuthConfig;

    public <T extends BaseJWTInfo> T getInfoFromToken(String token, Class<T> clazz) throws Exception {
        try {
            return JwtUtil.getInfoFromToken(token, userAuthConfig.getPubKeyByte(), clazz);
        }catch (ExpiredJwtException ex){
            throw new Exception("User token expired!");
        }catch (SignatureException ex){
            throw new Exception("User token signature error!");
        }catch (IllegalArgumentException ex){
            throw new Exception("User token is null or empty!");
        }
    }
}
