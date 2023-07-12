<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/member/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1 class="text-center">회원 목록 입니다.</h1>
		<div class="d-flex justify-content-end">
			<a href="${pageContext.request.contextPath}/member/insertForm">회원 추가하기</a>
		</div>
		<table class="table table-striped mt-2">
			<thead>
				<tr class="text-center">
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>삭제</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${requestScope.list}">
					<tr class="text-center">
						<td>${tmp.num}</td>
						<td>${tmp.name}</td>
						<td>${tmp.addr}</td>
						<td><a href="delete?num=${tmp.num}">삭제</a></td>
						<td><a href="updateForm?num=${tmp.num}">수정</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>