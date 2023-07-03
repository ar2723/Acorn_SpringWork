<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 
	[이미지 갤거리 기능 구현하기]
	form에 이미지 하나를 선택하고, 설명도 입력한 다음 업로드 버튼을 누르면 이미지가 업로드 되고
	업로드 된 이미지의 정보를 관리하는 기능을 만들어보세요
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/gallery/upload_form.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h3>사진 업로드 폼 입니다.</h3>
		<form id="imageForm" action="upload" method="post" enctype="multipart/form-data">
			<div class="mb-2">
				<label class="form-label" for="caption">caption</label>
				<input id="image" class="form-control" type="text" name="caption" id="caption"/>
			</div>
			<div class="mb-2">
				<label class="form-label" for="myFile">첨부파일</label>
				<input class="form-control" type="file" name="myFile" id="myFile"/>
			</div>
			<button class="btn btn-primary" type="submit">업로드</button>
		</form>
		<div id="imagePreview">
		
		</div>
	</div>
	<script>
	//이미지를 선택하면(바뀌면) 실행할 함수 등록
	//document.querySelector("#image").addEventListener("change", function(){
		//ajax 전송할 폼의 참조값 얻어오기
		//const form=document.querySelector("#imageForm");
		//gura_util.js 에 있는 함수를 이용해서 ajax 전송하기 
		//ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			console.log(data);
			// img 요소를 문자열로 작성한 다음 
			let img=`<img src="${pageContext.request.contextPath}\${data.imagePath}">`;
			//id 가 profileLink 인 요소의 내부(자식요소)에 덮어쓰기 하면서 html 형식으로 해석해 주세요 라는 의미 
			document.querySelector("#imagePreview").innerHTML = img;
		});
	});
	</script>
</body>
</html>