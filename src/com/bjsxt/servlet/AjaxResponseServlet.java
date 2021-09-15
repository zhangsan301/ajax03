package com.bjsxt.servlet;

import com.bjsxt.pojo.User;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AjaxResponseServlet")
public class AjaxResponseServlet extends HttpServlet {

    /**
     * 响应数据类型
     * A、普通文本
     *
     * B、JSON格式
     * 1、更改了toString()
     * 2、手动拼接json
     * 3、GSON依赖
     *
     * C、XML格式
     */

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

         /******【A】普通文本格式******/
         //resp.getWriter().println("ajax响应成功");

        /******【B】响应JSON格式******/
        //目的为了模拟查询单个操作
        User user = new User(1,"张三","123");
        //resp.getWriter().println(user);
//        String json = "{uid:"+user.getUid()+", uname:'"+user.getUname()+"', pwd:'"+user.getPwd()+"'}";
        Gson gson = new Gson();
        String json = gson.toJson(user);

        resp.getWriter().println(json);
    }
}
