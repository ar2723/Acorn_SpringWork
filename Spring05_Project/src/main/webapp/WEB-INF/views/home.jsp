<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/home.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/header.css" />
<style>
	h1{
		text-align: center;
	}
</style>
</head>
<body>
	<header>
		<div class="boardList">
			<li><a href="${pageContext.request.contextPath}/cafe/list">자유게시판</a></li>
			<li><a href="${pageContext.request.contextPath}/info/list">공략 & 꿀팁</a></li>
			<li><a href="${pageContext.request.contextPath}/cafe/jobList">직업별 게시판</a></li>
			<li><a href="${pageContext.request.contextPath}/gallery/list">코디 저장소</a></li>
		</div>
		<div class="login">
			<c:choose>
				<c:when test="${empty sessionScope.id}">
					<p>
						<li><a href="${pageContext.request.contextPath}/users/loginform">로그인</a></li>
						<li><a href="${pageContext.request.contextPath}/users/signup_form">회원가입</a></li>
					</p>
				</c:when>
				<c:otherwise>
					<p>
						<li><a href="${pageContext.request.contextPath}/users/info">내 정보</a></li>
						<li><a href="${pageContext.request.contextPath}/users/logout">로그아웃</a></li>
					</p>
				</c:otherwise>
			</c:choose>
		</div>
	</header>
	<div class="container">
		
		<h1>메이플 스토리 커뮤니티에 오신걸 환영합니다</h1>
</body>
</html>