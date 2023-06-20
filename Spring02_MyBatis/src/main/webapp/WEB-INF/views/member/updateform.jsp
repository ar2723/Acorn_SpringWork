<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1>회원 정보 수정 폼입니다.</h1>
		<form action="${pageContext.request.contextPath}/member/update" method="post">
			<div>
				<label class="form-label" for="num">번호</label>
				<input class="form-control" type="text" name="num" id="num"/ value="${dto.num}" readonly>
			</div>
			<div>
				<label class="form-label" for="name">이름</label>
				<input class="form-control" type="text" name="name" id="name"/ value="${dto.name}">
			</div>
			<div>
				<label class="form-label" for="addr">주소</label>
				<input class="form-control" type="text" name="addr" id="addr" value="${dto.addr}"/>
			</div>
			<button class="btn btn-primary" type="submit">수정</button>
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>