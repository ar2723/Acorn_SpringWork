<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/header.css" />
<style>
   /* card 이미지 부모요소의 높이 지정 */
   .img-wrapper{
   
      height: 250px;
      /* transform 을 적용할대 0.3s 동안 순차적으로 적용하기 */
      transition: transform 0.3s ease-out;
      
   }
   
   /* 화면의 폭이 575px 이하일 때 적용할 css */
   @media(max-width: 575px){
   		.img-wrapper{
   			height: 400px;
   		}
   }
   
   /* .img-wrapper 에 마우스가 hover 되었을때 적용할 css */
   .img-wrapper:hover{
   
      /* 원본 크기의 1.1 배로 확대 시키기*/
      transform: scale(1.1);
      
   }
   
   .card .card-text{
      /* 한줄만 text 가 나오고  한줄 넘는 길이에 대해서는 ... 처리 하는 css */
      display:block;
      white-space : nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
   }
      .img-wrapper img{
         width: 100%;
         height: 100%;
         /* fill | contain | cover | scale-down | none(default) */
         /*   
            cover - 부모의 크기에 맞게 키운 후, 자른다. 비율은 일정하게 증가한다. 
            contain - 안잘린다. 대신 빈 공간이 남을 수 있다.
            fill - 부모의 크기에 딱 맞게, 비율 관계 없이 맞춘다.(이미지가 일그러질 수 있다.)
            scale-down - 가로, 세로 중에 큰 것을 부모의 크기에 맞춘 상태까지만 커지거나 작아지고, 비율은 일정하다.
         */
      object-fit: cover;   
      }
</style>
</head>
<body>
	<header>
		<div class="boardList">
			<li><a href="${pageContext.request.contextPath}/cafe/list">자유게시판</a></li>
			<li><a href="${pageContext.request.contextPath}/info/list">공략 & 꿀팁</a></li>
			<li><a href="${pageContext.request.contextPath}/cafe/classCafeList">직업별 게시판</a></li>
			<li><a href="${pageContext.request.contextPath}/gallery/list">코디 저장소</a></li>
		</div>
		<div class="login">
			<c:choose>
				<c:when test="${empty sessionScope.id}">
					<p>
						<li><a href="${pageContext.request.contextPath}/users/loginform">로그인</a></li>
						<li><a href="${pageContext.request.contextPath}/users/signup_form">회원가입</a></li>
					</p>
				</c:when>
				<c:otherwise>
					<p>
						<li><a href="${pageContext.request.contextPath}/users/info">내 정보</a></li>
						<li><a href="${pageContext.request.contextPath}/users/logout">로그아웃</a></li>
					</p>
				</c:otherwise>
			</c:choose>
		</div>
	</header>
	<div class="container">
	      
	      <h3 class="text-center">코디 저장소</h3>
	      <div class="row">
	      <c:forEach var="tmp" items="${list}">
	         <div class="col-3">
               <div class="card text-bg-light mb-3 max-width: 9rem">
	               <div class="card-body d-flex justify-content-between">
		               <p class="card-text"><strong>${tmp.writer}</strong></p>
		               <p><small>${tmp.regdate}</small></p>
		           </div>
	               <a href="${pageContext.request.contextPath}/gallery/detail?num=${tmp.num}">
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
	      <nav>
	      <a href="${pageContext.request.contextPath}/gallery/upload_form3">내 코디 올리기</a>
	   <ul class="pagination justify-content-center">
	      <c:choose>
	         <c:when test="${startPageNum ne 1}">
	            <li class="page-item">
	                     <a class="page-link" href="${pageContext.request.contextPath}/gallery/list?pageNum=${startPageNum - 1}">Prev</a>
	               </li>
	         </c:when>
	         <c:otherwise>
	            <li class="page-item disabled">
	                     <a class="page-link" href="javascript:">Prev</a>
	               </li>
	         </c:otherwise>
	      </c:choose>
	      <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
	         <c:choose>
	            <c:when test="${i eq pageNum }">
	               <li class="page-item active">
	                        <a class="page-link" href="${pageContext.request.contextPath}/gallery/list?pageNum=${i}">${i }</a>
	                     </li>
	            </c:when>
	            <c:otherwise>
	               <li class="page-item">
	                        <a class="page-link" href="${pageContext.request.contextPath}/gallery/list?pageNum=${i}">${i}</a>
	                     </li>
	            </c:otherwise>
	         </c:choose>
	      </c:forEach>
	      <c:choose>
	         <c:when test="${endPageNum lt totalPageCount }">
	            <li class="page-item">
	                     <a class="page-link" href="${pageContext.request.contextPath}/gallery/list?pageNum=${endPageNum + 1}">Next</a>
	               </li>
	         </c:when>
	         <c:otherwise>
	            <li class="page-item disabled">
	                     <a class="page-link" href="javascript:">Next</a>
	               </li>
	         </c:otherwise>
	      </c:choose>
	      </ul>
	   </nav>   
	</div>
</body>
</html>