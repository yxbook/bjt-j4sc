package com.j4sc.auth.server.rest.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.j4sc.auth.dao.entity.AuthRolePermission;
import com.j4sc.auth.dao.entity.AuthUserPermission;
import com.j4sc.auth.rest.api.AuthRolePermissionService;
import com.j4sc.auth.rest.api.AuthUserPermissionService;
import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.base.BaseServiceImpl;
import com.j4sc.auth.dao.mapper.AuthPermissionMapper;
import com.j4sc.auth.dao.entity.AuthPermission;
import com.j4sc.auth.rest.api.AuthPermissionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
* @Description: AuthPermission Service实现
* @Author: LongRou
* @CreateDate: 2018/3/27.
* @Version: 1.0
**/
@Service
@Transactional
@BaseService
public class AuthPermissionServiceImpl extends BaseServiceImpl<AuthPermissionMapper, AuthPermission> implements AuthPermissionService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthPermissionServiceImpl.class);
    @Autowired
    private AuthRolePermissionService rolePermissionService;
    @Autowired
    private AuthUserPermissionService userPermissionService;


    //建立权限并自动生成增删改查权限
    @Override
    public boolean insertPermissionAndAutoGenPermisson(AuthPermission entity) {
        int state = 0;
        state += baseMapper.insert(entity);
        if (entity.getType()!=1 && entity.getType()!=2)return true;
        AuthPermission selectAuthPermission = new AuthPermission();
        selectAuthPermission.setCtime(entity.getCtime());
        selectAuthPermission.setIcon("");
        selectAuthPermission.setType(3);
        selectAuthPermission.setPid(entity.getPermissionId());
        selectAuthPermission.setSystemId(entity.getSystemId());

        selectAuthPermission.setUri(entity.getUri()+"/select");
        selectAuthPermission.setMethod(RequestMethod.GET.name());
        selectAuthPermission.setPermissionValue(entity.getPermissionValue()+":read");
        selectAuthPermission.setName(entity.getName()+"查看");
        state += baseMapper.insert(selectAuthPermission);
        selectAuthPermission.setUri(entity.getUri()+"/delete");
        selectAuthPermission.setMethod(RequestMethod.DELETE.name());
        selectAuthPermission.setPermissionValue(entity.getPermissionValue()+":delete");
        selectAuthPermission.setName(entity.getName()+"删除");
        state += baseMapper.insert(selectAuthPermission);
        selectAuthPermission.setUri(entity.getUri()+"/update");
        selectAuthPermission.setMethod(RequestMethod.PUT.name());
        selectAuthPermission.setPermissionValue(entity.getPermissionValue()+":update");
        selectAuthPermission.setName(entity.getName()+"修改");
        state += baseMapper.insert(selectAuthPermission);
        selectAuthPermission.setUri(entity.getUri()+"/add");
        selectAuthPermission.setMethod(RequestMethod.POST.name());
        selectAuthPermission.setPermissionValue(entity.getPermissionValue()+":add");
        selectAuthPermission.setName(entity.getName()+"添加");
        state += baseMapper.insert(selectAuthPermission);
        if (state != 5)throw new RuntimeException();
        return true;
    }
    //完整删除权限使用
    @Override
    public boolean deletePermissionAndUse(Serializable id) {
        AuthPermission authPermission = baseMapper.selectById(id);
        if (null == authPermission)return true;
        List<AuthPermission> list = baseMapper.selectList(new EntityWrapper<AuthPermission>().eq("pid",id));
        List<Serializable> permissionIdList = new ArrayList<Serializable>();
        list.forEach(item -> {
            permissionIdList.add(item.getPermissionId());
        });
        permissionIdList.add(id);
        userPermissionService.delete(new EntityWrapper<AuthUserPermission>().in("permission_id",permissionIdList));
        rolePermissionService.delete(new EntityWrapper<AuthRolePermission>().in("permission_id",permissionIdList));
        baseMapper.delete(new EntityWrapper<AuthPermission>().in("pid",permissionIdList));
        baseMapper.deleteById(authPermission.getPermissionId());

//        switch (authPermission.getType()){
//            //菜单处理
//            case 1:
//                List<AuthPermission> list1 = baseMapper.selectList(new EntityWrapper<AuthPermission>().eq("pid",id));
//                list1.forEach(item -> {
//                    deletePermissionAndUse(item.getPermissionId());
//                });
//                userPermissionService.delete(new EntityWrapper<AuthUserPermission>().eq("permission_id",id));
//                rolePermissionService.delete(new EntityWrapper<AuthRolePermission>().eq("permission_id",id));
//                baseMapper.deleteById(id);
//                break;
//            //菜单处理
//            case 2:
//                List<AuthPermission> list2 = baseMapper.selectList(new EntityWrapper<AuthPermission>().eq("pid",id));
//                List<Serializable> permissionIdList = new ArrayList<Serializable>();
//                list2.forEach(item -> {
//                    permissionIdList.add(item.getPermissionId());
//                });
//                permissionIdList.add(id);
//                userPermissionService.delete(new EntityWrapper<AuthUserPermission>().eq("permission_id",id));
//                rolePermissionService.delete(new EntityWrapper<AuthRolePermission>().eq("permission_id",id));
//                baseMapper.deleteById(id);
//                break;
//            //资源处理
//            case 3:
//                userPermissionService.delete(new EntityWrapper<AuthUserPermission>().eq("permission_id",id));
//                rolePermissionService.delete(new EntityWrapper<AuthRolePermission>().eq("permission_id",id));
//                baseMapper.deleteById(id);
//                break;
//        }
        return true;
    }
}