<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- saved from url=(0072)http://www.zhangxinxu.com/study/201109/html5-file-image-ajax-upload.html -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卖家中心</title>
<link rel="stylesheet" href="css/demo.css" type="text/css">
<link rel="stylesheet" href="css/base.css" type="text/css">
<link rel="stylesheet" href="css/layout.css" type="text/css">
<style>
.upload_box{width:800px; margin:1em auto;}
.upload_main{border-width:1px 1px 2px; border-style:solid; border-color:#ccc #ccc #ddd; background-color:#fbfbfb;}
.upload_choose{padding:1em;}
.upload_drag_area{display:inline-block; width:60%; padding:4em 0; margin-left:.5em; border:1px dashed #ddd; background:#fff url(http://rescdn.qqmail.com/zh_CN/htmledition/images/func/dragfile07bf38.gif) no-repeat 20px center; color:#999; text-align:center; vertical-align:middle;}
.upload_drag_hover{border-color:#069; box-shadow:inset 2px 2px 4px rgba(0, 0, 0, .5); color:#333;}
.upload_preview{border-top:1px solid #bbb; border-bottom:1px solid #bbb; background-color:#fff; overflow:hidden; _zoom:1;}
.upload_append_list{height:300px; padding:0 1em; float:left; position:relative;}
.upload_delete{margin-left:2em;}
.upload_image{max-height:250px; padding:5px;}
.upload_submit{padding-top:1em; padding-left:1em;}
.upload_submit_btn{display:none; height:32px; font-size:14px;}
.upload_loading{height:250px; background:url(http://www.zhangxinxu.com/study/image/loading.gif) no-repeat center;}
.upload_progress{display:none; padding:5px; border-radius:10px; color:#fff; background-color:rgba(0,0,0,.6); position:absolute; left:25px; top:45px;}
</style>
<!-- 网站图标 -->
<link rel="shortcut icon" href="ico/mogu.ico" type="image/x-icon" />
<!-- 美化对话框 -->
	<script src="./js/sweet-alert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/sweet-alert.css">
	<script type="text/javascript">
	window.onload=function(){
		if(${sessionScope.saveSuccessInfo != null}) {
			swal("Good job!", "${sessionScope.saveSuccessInfo}", "success");
		}
		if(${sessionScope.uploadInfo != null}) {
			swal("Good job!", "${sessionScope.uploadInfo}", "success");
		}
		if(${sessionScope.saveFailInfo != null}) {
			sweetAlert("Sorry...", "${sessionScope.saveFailInfo}", "error");
		}
		<%
			session.removeAttribute("saveFailInfo");
			session.removeAttribute("saveSuccessInfo");
			session.removeAttribute("uploadInfo");
		%>
	};
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
		<div class="container w960 mt20 head">
			<div id="processor" >
				<ol class="processorBox oh">
					<li>
						<div class="step_inner fl">
							<span class="icon_step">1</span>
							<h4>填写商品基本信息</h4>
						</div>
					</li>
					<li class="current">
						<div class="step_inner">
							<span class="icon_step">2</span>
							<h4>上图上真相</h4>
						</div>
					</li>
				</ol>
				<div class="step_line">
				</div>
				
			</div>
			<div class="content">
			
				<div align="right">
					<a href="sellerCenterPutaway.jsp"><font style="color:#2222FF">&lt;点此继续尚需商品信息&gt;</font></a>
				</div>
				<div id="step1" class="step hide">
					<div id="main">
    <div id="body" class="light">
    	<div id="content" class="show">
            <div class="demo">
            	<form id="uploadForm" action="${pageContext.request.contextPath}/servlet/UploadPhotoServlet" method="post" enctype="Multipart/form-data">
                    <div class="upload_box">
                        <div class="upload_main">
                            <div class="upload_choose">
                                <input id="fileImage" type="file" size="30" name="fileselect[]" multiple="true" class="file-uploader">
                                <span id="fileDragArea" class="upload_drag_area">或者将图片拖到此处</span>
                            </div>
                            <div id="preview" class="upload_preview"></div>
                        </div>
                        <div class="upload_submit">
                        	<input class="upload_submit_btn" id="fileSubmit" type="submit" value="确认上传"/>
<!--                             <button type="button" id="fileSubmit" class="upload_submit_btn">确认上传图片</button> -->
                        </div>
                        <div id="uploadInf" class="upload_inf"></div>
                    </div>
                </form>
            </div>
        </div>       
    </div>
</div>

				</div><!-- // step1 end -->
			</div>
		</div><!-- // container end -->
	</div><!-- // wrapper end -->
<script type="text/javascript" async="" src="js/ga.js"></script>
<script src="js/ca-pub-0090627341039040.js"></script>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/zxxFile.js"></script>
<script>
var params = {
	fileInput: $("#fileImage").get(0),
	dragDrop: $("#fileDragArea").get(0),
	upButton: $("#fileSubmit").get(0),
	url: $("#uploadForm").attr("action"),
	filter: function(files) {
		var arrFiles = [];
		for (var i = 0, file; file = files[i]; i++) {
			if (file.type.indexOf("image") == 0) {
				if (file.size >= 512000) {
					alert('您这张"'+ file.name +'"图片大小过大，应小于500k');	
				} else {
					arrFiles.push(file);	
				}			
			} else {
				alert('文件"' + file.name + '"不是图片。');	
			}
		}
		return arrFiles;
	},
	onSelect: function(files) {
		var html = '', i = 0;
		$("#preview").html('<div class="upload_loading"></div>');
		var funAppendImage = function() {
			file = files[i];
			if (file) {
				var reader = new FileReader();
				reader.onload = function(e) {
					html = html + '<div id="uploadList_'+ i +'" class="upload_append_list"><p><strong>' + file.name + '</strong>'+ 
						'<a href="javascript:" class="upload_delete" title="删除" data-index="'+ i +'">删除</a><br />' +
						'<img id="uploadImage_' + i + '" src="' + e.target.result + '" class="upload_image" /></p>'+ 
						'<span id="uploadProgress_' + i + '" class="upload_progress"></span>' +
					'</div>';
					
					i++;
					funAppendImage();
				}
				reader.readAsDataURL(file);
			} else {
				$("#preview").html(html);
				if (html) {
					//删除方法
					$(".upload_delete").click(function() {
						ZXXFILE.funDeleteFile(files[parseInt($(this).attr("data-index"))]);
						return false;	
					});
					//提交按钮显示
					$("#fileSubmit").show();	
				} else {
					//提交按钮隐藏
					$("#fileSubmit").hide();	
				}
			}
		};
		funAppendImage();		
	},
	onDelete: function(file) {
		$("#uploadList_" + file.index).fadeOut();
	},
	onDragOver: function() {
		$(this).addClass("upload_drag_hover");
	},
	onDragLeave: function() {
		$(this).removeClass("upload_drag_hover");
	},
	onProgress: function(file, loaded, total) {
		var eleProgress = $("#uploadProgress_" + file.index), percent = (loaded / total * 100).toFixed(2) + '%';
		eleProgress.show().html(percent);
	},
	onSuccess: function(file, response) {
		$("#uploadInf").append("<p>上传成功，图片地址是：" + response + "</p>");
	},
	onFailure: function(file) {
// 		$("#uploadInf").append("<p>图片" + file.name + "上传失败！</p>");	
		$("#uploadImage_" + file.index).css("opacity", 0.2);
	},
	onComplete: function() {
		//提交按钮隐藏
		$("#fileSubmit").hide();
		//file控件value置空
		$("#fileImage").val("");
		$("#uploadInf").append("<p>当前图片全部上传完毕，可继续添加上传。</p>");
	}
};
ZXXFILE = $.extend(ZXXFILE, params);
ZXXFILE.init();
</script>
</body>
</html>