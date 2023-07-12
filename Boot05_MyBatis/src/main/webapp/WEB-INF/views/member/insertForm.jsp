<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/member/insertForm.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1>멤버 추가 폼입니다.</h1>
		<form class="form" action="insert" method="post">
			<label for="name">이름</label>
			<input type="text" name="name" id="name"/>
			<label for="addr">주소</label>
			<input type="text" name="addr" id="addr"/>
			<button type="submit">추가</button>
		</form>
	</div>
</body>
</html>