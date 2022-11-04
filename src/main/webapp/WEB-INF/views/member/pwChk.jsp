<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/mypage.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="pwChk-wrap">
		<div class="pwChk-content">
			<div>비밀번호 확인</div>
			<form action="/mypage.do" method="post">
				<input type="hidden" value="${sessionScope.m.memberId }">
				<input type="password" id="rePwChk"><br>
				<button type="button" class="pwChkBtn">확인</button> 
			</form>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
	$(".pwChkBtn").on("mouseover",function(){
		$(this).css("background-color","rgb(97, 76, 76)");
		$(this).css("border","1px solid black");
		$(this).css("color","#ffc107");
	});
	$(".pwChkBtn").on("mouseleave",function(){
		$(this).css("background-color","");
		$(this).css("color","");
	});
	
	$(".pwChkBtn").on("click", function(){
		const inputPw = $("#rePwChk").val();
		const myPw = $(".myPw").val();
		if(myPw == inputPw) {
			$(".pwChkBtn").attr("type","submit");
		}else if(myPw != inputPw){
			alert("비밀번호를 다시 입력해주세요.");
		}else if(inputPw = ""){
			alert("비밀번호를 입력해주세요.");
		}
	});
</script>
</html>