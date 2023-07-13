<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/pwd_updateform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<style>
	.container{
		width: 768px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="pwd_update" name="current"/>
	</jsp:include>
	<h1 class="text-center">비밀번호 수정</h1>
	<div class="container">
		<form action="${pageContext.request.contextPath}/users/pwd_update" method="post" id="myForm">
			<div>
				<label class="form-label" for="pwd">기존 비밀 번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd"/>
			</div>
			<div>
				<label class="form-label" for="newPwd">새 비밀번호</label>
				<input class="form-control" type="password" name="newPwd" id="newPwd"/>
			</div>
			<div>
				<label class="form-label" for="newPwd2">새 비밀번호 확인</label>
				<input class="form-control" type="password" id="newPwd2"/>
			</div>
			<button class="btn btn-primary" type="submit">수정하기</button>
			<button class="btn btn-secondary" type="reset">리셋</button>
		</form>
	</div>
	<script>
		//폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고 
		document.querySelector("#myForm").addEventListener("submit", function(e){
			let pwd1=document.querySelector("#newPwd").value;
			let pwd2=document.querySelector("#newPwd2").value;
			//새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
			if(pwd1 != pwd2){
				alert("비밀번호를 확인 하세요!");
				e.preventDefault();//폼 전송 막기 
			}
		});
	</script>
</body>
</html>


