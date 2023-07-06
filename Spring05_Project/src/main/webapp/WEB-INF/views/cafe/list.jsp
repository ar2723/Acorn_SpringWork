<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/header.css" />
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="/WEB-INF/views/include/navbar.jsp"></jsp:include>
	<div class="container">
		<h3 class="mt-2 mb-2 d-flex justify-content-center align-items-center">
		<img src="${pageContext.request.contextPath}/resources/images/maple.png"
			width="50" height="50">자유게시판</h3>
		<table class="table">
			<thead class="border-dark text-center">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td class="text-center">${tmp.num }</td>
						<td>
							<a class="link-dark" 
								href="${pageContext.request.contextPath}/cafe/detail?
								num=${tmp.num}&condition=${condition}&keyword=${encodedK}">${tmp.title}</a>
						</td>
						<td class="text-center">${tmp.writer}</td>
						<td class="text-center">${tmp.viewCount}</td>
						<td class="text-center">${tmp.regdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<li class="d-flex justify-content-end">
			<a class="btn btn-secondary" href="${pageContext.request.contextPath}/cafe/insertform">글쓰기</a>
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
			//querySelectorAll()은 배열을 반환하기 때문에 바로 .addEventListener()를 사용할수는 없고 
			//forEach(item)으로 각 배열의 원소(item)별로 .addEventListener()를 붙여주면 된다.
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
		<div class="d-flex justify-content-center">
			<form class="d-flex" action="list" method="get">
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
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>





