<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>&lt;c:url&gt;</title>
  </head>
  <body>
    <c:url var="url" value="c_url.jsp">
    	<c:param name="arg1" value="1" />
    	<c:param name="arg2" value="2" />
    </c:url>
    <a href='<c:out value="${url }" />'>链接回本页面(<c:out value="${url }" />)</a>
  </body>
</html>
