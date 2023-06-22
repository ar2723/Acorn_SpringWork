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
			제목 <input class="form-control type="text" name="title"/>
			첨부파일 <input class="form-control" type="file" name="myFile"/>
			<button class="btn btn-primary mt-2" type="submit">업로드</button>
		</form>
	</div>
</body>
</html>