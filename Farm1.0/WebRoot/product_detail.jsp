<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>商品详情</title>
<!-- 网站图标 -->
<link rel="shortcut icon" href="ico/mogu.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/type.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="css/jquery-labelauty.css">
<style>
body {
	background: white;
	color: #000;
}

.header {
	background: #f0f0f0;
}

.header .overflow {
	margin: auto;
	width: 1200px;
}

.header .overflow .user {
	padding-left: 15px;
}

.container {
	margin-top: 20px;
	width: 1200px;
}

.text-center {
	text-align: center;
}

.container .text-center {
	padding-top: 30px;
}

.container form {
	display: inline-block;
}

ul {
	list-style-type: none;
}

li {
	display: inline-block;
}

.check li {
	margin: 10px 0;
}

input.labelauty+label {
	font: 12px "Microsoft Yahei";
}
</style>
</head>

<body>
	<div class="header">
		<ul class="overflow">
			<li class="user">
				<!--需要判断是否需要登录--> <c:choose>
					<c:when test="${sessionScope.username == null}">
						<a class="login-header tx" id="lg" href="login.jsp">亲，请登录</a>
	       |
	       <a class="reg-header tx" href="register.jsp">免费注册</a>
					</c:when>
					<c:when test="${sessionScope.username != null}">
       	   欢迎您,<a href="myfarm.html"><font size="3" color="purple">${sessionScope.username}</font></a>
       	 |
       	 <a href="login.jsp"><font size="2" color="#888833">退
								出</font></a>
					</c:when>
				</c:choose>
			</li>
			<li class="list"><a class="tx" href="#">首页</a> <span>|</span> <a
				class="tx" href="rentLand.jsp" target="_black">认领土地</a> <span>|</span>
				<a class="tx" href="rentTree.jsp" target="_black">认领果树</a> <span>|</span>
				<a class="tx" href="purchase.jsp" target="_black">开心购买</a> <span>|</span>
				<a class="tx" href="experience.jsp" target="_black">开心体验</a> <span>|</span>
				<a class="tx" href="myFarm.jsp" target="_black">我的农场</a> <span>|</span>
				<a class="tx" href="sellerCenterPutaway.jsp" target="_black">卖家中心</a>
			</li>
		</ul>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-2">
				<img src="img/0.png" width="217" height="112">
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="hTitle">
					<div class="first_en fAr">
						<!-- 					<span class="big_en f32"> -->
						<!-- 						<a href="#" Layout="None">DESCRIPTION</a> -->
						<!-- 					</span> -->
						<span class="f18"> <a href="#"></a>
						</span>
					</div>
					<div class="first_china f25">
						<span style="color:#6f6f6f;">商品详情</span>
					</div>
					<hr size="2" color="#6f6f6f"
						style="filter:alpha(opacity=10,finishopacity=100,style=1,startX=100,startY=100,finishX=0,finishY=0);width:95%;">
				</div>
			</div>
			<div class="col-xs-3">
				<img src="img/17.jpg" width="314" height="206">
			</div>
			<div class="col-xs-5">
				<div class="biaoti">这是标题，这是标题，这是标题，这是标题,这是标题，这是标题，这是标题，这是标题</div>
				<div class="jiage">
					<p class="biaoti">价格</p>
					<p class="price">¥1800.00</p>
				</div>
				<div class="zhonglei">
					<ul class="dowebok check">
						<li>种植种类:&nbsp;&nbsp;&nbsp;</li>
						<li><input type="checkbox" name="radio" data-labelauty="小白菜"
							style="color:#000"></li>
						<li>&nbsp;&nbsp;&nbsp;</li>
						<li><input type="checkbox" name="radio" data-labelauty="甘蓝"></li>
						<li>&nbsp;&nbsp;&nbsp;</li>
						<li><input type="checkbox" name="radio" data-labelauty="西红柿"></li>
						<li>&nbsp;&nbsp;&nbsp;</li>
						<li><input type="checkbox" name="radio" data-labelauty="花椰菜"></li>
					</ul>
				</div>
				<div class="nianxian">
					<ul class="dowebok check">
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年限:&nbsp;&nbsp;&nbsp;</li>
						<li><input type="radio" name="radio" data-labelauty="半年"
							style="color:#000"></li>
						<li>&nbsp;&nbsp;&nbsp;</li>
						<li><input type="radio" name="radio" data-labelauty="一年"></li>
						<li>&nbsp;&nbsp;&nbsp;</li>
						<li><input type="radio" name="radio" data-labelauty="一年半"></li>
						<li>&nbsp;&nbsp;&nbsp;</li>
						<li><input type="radio" name="radio" data-labelauty="两年"></li>
					</ul>
				</div>
				<div>
					<a href="#"><img src="img/add.png" width="162" height="33"></a>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="price text-center jiage">商品评价</div>
				<div>
					好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊好啊
				</div>
			</div>
		</div>
		<div class="hTitle">
			<div class="first_en fAr">
				<!-- 					<span class="big_en f32"> -->
				<!-- 						<a href="#" Layout="None">DESCRIPTION</a> -->
				<!-- 					</span> -->
				<span class="f18"> <a href="#"></a>
				</span>
			</div>
			<div class="first_china f25">
				<span style="color:#6f6f6f;">商品描述</span>
			</div>
			<hr size="2" color="#6f6f6f"
				style="filter:alpha(opacity=10,finishopacity=100,style=1,startX=100,startY=100,finishX=0,finishY=0);width:95%;">
		</div>
		<div class="col-xs-12">
			描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
		</div>
	</div>

	
	<script src="js/jquery-1.8.3.min.js"></script>
	<script src="js/jquery-labelauty.js"></script>
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
	<script>
$(function(){
	$(':input').labelauty();
});
</script>
</body>
</html>