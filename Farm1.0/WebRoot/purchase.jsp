<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/type.css" type="text/css">
<title>开心购买</title>
<!-- 网站图标 -->
<link rel="shortcut icon" href="ico/mogu.ico" type="image/x-icon" />
<script src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/reg.js"></script>
<script type="text/javascript">
         var time = "";
         var index = 1;
         $(function () {
             showimg(index);
             //鼠标移入移出
             $(".imgnum span").hover(function () {
                clearTimeout(time);
                var icon=$(this).text();
                $(".imgnum span").removeClass("onselect").eq(icon-1).addClass("onselect");
                $("#banner_img li").hide().stop(true,true).eq(icon-1).fadeIn("slow");
             }, function () {
                index=$(this).text()> 2 ? 1 :parseInt($(this).text())+1;
                time = setTimeout("showimg(" + index + ")", 3000);
             });
         });
 
         function showimg(num) {
             index = num;
             $(".imgnum span").removeClass("onselect").eq(index-1).addClass("onselect");
             $("#banner_img li").hide().stop(true,true).eq(index-1).fadeIn("slow");
             index = index + 1 > 3 ? 1 : index + 1;
             time = setTimeout("showimg(" + index + ")", 3000);
         }
    </script>
</head>
<body>

<div class="header">
    <ul class="overflow">
    <li class="user"><!--需要判断是否需要登录-->
    <c:choose>
       <c:when test="${sessionScope.username == null}">
	       <a class="login-header tx" id="lg" href="login.jsp">亲，请登录</a>
	       |
	       <a class="reg-header tx" href="register.jsp">免费注册</a>
       </c:when>
       <c:when test="${sessionScope.username != null}">
       	   欢迎您,<a href="myFarm.jsp" ><font size="3" color="purple">${sessionScope.username}</font></a>
       	 <a href="login.jsp"><font size="2" color="#888833">退 出</font></a>
       </c:when>
    </c:choose>
    </li>
    <li class="list">
        <a class="tx" href="index.jsp" target="_blank">首页</a>
        <span>|</span>      
        <a class="tx" href="rentLand.jsp" target="_blank">认领土地</a>
        <span>|</span>
        <a class="tx" href="rentTree.jsp" target="_blank">认领果树</a>
        <span>|</span>
        <a class="tx" href="#">开心购买</a>
        <span>|</span>
        <a class="tx" href="experience.jsp" target="_blank">开心体验</a>
        <span>|</span>
        <a class="tx" href="myFarm.jsp" target="_blank">我的农场</a>
        <span>|</span>
        <a class="tx" href="sellerCenterPutaway.jsp" target="_blank">卖家中心</a>
      </li>
      </ul>
</div>
<table width="100%" border="0" style="padding-left:3%;">
  <tr>
    <td style="padding-left:3%;"><img src="img/0.png" width="217" height="112"></td>
    <td><form action="" method="get">
   <li class="kuan">
    <input name="" type="text" name ="search" placeholder="请输入搜索内容" autocomplete="off"style="width:450px; height:38px; background:url(img/kuang.jpg) no-repeat; border:none;"/>
   </li><!--搜索框-->
   <li class="an">
   <input name="" type="button" name="button" style="width:98px; height:38px; background:url(img/an.jpg) no-repeat; border:none;"/>
   </li><!--搜索按钮-->
</form></td>
  </tr>
  <tr>
    <td colspan="2">
   <div class="hTitle">
<div class="first_en fAr"style="padding-left:3%;"><span class="big_en f32"><a href="#" Layout="None">RENT LAND</a></span><span class="f18"><a href="#"></a></span>
</div>
<div class="first_china f25"style="padding-left:3%;">
<a href="#" Layout="None" style="color:#6f6f6f;">认领土地</a>
<a class="f18" href="#" style="padding-left:5%;;">按距离</a>
<span class="f18">|</span>
<a class="f18" href="#">按人气</a>
</div>
<hr size="2" color="#6f6f6f" style="filter:alpha(opacity=10,finishopacity=100,style=1,startX=100,startY=100,finishX=0,finishY=0);width:95%;"> 
</div>
    </td>
  </tr>
</table>
<div id="menu" style="padding-top:5%;">
       <ul style="padding-left:5%;">
            <li style="padding-left:5%;"><a href="xq_1.php?id=4"><img src="img/27.jpg" width="220" height="220" /></a>
            <p style="color:#FF3300;font-size:20px;"> ¥1.50/个</p>
            <p>【爆款】新鲜出炉的土鸡蛋</p>
            <p>热乎着，先到先得</p>
            <p>联系：
            <img src="img/001.png" width="80" height="30" /> </p>           
            </li>
            <li style="padding-left:5%;"><img src="img/13.jpg" width="327" height="220" />
            <p style="color:#FF3300;font-size:20px;"> ¥3.00/斤</p>
            <p></p>
            <p>【新品】日本小南瓜</p>
            <p>还在树上的小南瓜，要多少摘多少，现摘哦</p>
            <p>联系：<img src="img/001.png" width="80" height="30" /> </p>      
            </li>
            <li style="padding-left:5%;"><img src="img/29.jpg" width="329" height="220" />
            <p style="color:#FF3300;font-size:20px;"> ¥4.00/斤</p>
            <p>【热卖】黄瓜</p>
            <p>美容养颜，清爽可口</p>
            <p>生吃，干拌，不容错过</p>
            <p>联系：
            <img src="img/001.png" width="80" height="30" /> </p>      
            </li>
        </ul>
    </div>
<!--会员登录表单-->
<div class="login">
    <div class="login-title">会员登录<span><a href="javascript:void(0);" class="close-login">关闭</a></span></div>
    <div class="login-input-content">
        <div class="login-input">
            <label>用&nbsp;户&nbsp;&nbsp;名：</label>
            <input type="text" placeholder="请输入用户名"  name="info[username]" id="username" class="list-input"/>
        </div>
        <div class="login-input">
            <label>登录密码：</label>
            <input type="password" placeholder="请输入登录密码" name="info[password]" id="password" class="list-input"/>
        </div>
    </div>
    <div class="login-button"><a href="javascript:void(0);" id="login-button-submit">登录会员</a></div>
</div>
<!--会员注册表单-->
<div class="reg">
    <div class="reg-title">新用户注册<span><a href="javascript:void(0);" class="close-reg">关闭</a></span></div>
    <div class="reg-input-content">
        <div class="reg-input">
            <label>用&nbsp;户&nbsp;&nbsp;名：</label>
            <input type="text" placeholder="请输入用户名"  name="info[username]" id="username" class="list-input"/>
        </div>
        <div class="reg-input">
            <label>登录密码：</label>
            <input type="password" placeholder="请输入登录密码" name="info[password]" id="password" class="list-input"/>
        </div>
         <div class="reg-input">
            <label>确认密码：</label>
            <input type="password" placeholder="再次输入密码" name="info[password]" id="password" class="list-input"/>
        </div>
        <div class="reg-input">
            <label>手机号</label>
            <input type="text" placeholder="请输入手机号" name="info[phone]" id="phone" class="list-input"/>
        </div>
        <div class="reg-input">
            <label>地址：</label>
            <input type="password" placeholder="请输入您的地址" name="info[address]" id="address" class="list-input"/>
        </div>
    </div>
    <div class="reg-button"><a href="javascript:void(0);" id="reg-button-submit">注册</a></div>
</div>
</body>
</html>
