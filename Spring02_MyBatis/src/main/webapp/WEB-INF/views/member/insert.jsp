<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/member/insert.jsp</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<p><strong>${param.name}</strong> 님의 정보를 추가했습니다.</p>
		<a href="${pageContext.request.contextPath}/member/list">확인</a>
	</div>
</body>
</html>