package com.j4sc.auth.common.util;

import com.j4sc.common.base.BaseJWTInfo;
import com.j4sc.common.constant.CommonConstants;
import com.j4sc.common.util.RsaUtil;
import com.j4sc.common.util.StringUtil;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.joda.time.DateTime;
import org.springframework.stereotype.Component;

/**
 * @Description: 令牌工具
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 14:02
 * @Version: 1.0
 **/
@Component
public class JwtUtil {
    private static RsaUtil rsaUtil = new RsaUtil();

    /**
     * 密钥加密token
     *
     * @param jwtInfo
     * @return
     * @throws Exception
     */
    public static String generateToken(BaseJWTInfo jwtInfo, String priKeyPath, int expire) throws Exception {
        //return AESUtil.aesEncode(JSON.toJSONString(jwtInfo));
        String compactJws = Jwts.builder()
                .setSubject(jwtInfo.getUniqueName())
                .claim(CommonConstants.JWT_KEY_USER_ID, jwtInfo.getId())
                .claim(CommonConstants.JWT_KEY_NAME, jwtInfo.getName())
                .setExpiration(DateTime.now().plusSeconds(expire).toDate())
                .signWith(SignatureAlgorithm.RS256, rsaUtil.getPrivateKey(priKeyPath))
                .compact();
        return compactJws;
    }
    /**
     * 密钥加密token
     *
     * @param jwtInfo
     * @param priKey
     * @param expire
     * @return
     * @throws Exception
     */
    public static String generateToken(BaseJWTInfo jwtInfo, byte priKey[], int expire) throws Exception {
        String compactJws = Jwts.builder()
                .setSubject(jwtInfo.getUniqueName())
                .claim(CommonConstants.JWT_KEY_USER_ID, jwtInfo.getId())
                .claim(CommonConstants.JWT_KEY_NAME, jwtInfo.getName())
                .setExpiration(DateTime.now().plusSeconds(expire).toDate())
                .signWith(SignatureAlgorithm.RS256, rsaUtil.getPrivateKey(priKey))
                .compact();
        return compactJws;
    }

    /**
     * 公钥解析token
     *
     * @param token
     * @return
     * @throws Exception
     */
    public static Jws<Claims> parserToken(String token, String pubKeyPath) throws Exception {
        Jws<Claims> claimsJws = Jwts.parser().setSigningKey(rsaUtil.getPublicKey(pubKeyPath)).parseClaimsJws(token);
        return claimsJws;
    }
    /**
     * 公钥解析token
     *
     * @param token
     * @return
     * @throws Exception
     */
    public static Jws<Claims> parserToken(String token, byte[] pubKey) throws Exception {
        Jws<Claims> claimsJws = Jwts.parser().setSigningKey(rsaUtil.getPublicKey(pubKey)).parseClaimsJws(token);
        return claimsJws;
    }

    /**
     * 获取token中的用户信息
     *
     * @param token
     * @param pubKeyPath
     * @return
     * @throws Exception
     */
    public static <T extends BaseJWTInfo> T getInfoFromToken(String token, String pubKeyPath,Class<T> clazz) throws Exception {
        Jws<Claims> claimsJws = parserToken(token, pubKeyPath);
        Claims body = claimsJws.getBody();
        return clazz.getDeclaredConstructor(String.class,String.class,String.class).newInstance(body.getSubject(), StringUtil.getObjectValue(body.get(CommonConstants.JWT_KEY_USER_ID)), StringUtil.getObjectValue(body.get(CommonConstants.JWT_KEY_NAME)));
    }
    /**
     * 获取token中的用户信息
     *
     * @param token
     * @param pubKey
     * @return
     * @throws Exception
     */
    public static <T extends BaseJWTInfo> T getInfoFromToken(String token, byte[] pubKey,Class<T> clazz) throws Exception {
        Jws<Claims> claimsJws = parserToken(token, pubKey);
        Claims body = claimsJws.getBody();
        return clazz.getDeclaredConstructor(String.class,String.class,String.class).newInstance(body.getSubject(), StringUtil.getObjectValue(body.get(CommonConstants.JWT_KEY_USER_ID)), StringUtil.getObjectValue(body.get(CommonConstants.JWT_KEY_NAME)));
    }
}
