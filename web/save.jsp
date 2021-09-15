<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/14
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" href="#"/>
    <script type="text/javascript">
        var xhr;
         function checkName(th) {
            //获得账号的值
           var val =  th.value;
           if(val==""||val==null){
              document.getElementById("zh_span").innerText = "x 用户名不能为空"
           }else{
             //发送ajax请求进行用户名判断

             //[1]创建xhr XMLHttpRequest对象
             if(window.ActiveXObject){
                   xhr = new ActiveXObject("Microsoft.XMLHTTP");
               }else{
                   xhr = new XMLHttpRequest();
             }
             //[2]和服务器建立连接
             //method: string, url: string, async: boolean, username: , password
             xhr.open("get","CheckNameServlet?zh="+val,true);
               //xhr.open("post","CheckNameServlet",true);
             /* POST 方式 提交数据 需要设置请求头为普通文本数据提交*/
              // xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
             //[3]执行回调函数
             xhr.onreadystatechange=process;
             //[4]发送数据
             xhr.send(null);

             //xhr.send("zh="+val);
           }
         }


         function process(){

             //200 404 500 302 405

             if(xhr.readyState==4){
                 if(xhr.status==200){
                     //接收ajax响应的内容
                     var text = xhr.responseText;
                     //把接收的值复制给span标签
                     document.getElementById("zh_span").innerText=text;
                 }else if(xhr.status==500){
                     alert("代码异常")
                 }else if(xhr.status=404){
                     alert("资源异常");
                 }else{
                     alert("响应失败");
                 }
             }
         }
    </script>

</head>
<body>
<h3>注册页面</h3>
<hr/>
<form enctype="">

    <p>
        用户名:<input type="text"/>
    </p>
    <p>
        账号:<input type="text" onblur="checkName(this)"/>
        <span id="zh_span"></span>
    </p>
    <p>
        密码:<input type="text"/>
    </p>
    <p>
        <input type="submit" value="提交"/>
    </p>

</form>

</body>
</html>
<%--
  [1]创建XHR对象
       if(window.ActiveXObject){
          xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }else{
           xhr = new XMLHttpRequest();
        }
  [2]
      GET
       xhr.open("get","CheckNameServlet?zh="+val,true);
       xhr.send(null);
      POST
       xhr.open("post","CheckNameServlet",true);
       /* POST 方式 提交数据 需要设置请求头为普通文本数据提交*/
       xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
       xhr.send("zh="+val);
  [3]后台如何接收数据
    String zh = req.getParameter("zh");

  [4]后台给前台做出响应
     resp.getWriter().println("账号存在");
  [5]前台接收响应的数据
     xhr.responseText;

--%>

