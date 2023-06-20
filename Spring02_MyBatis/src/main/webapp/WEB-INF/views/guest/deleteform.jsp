<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h2 class="text-center mt-4 mb-4">게시글 삭제 - 비밀번호 확인</h2>
		<h5 class="mb-4 text-center">글을 삭제하시려면 비밀번호을 입력하고 확인버튼을 눌러주세요!</h5>
		<form action="${pageContext.request.contextPath}/guest/delete" method="post">
			<div class="mb-1">
				<label for="num" class="form-label">삭제할 글 번호</label> <input
					type="text" name="num" class="form-control-plaintext" id="num"
					value="" readonly />
			</div>
			<div class="mb-1">
				<label for="pwd" class="form-label">비밀번호 입력</label> <input
					type="text" name="pwd" class="form-control" id="pwd" />
			</div>
			<button type="submit" class="btn btn-dark">확인</button>
			<a href="${pageContext.request.contextPath}/guest/list" class="btn btn-primary">돌아가기</a>
		</form>
	</div>
</body>
</html>