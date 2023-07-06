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
      height: 200px;
      /* transform 을 적용할대 0.3s 동안 순차적으로 적용하기 */
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
   
   /* .img-wrapper 에 마우스가 hover 되었을때 적용할 css */
   .img-wrapper:hover{
   
      /* 원본 크기의 1.1 배로 확대 시키기*/
      transform: scale(1.1);
      
   }
   
   .card .card-text{
      /* 한줄만 text 가 나오고  한줄 넘는 길이에 대해서는 ... 처리 하는 css */
      display:block;
      text-align: center;
      white-space : nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
   }
      .img-wrapper img{
         width: 80%;
         height: 80%;
      	 object-fit: cover;   
      }
</style>
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="/WEB-INF/views/include/navbar.jsp"></jsp:include>
	<div class="container">
	      
	      <h3 class="mt-2 mb-2 d-flex justify-content-center align-items-center"><img src="${pageContext.request.contextPath}/resources/images/blueSA.png"
			width="50" height="50">코디 저장소</h3>
	      <div class="row">
	      <c:forEach var="tmp" items="${list}">
	         <div class="col-3">
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
	      <nav>
	      <div class="d-flex justify-content-end">
	      	<a class="btn btn-secondary" href="${pageContext.request.contextPath}/gallery/upload_form3">내 코디 올리기</a>
	      </div>
	   <ul class="pagination pagination-sm justify-content-center">
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
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>