<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/delete.jsp</title>
</head>
<body>
	<script>
		alert("${requestScope.id}님 탈퇴 처리 되었습니다.");
		location.href="${pageContext.request.contextPath}/";
	</script>
</body>
</html>