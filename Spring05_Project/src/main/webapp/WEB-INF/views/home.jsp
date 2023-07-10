<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/home.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/header.css" />
<style>
	h1{
		text-align: center;
	}
   /* card 이미지 부모요소의 높이 지정 */
   .img-wrapper{
      height: 150px;
      /* transform 을 적용할 때 0.3s 동안 순차적으로 적용하기 */
      transition: transform 0.3s ease-out;
      display: flex;
      justify-content: center;
      align-items: center;
   }
   
   /* 화면의 폭이 575px 이하일 때 적용할 css */
   @media(max-width: 575px){
   		.img-wrapper{
   			height: 400px;
   		}
   }
   .card .card-text{
      /* 한줄만 text 가 나오고  한줄 넘는 길이에 대해서는 ... 처리 하는 css */
      display:block;
      text-align: center;
      white-space : nowrap;
      text-overflow: ellipsis;
      overflow: visible;
   }
      .img-wrapper img{
         width: 60%;
         height: 60%;
      	 object-fit: cover;   
      }
</style>
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="/WEB-INF/views/include/navbar.jsp"></jsp:include>
	<h2 style="backGround-color:rgb(246, 133, 0); color:white;" class="text-center">메이플 인소야에 오신걸 환영합니다</h2>
	<div class="p-3 mt-2" style="height:auto">
		<div class="row">
			<div class="col">
				<a class="link-dark" href="${pageContext.request.contextPath}/">
				<h3><img src="${pageContext.request.contextPath}/resources/images/pngwing.com.png"
				width="45" height="40" class="d-inline align-text-top">페이지 소개</h3></a>
				<ul class="mt-4">
					<li class="mt-4">국내 온라인 게임 '메이플스토리' 유저들을 위한 커뮤니티 페이지를 제작해 보았습니다.</li>
					<li class="mt-4">총 2개의 게시판, 1개의 갤러리를 구현하였습니다. </li>
					<li class="mt-4">CSS는 Bootstrap 기반으로 디자인 되었습니다.</li>
					<li class="mt-4">일부 페이지 디자인은 '인벤' 이라는 사이트를 참조했습니다.</li>
				</ul>
			</div>
			<div class="col">
			<h3 class="d-flex align-items-center">
			<a class="link-dark" href="${pageContext.request.contextPath}/cafe/list">
			<img src="${pageContext.request.contextPath}/resources/images/maple.png"
				width="50" height="50">자유게시판</h3></a>
			<table class="table">
				<thead class="text-center">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${cafeList}">
						<tr>
							<td class="text-center">${tmp.num}</td>
							<td>
								<a class="link-dark" 
									href="${pageContext.request.contextPath}/cafe/detail?
									num=${tmp.num}">${tmp.title}</a>
							</td>
							<td class="text-center">${tmp.viewCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col">
				<a class="link-dark" href="${pageContext.request.contextPath}/cafe/classCafeList">
					<h3 class="d-flex align-items-center">
						<img src="${pageContext.request.contextPath}/resources/images/pig.png"
						width="50" height="50">직업게시판
					</h3>
				</a>
			<table class="table">
				<thead class="text-center">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>추천</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${classCafeList}">
						<tr>
							<td class="text-center">${tmp.num}</td>
							<td>
							<c:choose>
							<c:when test="${tmp.className == 'warrior'}">
								<small style="color:orange">[전사] </small>
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
							<td class="text-center">${tmp.likeCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="col mt-2">
				<a class="link-dark" href="${pageContext.request.contextPath}/gallery/list">
					<h3 class="mt-2 mb-2 d-flex align-items-center"><img src="${pageContext.request.contextPath}/resources/images/blueSA.png"
				width="50" height="50">유저 코디 모음</h3>
					<div class="row">
				</a>
			      <c:forEach var="tmp" items="${galleryList}">
			         <div class="col-4">
		               <div class="card text-bg-dark mb-3 max-width: 9rem">
			               <div class="card-body d-flex justify-content-between">
				               <p class="card-text"><strong>${tmp.writer}</strong></p>
				               <p><small>${tmp.regdate}</small></p>
				           </div>
			               <a href="#">
			                     <div class="img-wrapper">
			                        <img class="card-img-top" src="${pageContext.request.contextPath}${tmp.imagePath}" />
			                     </div>
			               </a>
			               <div class="card-body">
			                     <p class="card-title">${tmp.caption}</p>
			               </div>
		               </div>
		            </div>
			      </c:forEach>
	      		</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>