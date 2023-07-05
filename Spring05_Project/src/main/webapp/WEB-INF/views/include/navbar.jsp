<!-- 이곳은 navbar에 관련된 문자열만 응답하면 된다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = (String)session.getAttribute("id");
%>
<nav class="navbar bg-secondary navbar-expand-md" data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand"
			href="/"> <img
			src="https://www.acornacademy.co.kr/img/logo_gn.png" alt="Logo"
			width="140" height="24" class="d-inline-block align-text-top">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarText">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav me-auto">
									<!-- EL로 Jsp에서 넘겨받은 파라미터값을 바로 받아서 활용할 수 있다. -->
				<li class="nav-item"><a id="cafe_list"
					class="nav-link ${param.current eq 'cafe_list' ? 'active' : ''}"
					href="${pageContext.request.contextPath}/cafe/list.jsp">게시판</a>
				</li>
				<li class="nav-item"><a id="file_list"
					class="nav-link ${param.current eq 'file_list' ? 'active' : ''}"
					href="${pageContext.request.contextPath}/file/list.jsp">자료실</a></li>
				<li class="nav-item"><a id="game"
					class="nav-link ${param.current eq 'game' ? 'active' : ''}"
					href="${pageContext.request.contextPath}/private/game.jsp">게임하기</a></li>
				<li class="nav-item"><a id="study"
					class="nav-link ${param.current eq 'study' ? 'active' : ''}"
					href="${pageContext.request.contextPath}/private/study.jsp">공부하기</a></li>
				<li class="nav-item"><a id="test_form"
					class="nav-link ${param.current eq 'test_form' ? 'active' : ''}"
					href="${pageContext.request.contextPath}/test/signup_form.jsp">테스트</a></li>
			</ul>
			<div class="navbar-nav">
				<c:choose>
					<c:when test="${not empty id}">
						<strong><a class="nav-link" href="${pageContext.request.contextPath}/users/private/info.jsp">${id}</a></strong>
						<a class="nav-link" href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
					</c:when>
				<c:otherwise>
						<a class="nav-link ${param.current eq 'signup' ? 'active' : ''}" 
							href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a>
						<a class="nav-link ${param.current eq 'login' ? 'active' : ''}" 
							href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</nav>