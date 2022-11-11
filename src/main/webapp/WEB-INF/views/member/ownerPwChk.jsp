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
	<div class="pwChk-wrap wrap-img">
		<div class="pwChk-content">
			<div>비밀번호 확인</div>
			<form action="/ownerMypage.do" method="post">
				<input type="hidden" name="ownerNo" value="${sessionScope.o.ownerNo }">
				<input type="password" name="ownerPw" id="pwChk"><br>
				<button type="submit" class="pwChkBtn">확인</button> 
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
	
</script>
</html>