<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/joinFrm.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="select-wrap"> 
        <a href="/joinFrm.do" class="selNomal">일반 회원</a>     
        <a href="/ownerJoinFrm.do" class="selOwner">사업자</a>   
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>