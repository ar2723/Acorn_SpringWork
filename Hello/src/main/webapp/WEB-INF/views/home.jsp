<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/home.jsp</title>
</head>
<body>
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		<ul>
						<!-- 
							/hello/ => home.jsp
							/hello/fortune => ?
						 -->
			<li><a href="/hello/fortune">오늘의 운세</a></li>
		</ul>
		<h2>공지사항</h2>
		<ul>
			<c:forEach var="tmp" items="${list}">
				<li>${tmp}</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>