<!-- 이곳은 navbar에 관련된 문자열만 응답하면 된다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = (String)session.getAttribute("id");
%>

<!-- 어두운색 계열의 navbar 배경색이면 data-bs-theme="dark" 속성을 추가한다 -->
<!-- navbar-expand-md 는 md 영역 이상에서만 navbar-collapse가 펼쳐지도록 한다. -->
<!-- nav 요소는 div 요소와 거의 동일하며 semantic markup이라는 점에서 차이가 있다. -->
<nav class="navbar bg-secondary navbar-expand-md" data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/"><img
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
					class="nav-link ${param.current eq 'cafe' ? 'active' : ''}"
					href="${pageContext.request.contextPath}/cafe/list">게시판</a>
				</li>
				<li class="nav-item"><a id="file_list"
					class="nav-link ${param.current eq 'file_list' ? 'active' : ''}"
					href="${pageContext.request.contextPath}/file/list">자료실</a></li>
				<li class="nav-item"><a id="gallery_list"
					class="nav-link ${param.current eq 'gallery_list' ? 'active' : ''}"
					href="${pageContext.request.contextPath}/gallery/list">갤러리</a></li>
			</ul>
			<div class="navbar-nav">
				<c:choose>
					<c:when test="${not empty id}">
						<strong><a class="nav-link" ${param.current eq 'info' ? 'active' : ''}
							href="${pageContext.request.contextPath}/users/info">${id}</a></strong>
						<a class="nav-link" href="${pageContext.request.contextPath}/users/logout">로그아웃</a>
					</c:when>
				<c:otherwise>
						<a class="nav-link ${param.current eq 'login' ? 'active' : ''}" 
							href="${pageContext.request.contextPath}/users/loginform">로그인</a>
						<a class="nav-link ${param.current eq 'signup' ? 'active' : ''}" 
							href="${pageContext.request.contextPath}/users/signup_form">회원가입</a>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</nav>