<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/guest/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1 class="text-center h2 pb-2 mb-4 border-bottom border-secondary">방명록</h1>
		<div class="text-end">
			<a class="mb-4"
				href="${pageContext.request.contextPath}/guest/insertform">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
					fill="black" class="bi bi-file-earmark-plus-fill"
					viewBox="0 0 16 16">
  					<path
						d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM8.5 7v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 1 0z" />
				</svg>
			</a>
		</div>
		<table class="table table-striped table-hover">
			<thead class="text-center">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>내용</th>
					<th>작성날짜</th>
					<th>수정하기</th>
					<th>삭제하기</th>
				</tr>
			</thead>
			<tbody class="text-center">
				<c:forEach var="tmp" items="${list}">
					<tr>
						<td>${tmp.num}</td>
						<td>${tmp.writer}</td>
						<td>${tmp.content}</td>
						<td>${tmp.regdate}</td>
						<td><a href="${pageContext.request.contextPath}/guest/updateform?num=${tmp.num}">수정</a></td>
						<td><a href="${pageContext.request.contextPath}/guest/deleteform?num=${tmp.num}">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>