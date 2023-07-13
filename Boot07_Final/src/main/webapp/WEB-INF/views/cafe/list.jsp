<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	.container{
		width: 768px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="cafe" name="current"/>
	</jsp:include>
	<h3 class="text-center">카페 게시판</h3>
	<div class="container">
		<div class="d-flex justify-content-end">
			<a href="${pageContext.request.contextPath}/cafe/insertform">새글 작성</a>
		</div>
		<table class="table table-striped">
			<thead class="table-dark">
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.num }</td>
						<td>${tmp.writer }</td>
						<td>
							<a href="${pageContext.request.contextPath}/cafe/detail?
									num=${tmp.num}&condition=${condition}&keyword=${encodedK}">${tmp.title}</a>
						</td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav>
			<ul class="pagination">
				<%--
					startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다.
					만약, PAGE_DISPLAY_COUNT가 5라면, 5페이지를 불러올때까지  startPageNum은 1이고
					6페이지를 불러올때 startPageNum이 6이 되기 때문에  Prev 링크가 나타나게 된다.
					
					&condition=${condition}&keyword=${encodedK}
				 --%>
				<c:if test="${startPageNum ne 1}">
					<li class="page-item">
						<a class="page-link" href="list?pageNum=${startPageNum-1}&condition=${condition}&keyword=${encodedK}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
					<li class="page-item ${pageNum eq i ? 'active' : '' }">
						<a class="page-link animate__animated" href="list?pageNum=${i}&condition = ${condition}&keyword=${encodedK}">${i}</a>
					</li>
				</c:forEach>
				<%--
					마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다.
					만약, 6페이지를 불러올 때 전체 페이지 갯수가 12개 그리고
					PAGE_DISPLAY_COUNT가 5이면 10페이지가 마지막 페이지 번호이고 옆에 Next 링크가 나타난다.
				 --%>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="list?pageNum=${endPageNum+1}&condition=${condition}&keyword=${encodedK}">Next</a>
					</li>
				</c:if>				
			</ul>
		</nav>
		<script>
			document.querySelectorAll(".pagination a").forEach((item)=>{
				//item은 li의 참조값이다 모든 li 요소에 mouseover 이벤트가 발생했을 때 실행할 함수 등록
				item.addEventListener("mouseover", (e)=>{
					//애니메이션 클래스를 추가해서 애니메이션이 동작하도록 한다.
					e.target.classList.add("animate__swing")
				})
				//item은 li의 참조값이다 모든 li 요소에 mouseover 이벤트가 발생했을 때 실행할 함수 등록
				item.addEventListener("animationend", (e)=>{
					//애니메이션 클래스를 제거해서 다은 번에 추가되면 다시 애니메이션이 동작되도록 한다.
					e.target.classList.remove("animate__swing")
				})
			})
		</script>
		
		<!-- 검색 폼 -->
		<form action="list" method="get">
			<label for="condition">검색조건</label>	
			<select name="condition" id="condition">
				<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목 + 내용</option>
				<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
				<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
			</select>
			<input type="text" name="keyword" placeholder="검색어..." value="${keyword }"/>
			<button type="submit">검색</button>
		</form>
		<c:if test="${not empty condition}">
			<p>
				<strong>${totalRow }</strong> 개의 자료가 검색 되었습니다.
				<a href="list">리셋</a>
			</p>
		</c:if>
	</div>
	
</body>
</html>





