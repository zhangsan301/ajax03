package com.bjsxt.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CheckNameServlet")
public class CheckNameServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        //[1]接受前台传递的数据
        String zh = req.getParameter("zh");

        //[2]数据的处理
        boolean flag = false;
        if("sxt".equals(zh)){
           flag = true;
        }

        //[3]做出我们的响应
        if(flag){
            //证明账号在数据库存在--注意千万不要使用转发和重定向
            resp.getWriter().println("账号存在");
        }else{
            resp.getWriter().println("账号可用");
        }

    }
}
