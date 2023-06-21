<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar bg-secondary navbar-expand-md" data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/index.jsp"> <img
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
			</ul>
		</div>
	</div>
</nav>