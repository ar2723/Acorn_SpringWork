<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/loginform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/header.css" />
<style>
</style>
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="/WEB-INF/views/include/navbar.jsp"></jsp:include>
	<div class="container">
		<div style="margin: 10% auto; width: 500px;">
			<form action="${pageContext.request.contextPath}/users/login" method="post">
				<c:choose>
					<c:when test="${ empty param.url }">
						<input type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="url" value="${param.url }"/>
					</c:otherwise>
				</c:choose>
				<div>
					<input style="height:50px" class="form-control mt-3" type="text" name="id" id="id" placeholder="아이디 입력"/>
				</div>
				<div>
					<input style="height:50px" class="form-control mt-3" type="password" name="pwd" id="pwd" placeholder="비밀번호 입력"/>
				</div>
				<div class="d-flex justify-content-center mt-4">
					<button class="me-3 btn btn-primary" type="submit">로그인 하기</button>
					<a class="btn btn-info" href="${pageContext.request.contextPath}/users/signup_form">회원가입하기</a>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>