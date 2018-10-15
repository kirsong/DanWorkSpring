package com.dan.controller;

import com.dan.data.FandianData;
import com.google.gson.Gson;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.*;
import java.util.List;

@Controller
public class MainController implements ApplicationContextAware{

    private static ApplicationContext applicationContext;

    @RequestMapping("main")
    public String main(){

        return "mainProtobi";
    }

    @ResponseBody
    @RequestMapping("updateFandian")
    public String updateFandian(@RequestBody List<FandianData> fandianData){

        String resultCode="0001";

        BufferedWriter bw =null;
        try {
            File file=ResourceUtils.getFile("classpath:fandian.json");
            if (file.exists()){
                FileWriter fileWriter=new FileWriter(file);
                bw=new BufferedWriter(fileWriter);
                bw.write(new Gson().toJson(fandianData));
                bw.flush();// 把缓存区内容压入文件
                bw.close();//关闭文件
                resultCode="0000";
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return resultCode;

    }

    @ResponseBody
    @RequestMapping("getFandian")
    public String getFandian(){
        File file= null;
        String tempString = "";
        byte[] filecontent=null;
        String encoding = "UTF-8";

        try {
            file =ResourceUtils.getFile("classpath:fandian.json");
            if (!file .exists()) {
                return tempString;
            }
            Long filelength = file.length();
            filecontent = new byte[filelength.intValue()];

            FileInputStream in = new FileInputStream(file);
            in.read(filecontent);
            in.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            return tempString=new String(filecontent, encoding);
        } catch (UnsupportedEncodingException e) {
            System.err.println("The OS does not support " + encoding);
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext=applicationContext;
    }
}
