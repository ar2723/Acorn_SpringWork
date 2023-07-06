<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/classCafeList.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/header.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp"></jsp:include>
	<div class="container">
		<h3 class="text-center mt-3">직업 게시판</h3>
		<table class="table">
			<thead class="border-dark text-center">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회</th>
					<th>등록일</th>
					<th>추천</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list}">
					<tr>
						<td class="text-center">${tmp.num}</td>
						<td>
						<c:choose>
						<c:when test="${tmp.className == 'warrior'}">
							<small style="color:yellow">[전사] </small>
						</c:when>
						<c:when test="${tmp.className == 'archer'}">
							<small style="color:green">[궁수] </small>
						</c:when>
						<c:when test="${tmp.className == 'thief'}">
							<small style="color:purple">[도적] </small>
						</c:when>
						<c:when test="${tmp.className == 'mage'}">
							<small style="color:blue">[마법사] </small>
						</c:when>
						<c:when test="${tmp.className == 'pirate'}">
							<small style="color:red">[해적] </small>
						</c:when>
						</c:choose>
						<a class="link-dark" 
							href="${pageContext.request.contextPath}/cafe/classCafeDetail?
							num=${tmp.num}&condition=${condition}&keyword=${encodedK}">${tmp.title}</a>
						</td>
						<td class="text-center">${tmp.writer}</td>
						<td class="text-center">${tmp.viewCount}</td>
						<td class="text-center">${tmp.regdate}</td>
						<td class="text-center">${tmp.likeCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<li class="d-flex justify-content-end">
			<a class="btn btn-secondary" href="${pageContext.request.contextPath}/cafe/classCafeInsertform">글쓰기</a>
		</li>
		<nav>
			<ul class="pagination pagination-sm d-flex justify-content-center">
				<%--
					startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다.
					만약, PAGE_DISPLAY_COUNT가 5라면, 5페이지를 불러올때까지  startPageNum은 1이고
					6페이지를 불러올때 startPageNum이 6이 되기 때문에  Prev 링크가 나타나게 된다.
					
					&condition=${condition}&keyword=${encodedK}
				 --%>
				<c:if test="${startPageNum ne 1}">
					<li class="page-item">
						<a class="page-link" href="classCafeList?pageNum=${startPageNum-1}&condition=${condition}&keyword=${encodedK}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
					<li class="page-item ${pageNum eq i ? 'active' : '' }">
						<a class="page-link animate__animated" href="classCafeList?pageNum=${i}&condition = ${condition}&keyword=${encodedK}">${i}</a>
					</li>
				</c:forEach>
				<%--
					마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다.
					만약, 6페이지를 불러올 때 전체 페이지 갯수가 12개 그리고
					PAGE_DISPLAY_COUNT가 5이면 10페이지가 마지막 페이지 번호이고 옆에 Next 링크가 나타난다.
				 --%>
				<c:if test="${endPageNum lt totalPageCount}">
					<li class="page-item">
						<a class="page-link" href="classCafeList?pageNum=${endPageNum+1}&condition=${condition}&keyword=${encodedK}">Next</a>
					</li>
				</c:if>				
			</ul>
		</nav>
		<!-- 검색 폼 -->
		<div class="d-flex justify-content-center">
			<form class="d-flex" action="classCafeList" method="get">
				<select class="form-select" style="width: 150px" name="condition" id="condition">
					<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목 + 내용</option>
					<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
					<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
				</select>
				<input class="form-control" type="text" name="keyword" placeholder="Search" value="${keyword}"/>
				<button class="btn btn-primary" style="width: 120px" type="submit">검색</button>
			</form>
		</div>
	</div>
</body>
</html>