package com.bjsxt.servlet;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/CityServlet")
public class CityServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

         req.setCharacterEncoding("utf-8");
         resp.setCharacterEncoding("utf-8");
         resp.setContentType("text/html;charset=utf-8");

        //[1]接收前台页面数据
        String val = req.getParameter("val");
        //[2]数据处理
        List<String> list = new ArrayList<>();
        if("1".equals(val)){
            list.add("郑州");
            list.add("商丘");
            list.add("洛阳");
        }else if("2".equals(val)){
            list.add("邢台");
            list.add("石家庄");
            list.add("保定");
        }else if("3".equals(val)){
            list.add("青岛");
            list.add("潍坊");
            list.add("烟台");
        }
        //[3]给用户做出响应
        String json = new Gson().toJson(list);
        resp.getWriter().print(json);

    }
}
