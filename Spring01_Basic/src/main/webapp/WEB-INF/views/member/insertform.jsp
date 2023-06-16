<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/member/insertform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous" />
</head>
<body>
	<div class="container">
		<h1>회원추가폼</h1>
		<form action="${pageContext.request.contextPath}/member/insert" method="post">
			번호 <input type="text" name="num"/><br />
			이름 <input type="text" name="name"/><br />
			주소 <input type="text" name="addr"/><br />
			<button type="submit">추가</button>
		</form>
		
		<h1>회원추가폼2</h1>
		<form action="${pageContext.request.contextPath}/member/insert2" method="post">
			번호 <input type="text" name="num"/><br />
			이름 <input type="text" name="name"/><br />
			주소 <input type="text" name="addr"/><br />
			<button type="submit">추가</button>
		</form>
		
		<h1>회원추가폼3</h1>
		<form action="${pageContext.request.contextPath}/member/insert3" method="post">
			번호 <input type="text" name="num"/><br />
			이름 <input type="text" name="name"/><br />
			주소 <input type="text" name="addr"/><br />
			<button type="submit">추가</button>
		</form>
	</div>
</body>
</html>