<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/file/uploadform</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<style>
</style>
<body>
	<div class="container mt-2">
		<form action="upload" method="post" enctype="multipart/form-data">
			<input class="form-control" type="text" name="title" placeholder="제목입력..."/>
			<br />
			파일 <input class="form-control" type="file" name="myFile" />
			<br />
			<button class="btn btn-primary" type="submit">업로드</button>
		</form>
	</div>
</body>
</html>