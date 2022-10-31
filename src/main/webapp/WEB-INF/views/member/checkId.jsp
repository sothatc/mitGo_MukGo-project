<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style>
		
	</style>
	
	<div id="check-container">
		<c:choose>
			<c:when test="${result}">
				<div>[ <span>${checkId } </span> ]는 사용 가능합니다.</div>
				<br><br>
				<button type="button" onclick="closeWindow('${checkId}');">닫기</button>
			</c:when>
			<c:otherwise>
				<div>[ <span>${memberId }</span> ]는 이미 사용중입니다.</div>
				<br><br>
				<form action="/checkId.do">
					<div class="id-wrap">
						<input type="text" name="checkId" class="checkId">
						<button type="submit">조회</button>
					</div>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
	<script>
		function closeWindow(checkId){
			const idInput = $("#memberId",opener.document);
			idInput.val(checkId);
			self.close();
		}
	</script>
</body>
</html>