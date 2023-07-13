<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/loginform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<style>
	.container{
		width: 768px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="login" name="current"/>
	</jsp:include>
	<div class="container">
		<h1>로그인</h1>
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
				<label class="form-label" for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id"/>
			</div>
			<div>
				<label class="form-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd"/>
			</div>
			<button class="btn btn-primary" type="submit">로그인</button>
		</form>
	</div>
</body>
</html>