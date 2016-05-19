<%@ page language="java"
	import="java.util.*,com.Jason.ProductInfo.Servlet.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.removeAttribute("productId"); //移出这个属性。
	session.removeAttribute("productClass"); //这2个属性是为了让GetImageInfoServlet来判断是否有数据被添加的
	List<Images> images = (List<Images>)session.getAttribute("images");
	List<Land> lands = (List<Land>)session.getAttribute("lands");
	if(images == null || images.size() == 0) {
		response.sendRedirect(request.getContextPath() + "/servlet/GetImageInfoServlet");
	} else {
		if(lands == null || lands.size() == 0) {
			response.sendRedirect(request.getContextPath() + "/servlet/GetLandInfoServlet");
		} else {
			System.out.println("lands中数组的大小为:" + lands.size());
		}
		System.out.println("images中数组的大小为:" + images.size());
	}
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/type.css" type="text/css">
<title>认领土地</title>
<!-- 网站图标 -->
<link rel="shortcut icon" href="ico/mogu.ico" type="image/x-icon" />
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
<script type="text/css">
		.table{border:solid 1px #add9c0;}
	</script>
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
       	   欢迎您,<a href="myFarm.jsp"><font size="3" color="purple">${sessionScope.username}</font></a>
						<a href="login.jsp"><font size="2" color="#888833">退 出</font></a>
					</c:when>
				</c:choose>
			</li>
			<li class="list"><a class="tx" href="index.jsp" target="_black">首页</a>
				<span>|</span> <a class="tx" href="#" target="_black">认领土地</a> <span>|</span>
				<a class="tx" href="rentTree.jsp" target="_black">认领果树</a> <span>|</span>
				<a class="tx" href="purchase.jsp" target="_black">开心购买</a> <span>|</span>
				<a class="tx" href="experience.jsp" target="_black">开心体验</a> <span>|</span>
				<a class="tx" href="myFarm.jsp" target="_black">我的农场</a> <span>|</span>
				<a class="tx" href="sellerCenterPutaway.jsp" target="_black">卖家中心</a>
			</li>
		</ul>
	</div>
	<table width="100%" border="0" style="padding-left:3%;">
		<tr>
			<td style="padding-left:3%;"><img src="img/0.png" width="217"
				height="112"></td>
			<td><form action="" method="get">
					<li class="kuan"><input name="" type="text" name="search"
						placeholder="请输入搜索内容" autocomplete="off"
						style="width:450px; height:38px; background:url(img/kuang.jpg) no-repeat; border:none;" />
					</li>
					<!--搜索框-->
					<li class="an"><input name="" type="button" name="button"
						style="width:98px; height:38px; background:url(img/an.jpg) no-repeat; border:none;" />
					</li>
					<!--搜索按钮-->
				</form></td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="hTitle">
					<div class="first_en fAr" style="padding-left:3%;">
						<span class="big_en f32"><a href="#" Layout="None">RENT
								LAND</a></span><span class="f18"><a href="#"></a></span>
					</div>
					<div class="first_china f25" style="padding-left:3%;">
						<a href="#" Layout="None" style="color:#6f6f6f;">认领土地</a> <a
							class="f18" href="#" style="padding-left:5%;;">按距离</a> <span
							class="f18">|</span> <a class="f18" href="#">按人气</a>
					</div>
					<hr size="2" color="#6f6f6f"
						style="filter:alpha(opacity=10,finishopacity=100,style=1,startX=100,startY=100,finishX=0,finishY=0);width:95%;">
				</div>
			</td>
		</tr>
	</table>
	<div id="menu" style="padding-top:5%;">
		<table style="padding-left:10%;">
			<!-- 		循环输出商品信息 -->
			<c:forEach var="i" begin="1" end="${sessionScope.lands.size()}">
				<c:if test="${(i-1) % 4 == 0}">
					<tr>
					<tr>
					<tr>
				</c:if>
					<td width="20%">
<!-- 				        <c:out value="${i }" /> -->
						<ul style="padding-left:5%;">
							<li><a href="product_detail.jsp"><img src="${sessionScope.images.get(i-1).relativePath}"
									style="width: 300px; height: 220px;" /></a>
								<p id="title" style="color:green">
									<img src="product_ico/tuijian.gif"> ${sessionScope.lands.get(i-1).productName}
								</p>
								<p id="price" style="color:#FF3300;font-size:20px;">
									¥&nbsp;&nbsp;${sessionScope.lands.get(i-1).price}</p>
								<p id="description"><strong style="color:#7744A8">一句话描述：</strong><br><br>${sessionScope.lands.get(i-1).description}</p>
								<p id="description"><span style="color:#77CCFF">所在地：</span>${sessionScope.lands.get(i-1).address}</p>
								<p id="description"><span style="color:#77CCFF">发布日期：</span>${sessionScope.lands.get(i-1).date}</p>
								<p id="contect">
									<img src="img/001.png" width="80" height="30" />
								</p></li>
						</ul>
					</td>
				
			</c:forEach>
		</table>
	</div>
</body>
</html>
