<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/login.jsp</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<c:choose>
			<c:when test="${not empty sessionScope.id }">
				<script>
					alert("${id}님 로그인 되었습니다.");
					location.href="${url}";
				</script>
			</c:when>
			<c:otherwise>
				<script>
					alert("아이디 혹은 비밀번호가 정확하지 않습니다!");
					location.href="loginform?url=${requestScope.encodedUrl}";
				</script>
			</c:otherwise>
		</c:choose>
	</div>	
</body>
</html>