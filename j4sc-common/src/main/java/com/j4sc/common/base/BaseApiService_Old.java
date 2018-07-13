package com.j4sc.common.base;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * @Description: REST实现伪RPC服务
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/20 11:59
 * @Version: 1.0
 **/
public interface BaseApiService_Old<T> {
    
    @RequestMapping(value = "/insert" ,method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult insert(@RequestBody T entity);


    @RequestMapping(value = "/insertAllColumn" ,method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult insertAllColumn(@RequestBody T entity);


    @RequestMapping(value = "/insertBatch" ,method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult insertBatch(@RequestBody List<T> entityList);


    @RequestMapping(value = "/insertBatchBySize" ,method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult insertBatch(@RequestBody BatchBySize batchBySize);


    @RequestMapping(value = "/insertOrUpdateBatch" ,method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult insertOrUpdateBatch(@RequestBody List<T> entityList);


    @RequestMapping(value = "/insertOrUpdateBatchBySize" ,method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult insertOrUpdateBatch(@RequestBody BatchBySize batchBySize);


    @RequestMapping(value = "/insertOrUpdateAllColumnBatch" ,method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult insertOrUpdateAllColumnBatch(@RequestBody List<T> entityList);


    @RequestMapping(value = "/insertOrUpdateAllColumnBatchBySize" ,method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult insertOrUpdateAllColumnBatch(@RequestBody BatchBySize batchBySize);


    @RequestMapping(value = "/deleteById" ,method = RequestMethod.DELETE ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult deleteById(Serializable id);


    @RequestMapping(value = "/deleteByMap" ,method = RequestMethod.DELETE ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult deleteByMap(@RequestBody Map<String, Object> columnMap);


    @RequestMapping(value = "/delete" ,method = RequestMethod.DELETE ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult delete(@RequestBody Wrapper<T> wrapper);


    @RequestMapping(value = "/deleteBatchIds" ,method = RequestMethod.DELETE ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult deleteBatchIds(@RequestBody Collection<? extends Serializable> idList);


    @RequestMapping(value = "/updateById" ,method = RequestMethod.PUT ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult updateById(@RequestBody T entity);


    @RequestMapping(value = "/updateAllColumnById" ,method = RequestMethod.PUT ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult updateAllColumnById(@RequestBody T entity);


    @RequestMapping(value = "/update" ,method = RequestMethod.PUT ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult update(@RequestBody UpdateByWrapper<T> updateByWrapper);


    @RequestMapping(value = "/updateBatchById" ,method = RequestMethod.PUT ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult updateBatchById(@RequestBody List<T> entityList);


    @RequestMapping(value = "/updateBatchByIdBySize" ,method = RequestMethod.PUT ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult updateBatchById(@RequestBody BatchBySize batchBySize);


    @RequestMapping(value = "/updateAllColumnBatchById" ,method = RequestMethod.PUT ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult updateAllColumnBatchById(@RequestBody List<T> entityList);


    @RequestMapping(value = "/updateAllColumnBatchByIdBySize" ,method = RequestMethod.PUT ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult updateAllColumnBatchById(@RequestBody BatchBySize batchBySize);


    @RequestMapping(value = "/insertOrUpdate" ,method = RequestMethod.PUT ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult insertOrUpdate(@RequestBody T entity);


    @RequestMapping(value = "/insertOrUpdateAllColumn" ,method = RequestMethod.PUT ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult insertOrUpdateAllColumn(@RequestBody T entity);


    @RequestMapping(value = "/selectById" ,method = RequestMethod.GET ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult<T> selectById(Serializable id);


    @RequestMapping(value = "/selectBatchIds" ,method = RequestMethod.GET ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult<List<T>> selectBatchIds(@RequestBody Collection<? extends Serializable> idList);


    @RequestMapping(value = "/selectByMap" ,method = RequestMethod.GET ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult<List<T>> selectByMap(@RequestBody Map<String, Object> columnMap);


    @RequestMapping(value = "/selectOne" ,method = RequestMethod.GET ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult<T> selectOne(@RequestBody Wrapper<T> wrapper);


    @RequestMapping(value = "/selectMap" ,method = RequestMethod.GET ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult<Map<String, Object>> selectMap(@RequestBody Wrapper<T> wrapper);


    @RequestMapping(value = "/selectObj" ,method = RequestMethod.GET ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult<Object> selectObj(@RequestBody Wrapper<T> wrapper);


    @RequestMapping(value = "/selectCount" ,method = RequestMethod.GET ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult selectCount(@RequestBody Wrapper<T> wrapper);


    @RequestMapping(value = "/selectList" ,method = RequestMethod.GET ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult<List<T>> selectList(@RequestBody Wrapper<T> wrapper);


    @RequestMapping(value = "/selectPage" ,method = RequestMethod.GET ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult<Page<T>> selectPage(@RequestBody Page<T> page);


    @RequestMapping(value = "/selectMaps" ,method = RequestMethod.GET ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult<List<Map<String, Object>>> selectMaps(@RequestBody Wrapper<T> wrapper);


    @RequestMapping(value = "/selectObjs" ,method = RequestMethod.GET ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult<List<Object>> selectObjs(@RequestBody Wrapper<T> wrapper);


    @RequestMapping(value = "/selectMapsPage" ,method = RequestMethod.GET ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult<Page<Map<String, Object>>> selectMapsPage(@RequestBody MapsPage<T> mapsPage);


    @RequestMapping(value = "/selectPageByWrapper" ,method = RequestMethod.GET ,consumes = MediaType.APPLICATION_JSON_VALUE)
    BaseResult<Page<T>> selectPage(@RequestBody PageByWrapper<T> pageByWrapper);

    class BatchBySize<T>{
        List<T> entityList;
        int batchSize;

        public List<T> getEntityList() {
            return entityList;
        }

        public void setEntityList(List<T> entityList) {
            this.entityList = entityList;
        }

        public int getBatchSize() {
            return batchSize;
        }

        public void setBatchSize(int batchSize) {
            this.batchSize = batchSize;
        }

        @Override
        public String toString() {
            return "BatchBySize{" +
                    "entityList=" + entityList +
                    ", batchSize=" + batchSize +
                    '}';
        }
    }
    class UpdateByWrapper<T>{
        T entity;
        Wrapper<T> wrapper;

        public T getEntity() {
            return entity;
        }

        public void setEntity(T entity) {
            this.entity = entity;
        }

        public Wrapper<T> getWrapper() {
            return wrapper;
        }

        public void setWrapper(Wrapper<T> wrapper) {
            this.wrapper = wrapper;
        }

        @Override
        public String toString() {
            return "UpdateByWrapper{" +
                    "entity=" + entity +
                    ", wrapper=" + wrapper +
                    '}';
        }
    }
    class MapsPage<T>{
        Page page;
        Wrapper<T> wrapper;

        public Page getPage() {
            return page;
        }

        public void setPage(Page page) {
            this.page = page;
        }

        public Wrapper<T> getWrapper() {
            return wrapper;
        }

        public void setWrapper(Wrapper<T> wrapper) {
            this.wrapper = wrapper;
        }

        @Override
        public String toString() {
            return "MapsPage{" +
                    "page=" + page +
                    ", wrapper=" + wrapper +
                    '}';
        }
    }
    class PageByWrapper<T>{
        Page<T> page;
        Wrapper<T> wrapper;

        public Page<T> getPage() {
            return page;
        }

        public void setPage(Page<T> page) {
            this.page = page;
        }

        public Wrapper<T> getWrapper() {
            return wrapper;
        }

        public void setWrapper(Wrapper<T> wrapper) {
            this.wrapper = wrapper;
        }

        @Override
        public String toString() {
            return "PageByWrapper{" +
                    "page=" + page +
                    ", wrapper=" + wrapper +
                    '}';
        }
    }
}
