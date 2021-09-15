<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/14
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajax的响应</title>
    <link rel="shortcut icon" href="#"/>
    <base href="<%=request.getContextPath()+"/"%>">

    <script type="text/javascript">
         var xhr;
         function ajaxSend(){
             //[1]创建xhr对象
             xhr = new XMLHttpRequest();
             //[2]和服务器建立连接
             xhr.open("get","AjaxResponseServlet",true);
             //[3]执行回调函数
             xhr.onreadystatechange=process;
             //[4]发送数据
             xhr.send(null);
         }

         function process(){

           if(xhr.status==200&&xhr.readyState==4){
               //接收响应数据

               //{uid:1, uname:'张三', pwd:'123'}
               //"{uid:1, uname:'张三', pwd:'123'}"
               // var text = xhr.responseText;

               //使用eval方法就可以把json字符串转成json对象
               //eval("var json ="+text);
               // var json = JSON.parse(text);

               //把JSON对象转换成JSON字符串
               //JSON.stringify(json);
               //这种方式在进行json转换的时候, key必须使用""引出来
               // console.log(json.uname);

               var doc = xhr.responseXML;

               var h = doc.getElementsByTagName("uname")[0].innerHTML;
               console.log(h);

           }
         }

         //JSON就是一种数据格式，作用就是方便用户取值操作{key1:value1,key2:value2...}
         function getJson() {

            var json1={id:1,name:'张三',pwd:'123'};

            var json2={"id":1,"name":'张三',"pwd":'123'};

            var json3 = {
                id:1,
                name:'zs',
                study:function(){
                   console.log("学习")
                }

            }

            var json4 = [{id:1,name:'张三1',pwd:'123'},{id:2,name:'张三2',pwd:'123'},{id:3,name:'张三3',pwd:'123'}];

            for(var i in json4){
                console.log(json4[i].name);
            }



         }

    </script>
</head>
<body>

<input type="button" value="ajax请求" onclick="ajaxSend()"/>

<input type="button" value="JSON" onclick="getJson()"/>

</body>
</html>
