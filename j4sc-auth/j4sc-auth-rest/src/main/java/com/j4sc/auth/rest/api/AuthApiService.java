package com.j4sc.auth.rest.api;

import com.j4sc.auth.dao.entity.*;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description: AuthApi服务定义接口
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 13:28
 * @Version: 1.0
 **/
public interface AuthApiService {

    /**
     * 根据用户名 和 密码 登录获取token
     *
     * @param authUser
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    String login(@RequestBody AuthUser authUser) throws Exception;

    /**
     * 获取所有权限
     *
     * @return
     */
    @RequestMapping(value = "/getAllPermission", method = RequestMethod.GET)
    List<AuthPermission> getAllPermission();

    /**
     * 获取所有权限根据系统ID
     *
     * @return
     */
    @RequestMapping(value = "/getAllPermissionBySystemId", method = RequestMethod.GET)
    List<AuthPermission> getAllPermissionBySystemId(@RequestParam("systemId") int systemId);

    /**
     * 根据用户id获取所拥有的权限(用户和角色权限合集)
     *
     * @param authUserId
     * @return
     */
    @RequestMapping(value = "/selectAuthPermissionByAuthUserId", method = RequestMethod.GET)
    List<AuthPermission> selectAuthPermissionByAuthUserId(@RequestParam("authUserId") String authUserId);

    /**
     * 根据用户id获取所拥有的权限(用户和角色权限合集)
     *
     * @param authUserId
     * @return
     */
    @RequestMapping(value = "/selectAuthPermissionByAuthUserIdByCache", method = RequestMethod.GET)
    List<AuthPermission> selectAuthPermissionByAuthUserIdByCache(@RequestParam("authUserId") String authUserId);

    /**
     * 根据用户id获取所属的角色
     *
     * @param authUserId
     * @return
     */
    @RequestMapping(value = "/selectAuthRoleByAuthUserId", method = RequestMethod.GET)
    List<AuthRole> selectAuthRoleByAuthUserId(@RequestParam("authUserId") String authUserId);

    /**
     * 根据用户id获取所属的角色
     *
     * @param authUserId
     * @return
     */
    @RequestMapping(value = "/selectAuthRoleByAuthUserIdByCache", method = RequestMethod.GET)
    List<AuthRole> selectAuthRoleByAuthUserIdByCache(@RequestParam("authUserId") String authUserId);

    /**
     * 根据角色id获取所拥有的权限
     *
     * @param authRoleId
     * @return
     */
    @RequestMapping(value = "/selectAuthRolePermisstionByAuthRoleId", method = RequestMethod.GET)
    List<AuthRolePermission> selectAuthRolePermisstionByAuthRoleId(@RequestParam("authUserId") String authRoleId);

    /**
     * 根据用户id获取所拥有的权限
     *
     * @param authUserId
     * @return
     */
    @RequestMapping(value = "/selectAuthUserPermissionByAuthUserId", method = RequestMethod.GET)
    List<AuthUserPermission> selectAuthUserPermissionByAuthUserId(@RequestParam("authUserId") String authUserId);

    /**
     * 根据条件获取系统数据
     *
     * @param authSystem
     * @return
     */
    @RequestMapping(value = "/selectAuthSystemByExample", method = RequestMethod.GET)
    List<AuthSystem> selectAuthSystemByExample(AuthSystem authSystem);

    /**
     * 根据条件获取组织数据
     *
     * @param authOrganization
     * @return
     */
    @RequestMapping(value = "/selectAuthOrganizationByExample", method = RequestMethod.GET)
    List<AuthOrganization> selectAuthOrganizationByExample(AuthOrganization authOrganization);

    /**
     * 根据username获取AuthUser
     *
     * @param username
     * @return
     */
    @RequestMapping(value = "/selectAuthUserByUsername", method = RequestMethod.GET)
    AuthUser selectAuthUserByUsername(@RequestParam("username") String username);

    /**
     * 写入操作日志
     *
     * @param record
     * @return
     */
    @RequestMapping(value = "/insertAuthLogSelective", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE)
    boolean insertAuthLogSelective(@RequestBody AuthLog record);
}
