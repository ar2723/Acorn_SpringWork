<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<style>
	.container{
		width: 768px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="home" name="current"/>
	</jsp:include>
	<h1 class="text-center">Index</h1>
	<div class="container">
		<h3 style="border-bottom:1px solid black" class="pb-2" >공지사항</h3>
		<ul>
			<c:forEach var="tmp" items="${list}">
				<li>${tmp}</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>