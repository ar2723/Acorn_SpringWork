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
		<form action="upload" method="post" enctype="multipart/form-data">
			<div class="mb-2">
				<label class="form-label" for="caption">caption</label>
				<input class="form-control" type="text" name="caption" id="caption"/>
			</div>
			<div class="mb-2">
				<label class="form-label" for="myFile">첨부파일</label>
				<input class="form-control" type="file" name="myFile" id="myFile"/>
			</div>
			<button class="btn btn-primary" type="submit">업로드</button>
		</form>
	</div>
</body>
</html>