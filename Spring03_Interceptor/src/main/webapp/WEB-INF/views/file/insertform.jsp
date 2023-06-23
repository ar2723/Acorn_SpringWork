<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/file/insertform.jsp</title>
<style>
	#profileForm{
		display: none;
	}
	#profileLink img{
		width: 200px;
		height: 200px;
		border: 1px soild red;
		border-radius: 50%;
	}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h3>파일 업로드 폼1</h3>
		<form action="${pageContext.request.contextPath}/file/upload" method="post"
			enctype="multipart/form-data">
			제목 <input class="form-control" type="text" name="title"/>
			첨부파일 <input class="form-control" type="file" name="myFile"/>
			<button class="btn btn-primary mt-2" type="submit">업로드</button>
		</form>
		<h3>파일 업로드 폼2</h3>
		<form action="${pageContext.request.contextPath}/file/upload2" method="post"
			enctype="multipart/form-data">
			제목 <input class="form-control" type="text" name="title"/>
			첨부파일 <input class="form-control" type="file" name="myFile"/>
			<button class="btn btn-primary mt-2" type="submit">업로드</button>
		</form>
		<!-- 
			이미지를 선택해서 업로드 버튼을 누르면 페이지 전환없이 이미지를 업로드하고
			업로드 된 파일의 정보를 응답(JSON) 받아서
			id가 imageWrapper 인 div 의 자식 요소에 img 요소를 추가해서
			업로드 된 이미지가 바로 보이도록 프로그래밍 해보세요
			
			- webapp/resources/upload 폴더에 이미지를 저장하세요
			- gura_util.js 를 webapp/resources/js 폴더에 넣어놓고 로딩해서 쓰면 됩니다.
		 -->
		<h3>이미지 업로드 폼</h3>
		<form id="myForm" action="${pageContext.request.contextPath}/image/upload" enctype="multipart/form-data">
			이미지 <input id="imageInput" type="file" name="image" accept=".jpg, .jpeg, .JPG, .JPEG, .git, .png, .PNG"/>
			<button type="submit">업로드</button>
		</form>
		<br />
		<div id="imageWrapper"></div>
		<div>
			<a id="profileLink" href="javascript:">
				프로필
			</a>
		</div>
	</div>
	<form id="profileForm" action="${pageContext.request.contextPath}/image/upload" enctype="multipart/form-data">
		이미지 <input id="file" type="file" name="image" accept=".jpg, .jpeg, .JPG, .JPEG, .git, .png, .PNG"/>
	</form>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script>
		//프로필 링크를 눌렀을 때 실행할 함수 등록
		document.querySelector("#profileLink").addEventListener("click", ()=>{
			// input type = "file"을 강제 클릭해서 파일 선택창 띄우기
			document.querySelector("#file").click();
		})
		//실제로 파일을 선택했을 때 (change 이벤트가 발생한다) 실행할 함수 등록
		document.querySelector("#file").addEventListener("change", ()=>{
			const form = document.querySelector("#profileForm")
			//폼에 입력한 (선택한 파일) 내용을 ajax로 제출하기
			ajaxFormPromise(form)
			.then(res => res.json())
			.then((data) => {
				//data 는 {imagePath:"/resources/upload/xxx"} 형태의 object이다.
				const imgString=`<img src="${pageContext.request.contextPath}\${data.imagePath}">`;
				// img 요소를 표현하고 있는 문자열을 HTML 형식으로 해석이 되도록 대입해준다.
				document.querySelector("#profileLink").innerHTML = imgString;
			}); 
		})
	
		document.querySelector("#myForm").addEventListener("submit", (e)=>{
			//폼 전송 막기
			e.preventDefault();
			//gura_util.js 에 있는 함수를 호출하면서 폼의 참조값 전달
			ajaxFormPromise(e.target)
			.then(res => res.json())
			.then((data) => {
				//data 는 {imagePath:"/resources/upload/xxx"} 형태의 object이다.
				const imgString=`<img src="${pageContext.request.contextPath}\${data.imagePath}">`;
				// img 요소를 표현하고 있는 문자열을 HTML 형식으로 해석이 되도록 대입해준다.
				document.querySelector("#imageWrapper").innerHTML = imgString;
			});
		});
	</script>
</body>
</html>