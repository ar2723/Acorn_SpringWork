<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/gallery/upload.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp"></jsp:include>
	<script>
		alert("코디를 등록 했습니다");
		location.href = "${pageContext.request.contextPath}/gallery/list";
	</script>
</body>
</html>