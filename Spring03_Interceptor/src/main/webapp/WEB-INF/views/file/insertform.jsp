<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/file/insertform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h3>파일 업로드 폼1</h3>
		<form action="${pageContext.request.contextPath}/file/upload" method="post"
			enctype="multipart/form-data">
			제목 <input class="form-control" type="text" name="title"/>
			첨부파일 <input class="form-control" type="file" name="myFile"/>
			<button class="btn btn-primary mt-2" type="submit">업로드</button>
		</form>
		<h3>파일 업로드 폼2</h3>
		<form action="${pageContext.request.contextPath}/file/upload2" method="post"
			enctype="multipart/form-data">
			제목 <input class="form-control" type="text" name="title"/>
			첨부파일 <input class="form-control" type="file" name="myFile"/>
			<button class="btn btn-primary mt-2" type="submit">업로드</button>
		</form>
		<!-- 
			이미지를 선택해서 업로드 버튼을 누르면 페이지 전환없이 이미지를 업로드하고
			업로드 된 파일의 정보를 응답(JSON) 받아서
			id가 imageWrapper 인 div 의 자식 요소에 img 요소를 추가해서
			업로드 된 이미지가 바로 보이도록 프로그래밍 해보세요
			
			- webapp/resources/upload 폴더에 이미지를 저장하세요
			- gura_util.js 를 webapp/resources/js 폴더에 넣어높고 로딩해서 쓰면 됩니다.
		 -->
		<h3>이미지 업로드 폼</h3>
		<form id="myForm" action="/image/upload" enctype="multipart/form-data">
			이미지 <input type="file" name="myFile" accept=".jpg, .jpeg, .JPG, .JPEG, .git, .png, .PNG"/>
			<button type="submit">업로드</button>
		</form>
		<br />
		<div id="imageWrapper"></div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script>
		document.querySelector("#myForm").addEventListener("submit", (e)=>{
			e.preventDefault();
			
			ajaxFormPromise(e.target)
			.then(res => res.json())
			.then((data) => {
				console.log(data)
			});
			
		});
	</script>
</body>
</html>