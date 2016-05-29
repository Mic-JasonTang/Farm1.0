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
<!-- 网站图标 -->
<link rel="shortcut icon" href="ico/mogu.ico" type="image/x-icon" />
<title>开心农场</title>
<script src="js/jquery-1.8.3.min.js"></script>
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
    <!-- 需要判断是否需要登录 -->
    <li class="user">
    <c:choose>
    	<c:when test="${sessionScope.username == null}">
	       <a class="login-header tx" id="lg" href="login.jsp">亲，请登录</a>
	       |
	       <a class="reg-header tx" href="register.jsp">免费注册</a>
       </c:when>
       <c:when test="${sessionScope.username != null}">
       	   欢迎您,<a href="myfarm.html" ><font size="3" color="purple">${sessionScope.username}</font></a>
       	 |
       	 <a href="login.jsp"><font size="2" color="#888833">退 出</font></a>
       </c:when>
    </c:choose>
    </li>

    <li class="list">
        <a class="tx" href="#">首页</a>
        <span>|</span>      
        <a class="tx" href="rentLand.jsp" target="_blank">认领土地</a>
        <span>|</span>
        <a class="tx" href="rentTree.jsp" target="_blank">认领果树</a>
        <span>|</span>
        <a class="tx" href="purchase.jsp" target="_blank">开心购买</a>
        <span>|</span>
        <a class="tx" href="experience.jsp" target="_blank">开心体验</a>
        <span>|</span>
        <a class="tx" href="myFarm.jsp" target="_blank">我的农场</a>
        <span>|</span>
        <a class="tx" href="sellerCenterPutaway.jsp" target="_blank">卖家中心</a>
      </li>
      </ul>
</div>
<div class="top">
  <ul>
   <li class="logo"><img src="img/0.png" width="217" height="112"></li>
   <li class="by"><img src="img/01.png" width="455" height="112">
   </li>
  </ul>
</div>
<div class="imgbox" style="padding-left:12%;padding-right:12%;">
            <ul id="banner_img">
                <li><img src="img/1.jpg"/></li>
                <li><img src="img/2.jpg"/></li>
                <li><img src="img/3.jpg"/></li>
            </ul>
    <div class="clear"></div>
    <div class="imgnum" style="padding-right:12%;">
        <span class="onselect">1</span>
        <span>2</span>
        <span>3</span>
    </div>
</div>
<div class="hTitle">
<div id="head" style="padding-left:3%">
<div class="first_en fAr">
<span class="big_en f32">
<a href="#" layout="None">INTRODUCTION</a>
</span>
<span class="f18">
<a href="#"></a>
</span>
</div>
<div class="first_china f25">
<a href="#" Layout="None" style="color:#6f6f6f;">公司简介</a>
</div>
</div>
<hr size="2" color="#6f6f6f" style="filter:alpha(opacity=10,finishopacity=100,style=1,startX=100,startY=100,finishX=0,finishY=0);width:95%;"> 
</div>
<div class="f18"  style="padding-top:2%;padding-left:4%;">
<p>西安乐农有限责任公司是目前三农电商行业新兴的线上认领及线下体验平台</p>
<p>"乐农"意为使农民快乐，充分体现了本公司的特点和宗旨。</p>
<p>公司主要运营项目为"开心农场"网站，该网站为客户提供认领土地、果树、线上买卖农产品及田园生活体验等产品和服务。</p>
<p>本公司致力于推动三农电商领域的发展，坚持绿色环保的理念，坚决贯彻可持续发展的政策，保证为每一位客户提供优质的土地、绿色健康的农产品与有价值的旅游体验。</p>
<p>同时本公司坚持不断创新的发展理念，在保证产品质量的同时，不断完善网站的各项功能，并在三农电商领域探索开拓新的项目，同时开拓城市消费市场新的增长点，立志成为行业的领先者</p>
</div>
<div id="head" style="padding-left:3%; padding-top:3%;">
<div class="first_en fAr">
<span class="big_en f32">
<a href="#" layout="None">WEBSITE</a>
</span>
<span class="f18"><a href="#"></a></span>
</div>
<div class="first_china f25">
<a href="#" layout="None" style="color:#6f6f6f;">网站简介</a>
</div>
</div>
<hr size="2" color="#6f6f6f" style="filter:alpha(opacity=10,finishopacity=100,style=1,startX=100,startY=100,finishX=0,finishY=0);width:95%;"> </div></div>
<div class="f18"  style="padding-top:2%;padding-left:4%;">
<p>"开心农场"电子商务网站是一个C2C认领土地、果树及线上交易的网站</p>
<p>本网站旨在通过提高整合郊区及农村或边远地区的农舍拥有的土地等资源，开发其利用空间，提高农舍资源的单位收益，同时满足城市居民追求健康生活，体验田园生活的需要。</p>
<P>本网站采用农民帮种及消费者体验种植等形式，消费者可以通过网站全程监控果树和土地上农作物的生长过程，待农产品成熟后，买家可以选择自己来到农场采摘,也可以选择邮寄的方式送到家中。</p>
<p>除此之外，消费者还可根据自己的需要在本网站线上购买农产品，操作简单方便。让消费者足不出户即可享受到最天然无公害可靠的绿色产品。</p>
</div>
<div class="footer" style="text-align:center;padding-top:2%;">
<a href="#" target="_blank" style="color:#6f6f6f;">版权申明</a> | <a href="#" target="_blank" style="color:#6f6f6f;">陕ICP备110258258号</a> </p>
<p>Copyright © 2016 - 2018 联系我们:1150689758@qq.com</p>
</div>
</body>
</html>
