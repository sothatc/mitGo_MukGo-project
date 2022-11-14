<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="updatePw-wrap">
		<div class="updatePwContent">
		<form action="#" method="post">
			<input type="hidden" class="memberNo" name="memberNo" value="${memberNo }">
			<input type="text" name="memberPw" id="memberPw">
			<input type="text" name="reMemberPw" id="reMemberPw">
			<button type="submit" class="updatePwBtn">Pw변경</button>
		</form>
		</div>
	</div>
</body>
</html>