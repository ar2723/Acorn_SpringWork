<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/guest/insert.jsp</title>
</head>
<body>
	<script>
			alert("글을 성공적으로 등록 했습니다.");
			location.href ="${pageContext.request.contextPath}/guest/list";
	</script>
</body>
</html>