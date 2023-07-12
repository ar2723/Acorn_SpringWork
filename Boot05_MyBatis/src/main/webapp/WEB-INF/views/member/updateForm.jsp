<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/member/updateForm.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1>수정 폼입니다.</h1>
		<form class="form" action="update" method="post">
			<label class="form-label" for="num">번호</label>
			<input class="form-control" type="text" name="num" id="num" value="${dto.num}" readonly/>
			<label class="form-label" for="name">이름</label>
			<input class="form-control" type="text" name="name" id="name" value="${dto.name}"/>
			<label class="form-label" for="addr">주소</label>
			<input class="form-control" type="text" name="addr" id="addr" value="${dto.addr}"/>
			<div class="mt-2">
				<button class="btn btn-primary" type="submit">수정하기</button>
				<button class="btn btn-secondary" type="reset">리셋</button>
			</div>
		</form>
	</div>
</body>
</html>