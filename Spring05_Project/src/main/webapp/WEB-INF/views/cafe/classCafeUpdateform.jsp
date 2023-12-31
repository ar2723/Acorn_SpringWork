<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/classCafeUpdateform.jsp</title>
<style>
	textarea{
		width: 768px;
		height: 300px;
	}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/header.css" />
</head>
<body class="d-flex flex-column min-vh-100">
	 <jsp:include page="/WEB-INF/views/include/navbar.jsp"></jsp:include>
	 
	 <div class="container">
	 	<div class="d-flex flex-column align-items-center">
			<form style="width:770px" class="form" action="classCafeUpdate" method="post">
				<input type="hidden" name="num" value="${dto.num}" />
				<div class="d-flex mt-2">
					<div class="col-8 me-2">
						<label class="form-label" for="writer">작성자</label>
						<input class="form-control" type="text" id="writer" value="${dto.writer}" disabled/>
					</div>
					<div class="col-4">
						<label class="form-label" for="className">직업</label>
						<input class="form-control" type="text" id="className" 
						value =
							"${dto.className == 'warrior' ? '[전사]' : 
							   dto.className == 'archer' ? '[궁수]' :
							   dto.className == 'thief' ? '[도적]' :
							   dto.className == 'mage' ? '[마법사]' :
							   dto.className == 'pirate' ? '[해적]' : ''
							}" disabled/>
					</div>
				</div>
				<div class="mt-2">
					<label class="form-label" for="title">제목</label>
					<input class="form-control" type="text" name="title" id="title" value="${dto.title}"/>
				</div>
				<div class="mt-2">
					<textarea name="content" id="content">${dto.content}</textarea>
				</div>
				<button class="btn btn-primary" type="submit" onclick="submitContents(this);">수정확인</button>
				<button class="btn btn-secondary" type="reset">취소</button>
			</form>
		</div>
	</div>
	<!-- SmartEditor 에서 필요한 javascript 로딩  -->
	<script src="${pageContext.request.contextPath }/resources/SmartEditor/js/HuskyEZCreator.js"></script>
	<script>
		var oEditors = [];
		//추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI: "${pageContext.request.contextPath}/resources/SmartEditor/SmartEditor2Skin.html",	
			htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function(){
					//alert("완료!");
				}
			}, //boolean
			fOnAppLoad : function(){
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator: "createSEditor2"
		});
		
		function pasteHTML() {
			var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
		}
		
		function showHTML() {
			var sHTML = oEditors.getById["content"].getIR();
			alert(sHTML);
		}
			
		function submitContents(elClickedObj) {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
			
			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
			
			try {
				elClickedObj.form.submit();
			} catch(e) {}
		}
		
		function setDefaultFont() {
			var sDefaultFont = '궁서';
			var nFontSize = 24;
			oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
		}
		
	</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>