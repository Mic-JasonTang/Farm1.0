<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
session.removeAttribute("username");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>开心农场——登录</title>

<!-- 美化对话框 -->
<script src="./js/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/sweet-alert.css">
<!-- 网站图标 -->
<link rel="shortcut icon" href="ico/mogu.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/login_style.css" />
<script type="text/javascript" src="./js/getHttpRequest.js"></script>    
	<script type="text/javascript">
		window.onload=function(){
			//文字飞入效果
			$(".connect p").eq(0).animate({"left":"0%"}, 600);
			$(".connect p").eq(1).animate({"left":"0%"}, 400);
			if(${sessionScope.loginInfo != null}) {
				sweetAlert("Sorry...", "${sessionScope.loginInfo}", "error");
			}
			<%
				session.removeAttribute("loginInfo");
			%>
 			//验证登陆
/* 			document.getElementById("login").onclick=function(){
				var username = document.getElementById("username").value;
				var password = document.getElementById("password").value;
				var xhr = getXmlHttpRequest();
				alert(xhr);
				Post方式提交
				xhr.open("Post", "/Farm1.0/servlet/LoginServlet?time=" + new Date().getTime());
				服务器端不知道请求类型，告知服务器端MIME类型
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
				xhr.send("username=" + username + "&password=" + password);
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4) {
						if(xhr.status == 200) {
							var responseText = xhr.responseText;
							弹出一个美化的对话框
						 	swal("Good job!", responseText, "success");
						}
					}
				}
			} */
		}
	</script>
</head>
<body>

<div class="login-container">
	<h1>请您登陆</h1>
	
	<div class="connect">
		<p><font size="5">www.lenong.com</font></p>
	</div>
	<form action="${pageContext.request.contextPath }/servlet/LoginServlet" method="post" id="loginForm">
		<div>
			<input type="text" id="username" name="username" class="username" placeholder="用户名" autocomplete="off"/>
			<font color="red">*</font>
		</div>
		<div>
			<input type="password" id="password"name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
			<font color="red">*</font>
		</div>
<!-- 		<input id="login" type="submit" value="登 陆" />  -->
		<button id="submit" type="submit" alt="哈哈">登 陆 </button>
	</form>

	<a href="register.jsp">
		<button type="button" class="register-tis">注册为新用户</button>
	</a>
	<br>
	<a href="index.jsp">
		<button type="button" class="register-tis">游客模式登陆</button>
	</a>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/common.js"></script>
<!--背景图片自动更换-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>
</body>
</html>