<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/file/upload_form.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<style>
	.container{
		width: 768px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="file_list" name="current"/>
	</jsp:include>
	<div class="container">
		<h3>파일 업로드 폼 입니다.</h3>
		<form action="upload" method="post" enctype="multipart/form-data">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title"/>
			</div>
			<div>
				<label for="myFile">첨부파일</label>
				<!-- dto의 필드명과 name 값은 동일해야 한다. -->
				<input type="file" name="myFile" id="myFile"/>
			</div>
			<button type="submit">업로드</button>
		</form>
	</div>
</body>
</html>