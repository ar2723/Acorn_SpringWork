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
			//insertform을 통해 전달된 파라미터는 컨트롤러를 거쳤다하더라도 응답전까지는 사용이 가능하다.
			alert("${param.writer}님이 작성한 글을 성공적으로 등록 했습니다.");
			location.href ="${pageContext.request.contextPath}/guest/list";
	</script>
</body>
</html>