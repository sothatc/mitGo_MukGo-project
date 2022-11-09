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
			<form action="/memberManage.do" method="post">
				<input type="hidden" value="${sessionScope.m.memberId }">
				<input type="hidden" class="myPw" value="${sessionScope.m.memberPw }">
				<input type="password" id="rePwChk"><br>
				<button type="submit" class="pwChkBtn">확인</button> 
			</form>
		</div>
	</div>
</body>
</html>