<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/home.jsp</title>
</head>
<body>
<!-- 
	[ Spring 프레임워크를 사용하는 근본적인 이유? ]
	 - 프로젝트 규모가 큰 경우에 유지 보수를 편하게 하기 위해서 사용한다.
	 
	 - 클래스들(객체들) 간에 의존 관계가 느슨해야 유지 보수가 편하다.
	 
	 - 어떡게 해야 의존 관계가 느슨해질까?
	 1. 필요한 핵심의존 객체를 직접 생성하지 않고 주입 받아서 사용한다.
	 2. 객체의 생성과 관리를 spring 프레임 워크(servlet-context에서 전담해서 bean으로 관리)에 맡긴다.
	 3. 인터페이스 type을 적극 활용한다.
 -->
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		<ul>
			<li><a href="member/list">회원목록보기</a></li>
			<li><a href="guest/list">방명록보기</a></li>
		</ul>
		<h2>공지사항</h2>
		<ul>
			<c:forEach var="tmp" items="${list}">
				<li>${tmp}</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>