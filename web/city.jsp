<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/14
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>二级联动</title>
    <link rel="shortcut icon" href="#"/>
    <script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
    <base href="<%=request.getContextPath()+"/"%>">
    <script type="text/javascript">
          var xhr;
          function chenge(val){
            //发送ajax请求
            //[1]创建XHR对象
              xhr = new XMLHttpRequest();
           //[2]和服务器建立连接
           xhr.open("get","CityServlet?val="+val,true);
          //[3]执行回调函数
          xhr.onreadystatechange=process;
          //[4]发送数据
          xhr.send(null);
          }

          function process(){
             if(xhr.readyState==4&&xhr.status==200){
                 var text = xhr.responseText;
                 eval("var json="+text);
                 //清空内容操作
                 $("#sel").empty();
                 $("#sel").append("<option>--请选择--</option>");
                 for(var i in json){
                    $("#sel").append("<option>"+json[i]+"</option>");
                 }
             }
          }

    </script>
</head>
<body>

<select onchange="chenge(this.value)">
    <option>--请选择--</option>
    <option value="1">河南</option>
    <option value="2">河北</option>
    <option value="3">山东</option>
</select>

<select id="sel">
    <option>--请选择--</option>
</select>


</body>
</html>
