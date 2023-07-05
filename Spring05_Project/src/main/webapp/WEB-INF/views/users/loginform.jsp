<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/loginform.jsp</title>
<style>
	body{
		display: flex;
		width: 100%;
		height: 100vh;
		justify-content: center;
		align-items: center;
	}
	.container{
		width: 350px;
		height: 300px;
		border: 2px solid rgb(246, 133, 0);
		display: flex;
		justify-content: center;
		align-items: center;
	}
	form{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	input{
		width: 300px;
		height: 50px;
		margin-bottom: 10px;
	}
	button{
		
	}
</style>
</head>
<body>
	<div class="container">
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
				<input type="text" name="id" id="id" placeholder="아이디 입력"/>
			</div>
			<div>
				<input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력"/>
			</div>
			<button type="submit">로그인 하기</button>
		</form>
	</div>
</body>
</html>