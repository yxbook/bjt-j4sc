package com.j4sc.oss.server.controller;

import com.alibaba.fastjson.JSONObject;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.GeneratePresignedUrlRequest;
import com.aliyun.oss.model.PutObjectResult;
import com.google.gson.Gson;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import com.j4sc.oss.dao.entity.OssLog;
import com.j4sc.oss.rest.api.OssLogService;
import com.j4sc.oss.server.base.BaseJwtController;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.thymeleaf.ThymeleafAutoConfiguration;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/4 16:26
 * @Version: 1.0
 **/
@Controller
@RequestMapping
public class OssController extends BaseJwtController {
    public static final List<String> ALLOW_IMG_TYPES = Arrays.asList(
            "image/jpg", "image/jpeg", "image/png", "image/gif"
    );
    public static final List<String> ALLOW_FILE_EX = Arrays.asList(
            ".zip", ".doc", ".docx", ".xls", ".xlsx"
    );
    @Autowired
    OssLogService ossLogService;
    @Autowired
    OSSClient ossClient;
    @Autowired
    UploadManager uploadManager;
    @Autowired
    Auth qiniuAuth;
    @Value("${j4sc.oss.default}")
    private String defaultOSS;
    @Value("${j4sc.oss.ali.bucker}")
    private String aliBucker;
    @Value("${j4sc.oss.qiniu.bucker}")
    private String qiniuBucker;

    @RequestMapping
    public String index() {
        System.out.println("ssssssssssss");
        return "indexs";
    }

    @RequestMapping(value = "/upImg", method = RequestMethod.POST)
    @ResponseBody
    public BaseResult upIMG(@RequestParam("file") MultipartFile file) throws Exception {
        String contentType = file.getContentType();
        if (!allowUpload(contentType)){ return new BaseResult(BaseResultEnum.ERROR, "请上传图片文件");}
        String fileName = file.getOriginalFilename();
        Long cdate = System.currentTimeMillis();
        String name = cdate + "_" + fileName;
        String filePath = "img/" + name;
        try {
            String source = "";
            switch (defaultOSS) {
                case "ali":
                    PutObjectResult putObjectResult = ossClient.putObject(aliBucker, filePath, file.getInputStream());
                    source = "http://j4cf.oss-cn-shenzhen.aliyuncs.com/" + filePath;
                    break;
                case "qiniu":
                    String upToken = qiniuAuth.uploadToken(qiniuBucker);
                    Response response = uploadManager.put(file.getInputStream(), filePath, upToken,null,null);
                    //解析上传成功的结果
                    DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
                    System.out.println(putRet.key);
                    System.out.println(putRet.hash);
                    source = "http://p7iv3nhe5.bkt.clouddn.com/" + filePath;
            }

            OssLog ossLog = new OssLog();
            ossLog.setUserId(getUserId());
            ossLog.setCtime(cdate);
            ossLog.setUtime(cdate);
            ossLog.setSource(source);
            ossLogService.insert(ossLog);
            return new BaseResult(BaseResultEnum.SUCCESS, source);
        } catch (Exception e) {
            return new BaseResult(BaseResultEnum.ERROR, "上传失败");
        }
    }

    @RequestMapping(value = "/upFile", method = RequestMethod.POST)
    @ResponseBody
    public BaseResult upFile(@RequestParam("file") MultipartFile file) throws Exception {
        String contentType = file.getContentType();
        String fileName = file.getOriginalFilename();
        String prefix = fileName.substring(fileName.lastIndexOf("."));
        //if (!allowEXUpload(prefix))
        //{return new BaseResult(BaseResultEnum.ERROR, "仅支持\".zip\",\".doc\",\".docx\",\".xls\",\".xlsx\"后缀名文件");}
        Long cdate = System.currentTimeMillis();
        String name = cdate + "_" + fileName;
        String filePath = "file/" + name;
        try {
            String source = "";
            switch (defaultOSS) {
                case "ali":
                    PutObjectResult putObjectResult = ossClient.putObject(aliBucker, filePath, file.getInputStream());
                    source = "http://j4cf.oss-cn-shenzhen.aliyuncs.com/" + filePath;
                    break;
                case "qiniu":
                    String upToken = qiniuAuth.uploadToken(qiniuBucker);
                    Response response = uploadManager.put(file.getInputStream(), filePath, upToken,null,null);
                    //解析上传成功的结果
                    DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
                    System.out.println(putRet.key);
                    System.out.println(putRet.hash);
                    source = "http://p7iv3nhe5.bkt.clouddn.com/" + filePath;
            }
            OssLog ossLog = new OssLog();
            ossLog.setUserId(getUserId());
            ossLog.setCtime(cdate);
            ossLog.setUtime(cdate);
            ossLog.setSource(source);
            ossLogService.insert(ossLog);
            return new BaseResult(BaseResultEnum.SUCCESS, source);
        } catch (Exception e) {
            e.printStackTrace();
            return new BaseResult(BaseResultEnum.ERROR, "上传失败");
        }

    }


    //校验文件类型是否是被允许的
    public static boolean allowUpload(String postfix) {
        return ALLOW_IMG_TYPES.contains(postfix);
    }

    //校验文件后缀是否是被允许的
    public static boolean allowEXUpload(String postfix) {
        return ALLOW_FILE_EX.contains(postfix);
    }

}
