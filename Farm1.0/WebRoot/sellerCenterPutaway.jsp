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
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/layout.css"/>
<title>卖家中心</title>
<!-- 网站图标 -->
<link rel="shortcut icon" href="ico/mogu.ico" type="image/x-icon" />
<!-- 美化对话框 -->
	<script src="./js/sweet-alert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/sweet-alert.css">
	<script type="text/javascript">
	window.onload=function(){
		if(${sessionScope.uploadInfo != null}) {
			sweetAlert("Sorroy...", "${sessionScope.uploadInfo}", "error");
		}
		<%
			session.removeAttribute("uploadInfo");
		%>
	};
	function checkForm(form){
		if(trim(form.name.value) == "") {
			swal({
			  title: "商品名不能为空!",
			  text: "I will close in 2 seconds.",
			  timer: 2000
			});
			return false;
		}
		if(trim(form.price.value) == "") {
			swal({
			  title: "商品价格不能为空!",
			  text: "I will close in 2 seconds.",
			  timer: 2000
			});
			return false;
		}
		if(trim(form.address.value) == "") {
			swal({
			  title: "您的地址不能为空!",
			  text: "I will close in 2 seconds.",
			  timer: 2000
			});
			return false;
		}
		if(trim(form.description.value) == "") {
			swal({
			  title: "商品描述不能为空!",
			  text: "I will close in 2 seconds.",
			  timer: 2000
			});
			return false;
		}
		return true;
	}
	function trim(string) {
	    return string.replace(/(^\s*)|(\s*$)/g,'');
	}

	</script>
</head>
<div id="wrapper">
		<header id="header">
			<div id="loginBar">
				<div class="w960 tr">
					<c:choose>
						<c:when test="${sessionScope.username !=null}">
							<span class="sp">用户名</span>
							<a href="#">${sessionScope.username}</a> |
							<a href="login.jsp" >退出</a>
						</c:when>
						<c:when test="${sessionScope.username == null}">
							<a href="login.jsp">请登录</a>
							<span class="sp"></span>
							<a href="#"></a>
						</c:when>
					</c:choose>
				</div>
			</div>
			<div id="headBox">
				<div class="w960 oh">
					<a href="#" class="fl mt10"></a>
					<nav id="navs" class="fr">
						<a href="index.jsp" target="_blank">首页</a>
						<a class="active" href="#">卖家中心</a>
					</nav>
				</div>
			</div>
		</header><!-- // header end -->
		<div class="container w960 mt20">
			<div id="processor" >
				<ol class="processorBox oh">
					<li class="current">
						<div class="step_inner fl">
							<span class="icon_step">1</span>
							<h4>填写商品基本信息</h4>
						</div>
					</li>
					<li>
						<div class="step_inner">
							<span class="icon_step">2</span>
							<h4>上图上真相</h4>
						</div>
					</li>
				</ol>
				<div class="step_line"></div>
			</div>
			<div class="content">
				<div id="step1" class="step hide">
					<form action="${pageContext.request.contextPath}/servlet/PutawayServlet" method="post" id="step1_frm" onsubmit="return checkForm(this)">
						<div class="frm_control_group">
							<label class="frm_label">商品名称</label>
							<div class="frm_controls">
								<input id="name" type="text" name="productName" maxlength="32" class="frm_input" placeholder="请输入商品名称" autocomplete="off"/>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">商品类别</label>
							<div class="frm_controls">
								<select name="productClass" class="frm_input">
								<option>土地</option>
								<option>果树</option>
								</select>
								<p class="frm_tips">土地/果树（任选其一）</p>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">商品价格</label>
							<div class="frm_controls">
								<input id="price" type="text" name="productPrice" class="frm_input"  placeholder="商品价格(如:35.00)元" autocomplete="off"/>
							</div>
						</div>
                        <div class="frm_control_group">
							<label class="frm_label">地址</label>
							<div class="frm_controls">
								<input id="address" type="text" name="address" class="frm_input" placeholder="请输入您的所在地" autocomplete="off"/>
							</div>
						</div>
                        <div class="frm_control_group">
							<label class="frm_label">宝贝描述</label>
							<div class="frm_controls">
                               <textarea id="description" name="description" cols="50" rows="6" class="frm_textarea" placeholder="请输入商品描述" autocomplete="off"></textarea>
							</div>
						</div>
						<div class="toolBar">
							<input type="submit" value="下一步"  id="nextBtn" class="btn btn_primary" />
<!-- 							<a id="nextBtn" class="btn btn_primary" href="sellerCenterUploadPhotoes.jsp">下一步</a> -->
						</div>
					</form>
				</div><!-- // step1 end -->
			</div>
		</div><!-- // container end -->
	</div><!-- // wrapper end -->
</body>
</html>
