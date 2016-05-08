<%@ page language="java" import="java.util.*" isErrorPage="true" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>出错啦!!!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <style type="text/css">
    body {
        overflow:hidden!important;
        padding-top: 120px;
    }
    </style>
    <!-- Le styles -->
    <script type="text/javascript" src="assets/js/jquery.min.js"></script>

    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/loader-style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/signin.css">
    <link rel="stylesheet" href="assets/css/extra-pages.css">


    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="assets/ico/minus.png">
</head>

<body><div id="awwwards" class="right black"><a href="">best websites of the world</a></div>
    <!-- Preloader -->
    <div id="preloader">
        <div id="status">&nbsp;</div>
    </div>


    <div class="logo-error">
        <h1>www.lenong.com
            <span>v1.0</span>
        </h1>
    </div>

    <!-- Main content -->
    <section class="page-error">

        <div class="error-page">
            <h2 class="headline text-info">404</h2>
            <div class="error-content">
                <h3><i class="fa fa-warning text-yellow"></i> Oops! Page not found.</h3>
                <p>
                                                   服 务 器 出 现 了 未 知 错 误 <a class="error-link" href='index.jsp'>点 此 返 回 主 页 </a>
                </p>
                <form class='search-form'>
                    <input type="text" name="search" class='form-control' placeholder="Search">
                </form>
            </div>
            <!-- /.error-content -->
        </div>
        <!-- /.error-page -->

    </section>

    <!--  END OF PAPER WRAP -->
    
    <!-- MAIN EFFECT -->
    <script type="text/javascript" src="assets/js/preloader.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="assets/js/app.js"></script>
    <script type="text/javascript" src="assets/js/load.js"></script>
    <script type="text/javascript" src="assets/js/main.js"></script>

</body>

</html>
