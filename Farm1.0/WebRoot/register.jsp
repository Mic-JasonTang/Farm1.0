<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>开心农场——注册</title>
<link rel="stylesheet" href="css/style.css" />
<!-- 网站图标 -->
<link rel="shortcut icon" href="ico/mogu.ico" type="image/x-icon" />
<!-- 美化对话框 -->
<script src="./js/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/sweet-alert.css">

<script type="text/javascript" src="./js/getHttpRequest.js"></script>    
	<script type="text/javascript">

	//弹出一个美化的对话框
// 	swal("Good job!", "You clicked the button!", "success");
	function trim(str){ //删除左右两端的空格
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}
		window.onload=function(){
			//文字飞入效果
			$(".connect p").eq(0).animate({"left":"0%"}, 600);
			$(".connect p").eq(1).animate({"left":"0%"}, 400);
			//显示对话框
// 			if(${sessionScope.registerSuccess != null}) {
// 				showSuccess();
				<%--
					session.removeAttribute("registerSuccess");
				--%>
// 			}
			if(${sessionScope.registerFaild != null}) {
				showFaild();
				<%
					session.removeAttribute("registerFaild");			
				%>
			}
			
			document.getElementById("username").onblur=function(){
				if(trim(this.value)!="") {
					var xhr = getXmlHttpRequest();
					xhr.onreadystatechange = function(){
						if(xhr.readyState == 4) {
							if(xhr.status == 200) {
								var responseText = xhr.responseText;
								document.getElementById("msg").innerHTML=responseText;
							}
						}
					}
					//Post方式提交
					xhr.open("POST", "/Farm1.0/servlet/UserValidateServlet?time=" + new Date().getTime());
					//服务器端不知道请求类型，告知服务器端MIME类型
					xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
					xhr.send("username=" + trim(this.value));
				}
			}
		}
		function showSuccess(){
			swal({
			  title: "注册成功",
			  text: "2秒之后自动登录",
			  timer: 2000
			});
		}
		function showFaild(){
			sweetAlert("Soory...", "注册失败!", "error");
		}
	</script>
</head>
<body>

<div class="register-container">
	<h1>请您注册</h1>
	
	<div class="connect">
		<p><font size="5">www.lenong.com</font></p>
	</div>
	
	<form action="${pageContext.request.contextPath }/servlet/RegisterServlet" method="post" id="registerForm">
		<div>
			<input type="text" id="username" name="username" class="username" placeholder="您的用户名" autocomplete="off"/>
			<font color="red">*</font>
			<br>
			<br>
			<span id="msg" ></span>
		</div>
		<div>
			<input type="password" id="password" name="password" class="password" placeholder="输入密码" oncontextmenu="return false" onpaste="return false" />
			<font color="red">*</font>
		</div>
		<div>
			<input type="password" id="confirm_password" name="confirm_password" class="confirm_password" placeholder="再次输入密码" oncontextmenu="return false" onpaste="return false" />
			<font color="red">*</font>
		</div>
		<div>
			<input type="text" name="phone_number" class="phone_number" placeholder="输入手机号码" autocomplete="off" id="number"/>
			<font color="red">*</font>
		</div>
		<div>
			<input type="email" name="email" class="email" placeholder="输入邮箱地址" oncontextmenu="return false" onpaste="return false" />
			<font color="red">*</font>
		</div>
		<div>
			<input type="address" name="address" class="address" placeholder="请输入地址：省-市-小区-门牌号" oncontextmenu="return false" onpaste="return false" />
			<font color="red">*</font>
		</div>
		<button id="submit" type="submit">注 册 </button>
	</form>
	<a href="login.jsp">
		<button type="button" class="register-tis">已经有账号？</button>
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