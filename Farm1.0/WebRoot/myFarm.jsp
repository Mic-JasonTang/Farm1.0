<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>我的农场</title>
	<!-- 网站图标 -->
	<link rel="shortcut icon" href="ico/mogu.ico" type="image/x-icon" />
	<link rel="stylesheet" href="css/base.css" />
	<link rel="stylesheet" href="css/layout.css"/>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/remark.js"></script>
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
						<a href="index.jsp" target="_blank">首页</a>
						<a class="active" href="#">我的农场</a>
						<a  href="update.jsp" target="_blank">信息更新</a>
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
							<h4>我的土地</h4>
						</div>
					</li>
					<li>
						<div class="step_inner">
							<span class="icon_step">2</span>
							<h4>我的果树</h4>
						</div>
					</li>
					<li>
						<div class="step_inner fr">
							<span class="icon_step">3</span>
							<h4>我的购买</h4>
						</div>
					</li>
				</ol>
				<div class="step_line"></div>
			</div>
			<div class="content">
				<div id="step1" class="step hide">
                <ul>
                  <li>
                  <table width="100%" border="0">
  <tr>
    <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">宝贝</th>
    <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">宝贝详情</th>
    <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">实付款</th>
    <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">状态</th>
    <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">评价</th>
    </tr>
    <tr>
    <td width="16%"><img src="img/17.jpg" width="100" height="100"></td>
    <td width="43%">
    <p>商品名：北方富锌山土壤</p>
    <p>商家名：xxxx</p>
    </td>
    <td width="18%">48.00</td>
    <td width="10%" class="unfinish">未完成</td>
    <td width="23%"><a class="reg-header tx" href="javascript:void(0);">评价</a></td>
  </tr>
</table>

                  </li>
                 </ul>
				</div><!-- // step1 end -->
				<div id="step2" class="step hide">
						 <ul>
                           <li>
                            <table width="100%" border="0">
                             <tr>
                               <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">宝贝</th>
                               <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">宝贝详情</th>
                               <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">实付款</th>
                                <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">状态</th>
                               <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">操作</th>
                             </tr>
                             <tr>
                             <td width="16%"><img src="img/pear.jpg" width="100" height="100"></td>
                             <td width="43%">
                             <p>商品名：酥梨</p>
                             <p>商家名：xxxx</p>
                             </td>
                             <td width="18%">48.00</td>
                             <td width="10%" class="unfinish">未完成</td>
                             <td width="23%"><a class="reg-header tx" href="javascript:void(0);">评价</a></td>
                             </tr>
                             </table>
                             </li>
                             </ul>
				</div><!-- // step2 end -->
				<div id="step3" class="step hide">
					<ul>
                           <li>
                            <table width="100%" border="0">
                             <tr>
                               <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">宝贝</th>
                               <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">宝贝详情</th>
                               <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">实付款</th>
                                <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">状态</th>
                               <th style="padding-top:8px;padding-bottom:8px;font-weight:400;">操作</th>
                             </tr>
                             <tr>
                             <td width="16%"><img src="img/29.jpg" width="100" height="100"></td>
                             <td width="43%">
                             <p>商品名：黄瓜</p>
                             <p>商家名：xxxx</p>
                             </td>
                             <td width="18%">48.00</td>
                             <td width="10%" class="unfinish">未完成</td>
                             <td width="23%"><a class="reg-header tx" href="javascript:void(0);">评价</a></td>
                             </tr>
                             </table>
                             </li>
                             </ul>
				</div><!-- // step3 end -->
			</div>
		</div><!-- // container end -->
	</div><!-- // wrapper end -->
    <div class="reg">
    <div class="reg-title">用户评价<span><a href="javascript:void(0);" class="close-reg">关闭</a></span></div>
    <div class="reg-input-content">
        <div class="reg-input">
            <label>评价商品</label>
            <textarea name="description" cols="50" rows="6"></textarea>
        </div>
    </div>
    <div class="reg-button"><a href="javascript:void(0);" id="reg-button-submit">提交</a></div>
</div>
	<script> 
		//显示提示框，目前三个参数(txt：要显示的文本；time：自动关闭的时间（不设置的话默认1500毫秒）；status：默认0为错误提示，1为正确提示；)
		function showTips(txt,time,status)
		{
			var htmlCon = '';
			if(txt != ''){
				if(status != 0 && status != undefined){
					htmlCon = '<div class="tipsBox" style="width:220px;padding:10px;background-color:#4AAF33;border-radius:4px;-webkit-border-radius: 4px;-moz-border-radius: 4px;color:#fff;box-shadow:0 0 3px #ddd inset;-webkit-box-shadow: 0 0 3px #ddd inset;text-align:center;position:fixed;top:25%;left:50%;z-index:999999;margin-left:-120px;"><img src="images/ok.png" style="vertical-align: middle;margin-right:5px;" alt="OK，"/>'+txt+'</div>';
				}else{
					htmlCon = '<div class="tipsBox" style="width:220px;padding:10px;background-color:#D84C31;border-radius:4px;-webkit-border-radius: 4px;-moz-border-radius: 4px;color:#fff;box-shadow:0 0 3px #ddd inset;-webkit-box-shadow: 0 0 3px #ddd inset;text-align:center;position:fixed;top:25%;left:50%;z-index:999999;margin-left:-120px;"><img src="images/err.png" style="vertical-align: middle;margin-right:5px;" alt="Error，"/>'+txt+'</div>';
				}
				$('body').prepend(htmlCon);
				if(time == '' || time == undefined){
					time = 1500; 
				}
				setTimeout(function(){ $('.tipsBox').remove(); },time);
			}
		}
		
		$(function(){
			
			//切换步骤（目前只用来演示）
			$('.processorBox li').click(function(){
				var i = $(this).index();
				$('.processorBox li').removeClass('current').eq(i).addClass('current');
				$('.step').fadeOut(300).eq(i).fadeIn(500);
			});
		});
	</script>
</body>
</html>