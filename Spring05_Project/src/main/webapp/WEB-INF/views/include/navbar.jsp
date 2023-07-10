<!-- 이곳은 navbar에 관련된 문자열만 응답하면 된다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = (String)session.getAttribute("id");
%>
<header>
	<div class="boardList">
		<a href="${pageContext.request.contextPath}/"><img style="margin-left:35px"
		src="${pageContext.request.contextPath}/resources/images/pngwing.com.png"
		width="45" height="40" class="d-inline-block align-text-top">
		</a>
			<img style="margin-left:40px" src="${pageContext.request.contextPath}/resources/images/maple.png"
			width="35" height="35" class="d-inline-block">
			<li><a href="${pageContext.request.contextPath}/cafe/list">자유게시판</a></li>
			<img src="${pageContext.request.contextPath}/resources/images/pig.png"
			width="35" height="35" class="d-inline-block">
			<li><a href="${pageContext.request.contextPath}/cafe/classCafeList">직업게시판
			</a></li>
			<img src="${pageContext.request.contextPath}/resources/images/blueSA.png"
			width="35" height="35" class="d-inline-block">
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