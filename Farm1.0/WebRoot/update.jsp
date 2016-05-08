<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>自助服务</title>
	<link rel="stylesheet" href="css/base.css" />
	<link rel="stylesheet" href="css/layout.css"/>
	<!-- 网站图标 -->
	<link rel="shortcut icon" href="ico/mogu.ico" type="image/x-icon" />
	<!-- 美化对话框 -->
	<script src="./js/sweet-alert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/sweet-alert.css">
	<script type="text/javascript">
	window.onload=function(){
		if(${sessionScope.UpdateInfo != null}) {
			swal("Good job!", "${sessionScope.UpdateInfo}", "success");
		}
		<%
			session.removeAttribute("UpdateInfo");
		%>
	}
	</script>
</head>
<body>
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
			</div>
			<div id="headBox">
				<div class="w960 oh">
					<nav id="navs" class="fr">
						<a href="index.jsp" target="view_window">首页</a>
						<a href="myFarm.jsp" target="view_window">我的农场</a>
						<a class="active" href="#">信息更新</a>
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
							<h4>修改基本信息</h4>
						</div>
					</li>
				</ol>
				<ol>
					<h4  align="right"><font color="#33FF22">Tips : 填写需要修改的信息点击提交</font></h4>
				</ol>
				<div class="step_line"></div>
			</div>
			<div class="content">
				<div id="step1" class="step hide">
					<form action="${pageContext.request.contextPath }/servlet/UpdateServlet" method="post" id="step1_frm" name="update">
						<div class="frm_control_group">
							<label class="frm_label">手机号</label>
							<div class="frm_controls">
								<input type="text" name="phoneNum" maxlength="32" class="frm_input"/>
								<p class="frm_tips">注册手机号</p>
							</div>
						</div>
                        <div class="frm_control_group">
							<label class="frm_label">收货地址</label>
							<div class="frm_controls">
								<input type="text" name="address" maxlength="32" class="frm_input"/>
								<p class="frm_tips">您的真实地址</p>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">Email地址</label>
							<div class="frm_controls">
								<input type="text" name="email" maxlength="32" class="frm_input"/>
								<p class="frm_tips">Email邮箱地址</p>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">新密码</label>
							<div class="frm_controls">
								<input type="password" name="password" class="frm_input passwd"/>
								<p class="frm_tips">字母、数字或者英文符号，最短6位，区分大小写</p>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">确认密码</label>
							<div class="frm_controls">
								<input type="password" name="password_again" class="frm_input passwd2"/>
							</div>
						</div>
						<div class="toolBar">
<!-- 							<a id="nextBtn" class="btn btn_primary" href="javascript:;">提交</a> -->
								<input type="submit" id="nextBtn" class="btn btn_primary" value="提交"/>
						</div>
					</form>
				</div><!-- // step1 end -->
	</div><!-- // wrapper end -->
</body>
</html>