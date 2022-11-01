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
	<div class="header">ㅡㅡ</div>
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

<script>
	$(".pwChkBtn").on("mouseover",function(){
		$(this).css("background-color","rgb(97, 76, 76)");
		$(this).css("border","1px solid black");
	});
	$(".pwChkBtn").on("mouseleave",function(){
		$(this).css("background-color","");
	});
	
	$(".pwChkBtn").on("click", function(){
		const myPw = $("#rePwChk").val();
		if(${sessionScope.m.memberPw } == myPw) {
			$(".pwChkBtn").attr("type","submit");
		}else {
			alert("비밀번호를 다시 입력해주세요.");
		}
	});
</script>
</html>