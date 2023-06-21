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
	<div class="container mt-3">
		<h2 class="text-center mt-4">작성 글 수정</h2>
		<form action="${pageContext.request.contextPath}/guest/update" method="post">
			<div class="mb-1">
				<label class="form-label" for="num">글 번호</label> <input
					class="form-control-plaintext" type="text" id="num" name="num"
					value="${dto.num }" readonly />
			</div>
			<div class="mb-1">
				<label class="form-label" for="writer">작성자</label> <input
					class="form-control" type="text" id="writer" name="writer"
					value="${dto.writer }" />
			</div>
			<div class="mb-1">
				<label class="form-label" for="content">수정할 내용</label>
				<textarea class="form-control" id="content" name="content">${dto.content }</textarea>
			</div>
			<div class="mb-1">
				<label class="form-label" for="pwd">비밀번호 입력</label> <input
					class="form-control" type="text" id="pwd" name="pwd" />
			</div>
			<button class="btn btn-dark" type="submit">수정확인</button>
			<button class="btn btn-warning" type="reset">취소</button>
			<a href="list" class="btn btn-primary">돌아가기</a>
		</form>
	</div>
</body>
</html>