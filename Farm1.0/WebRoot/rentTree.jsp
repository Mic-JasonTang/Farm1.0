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
<title>认领果树</title>
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
        <a class="tx" href="index.jsp" target="view_window">首页</a>
        <span>|</span>      
        <a class="tx" href="rentLand.jsp" target="view_window">认领土地</a>
        <span>|</span>
        <a class="tx" href="#">认领果树</a>
        <span>|</span>
        <a class="tx" href="purchase.jsp" target="view_window">开心购买</a>
        <span>|</span>
        <a class="tx" href="experience.jsp" target="view_window">开心体验</a>
        <span>|</span>
        <a class="tx" href="myFarm.jsp" target="view_window">我的农场</a>
        <span>|</span>
        <a class="tx" href="sellerCenterPutaway.jsp" target="view_window">卖家中心</a>
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
        <ul>
            <li style="padding-left:5%;"><a href="xq_1.php?id=2"><img src="img/pear.jpg"/></a>
            <p style="color:#FF3300;font-size:20px;"> ¥150.00/颗</p>
            <p>酥梨以其表面光洁，个大丰满，多汁酥脆</p>
            <p>营养丰富和无公害等几大特点</p>
            <p>深受国内外消费者的喜爱</p>
            <p>联系：
            <a href="kefu.html"><img src="img/001.png" width="80" height="30" /> </a></p>           
            </li>
            <li style="padding-left:5%;"><img src="img/apple.jpg" width="329" height="220" />
            <p style="color:#FF3300;font-size:20px;"> ¥180.00/颗</p>
            <p></p>
            <p>铜川苹果香.脆可口誉为"中华名果"称号</p>
            <p>北京奥运推荐果品一等奖，誉为"中华名果"</p>
            <p>"陕西苹果优，铜川苹果好"已被市场和消费者认可。</p>
            <p>联系：<img src="img/001.png" width="80" height="30" /> </p>      
            </li>
            <li style="padding-left:5%;"><img src="img/pomegranate.jpg" width="329" height="220" />
            <p style="color:#FF3300;font-size:20px;"> ¥175/颗</p>
            <p>集全国石榴之优，素以色泽艳丽，果大皮薄</p>
            <p>汁多味甜，核软鲜美，籽肥渣少，而著称。</p>
            <p>全国五大名榴之冠，被列为果中珍品</p>
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
