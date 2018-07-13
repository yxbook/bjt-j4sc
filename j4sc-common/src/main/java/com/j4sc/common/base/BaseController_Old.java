package com.j4sc.common.base;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/28 18:18
 * @Version: 1.0
 **/
public class BaseController_Old<T,S extends IService<T>> implements BaseApiService_Old<T>{
    @Autowired
    S service;

    @Override
    public BaseResult insert(@RequestBody T entity) {
        System.out.println("insert => "+entity);
        return new BaseResult(BaseResultEnum.SUCCESS,service.insert(entity));
    }

    @Override
    public BaseResult insertAllColumn(T entity) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.insertAllColumn(entity));
    }

    @Override
    public BaseResult insertBatch(List<T> entityList) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.insertBatch(entityList));
    }

    @Override
    public BaseResult insertBatch(BatchBySize batchBySize) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.insertBatch(batchBySize.getEntityList(),batchBySize.getBatchSize()));
    }

    @Override
    public BaseResult insertOrUpdateBatch(List<T> entityList) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.insertOrUpdateBatch(entityList));
    }

    @Override
    public BaseResult insertOrUpdateBatch(BatchBySize batchBySize) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.insertOrUpdateBatch(batchBySize.getEntityList(),batchBySize.getBatchSize()));
    }

    @Override
    public BaseResult insertOrUpdateAllColumnBatch(List<T> entityList) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.insertOrUpdateAllColumnBatch(entityList));
    }

    @Override
    public BaseResult insertOrUpdateAllColumnBatch(BatchBySize batchBySize) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.insertOrUpdateAllColumnBatch(batchBySize.getEntityList(),batchBySize.getBatchSize()));
    }

    @Override
    public BaseResult deleteById(Serializable id) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.deleteById(id));
    }

    @Override
    public BaseResult deleteByMap(Map<String, Object> columnMap) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.deleteByMap(columnMap));
    }

    @Override
    public BaseResult delete(Wrapper<T> wrapper) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.delete(wrapper));
    }

    @Override
    public BaseResult deleteBatchIds(Collection<? extends Serializable> idList) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.deleteBatchIds(idList));
    }

    @Override
    public BaseResult updateById(T entity) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.updateById(entity));
    }

    @Override
    public BaseResult updateAllColumnById(T entity) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.updateAllColumnById(entity));
    }

    @Override
    public BaseResult update(UpdateByWrapper<T> updateByWrapper) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.update(updateByWrapper.getEntity(),updateByWrapper.getWrapper()));
    }

    @Override
    public BaseResult updateBatchById(List<T> entityList) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.updateBatchById(entityList));
    }

    @Override
    public BaseResult updateBatchById(BatchBySize batchBySize) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.updateBatchById(batchBySize.getEntityList(),batchBySize.getBatchSize()));
    }

    @Override
    public BaseResult updateAllColumnBatchById(List<T> entityList) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.updateAllColumnBatchById(entityList));
    }

    @Override
    public BaseResult updateAllColumnBatchById(BatchBySize batchBySize) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.updateAllColumnBatchById(batchBySize.getEntityList(),batchBySize.getBatchSize()));
    }

    @Override
    public BaseResult insertOrUpdate(T entity) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.insertOrUpdate(entity));
    }

    @Override
    public BaseResult insertOrUpdateAllColumn(T entity) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.insertOrUpdateAllColumn(entity));
    }

    @Override
    public BaseResult<T> selectById(Serializable id) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectById(id));
    }

    @Override
    public BaseResult<List<T>> selectBatchIds(Collection<? extends Serializable> idList) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectBatchIds(idList));
    }

    @Override
    public BaseResult<List<T>> selectByMap(Map<String, Object> columnMap) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectByMap(columnMap));
    }

    @Override
    public BaseResult<T> selectOne(Wrapper<T> wrapper) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectOne(wrapper));
    }

    @Override
    public BaseResult<Map<String, Object>> selectMap(Wrapper<T> wrapper) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectMap(wrapper));
    }

    @Override
    public BaseResult<Object> selectObj(Wrapper<T> wrapper) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectObj(wrapper));
    }

    @Override
    public BaseResult selectCount(Wrapper<T> wrapper) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectCount(wrapper));
    }

    @Override
    public BaseResult<List<T>> selectList(Wrapper<T> wrapper) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectList(wrapper));
    }

    @Override
    public BaseResult<Page<T>> selectPage(Page<T> page) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectPage(page));
    }

    @Override
    public BaseResult<List<Map<String, Object>>> selectMaps(Wrapper<T> wrapper) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectMaps(wrapper));
    }

    @Override
    public BaseResult<List<Object>> selectObjs(Wrapper<T> wrapper) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectObjs(wrapper));
    }

    @Override
    public BaseResult<Page<Map<String, Object>>> selectMapsPage(MapsPage<T> mapsPage) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectMapsPage(mapsPage.getPage(),mapsPage.getWrapper()));
    }

    @Override
    public BaseResult<Page<T>> selectPage(PageByWrapper<T> pageByWrapper) {
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectPage(pageByWrapper.getPage(),pageByWrapper.getWrapper()));
    }
}
