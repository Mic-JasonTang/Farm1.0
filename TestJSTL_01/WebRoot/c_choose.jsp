<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>c:choose 标签实例</title>
</head>
<body>
<c:set var="salary" scope="session" value="${2000*2}"/>
<p>Your salary is : <c:out value="${salary}"/></p>
<c:choose>
    <c:when test="${salary <= 0}">
       Salary is very low to survive.
    </c:when>
    <c:when test="${salary > 1000}">
        Salary is very good.
    </c:when>
    <c:otherwise>
        No comment sir...
    </c:otherwise>
</c:choose>
<br />
<!-- 下面是一个时间的显示 -->
<%
	Calendar now = Calendar.getInstance();
	Integer hour = new Integer(now.get(Calendar.HOUR_OF_DAY));
	request.setAttribute("hour", hour);
%>
<c:choose>
	<c:when test="${hour>=0 && hour <= 11}">
		<c:set var="sayHello" value="上午好！" />
	</c:when>
	<c:when test="${hour>=12 && hour <= 17}">
		<c:set var="sayHello" value="下午好！" />
	</c:when>
	<c:otherwise>
		<c:set var="sayHello" value="晚上好！" />
	</c:otherwise>
</c:choose>
<c:out value="现在时间: ${ hour } 时 , ${ sayHello }"></c:out>
</body>
</html>