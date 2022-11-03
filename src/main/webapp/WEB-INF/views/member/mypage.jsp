<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/member.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div>마이페이지</div>
		<aside id="aside" class="sidebar">
			<div class="sidebar-1">
				<ul class="category">
					<li>
						<div><a href="#">내 정보 수정</a></div>
						
						<div><a href="/logout.do">로그아웃</a></div>
						<div><a href="#">회원 탈퇴</a></div>
					</li>
				</ul>
			</div>
			<div class="sidebar-2">
				<ul class="category">
					<li>
						<h4>공지사항</h3>
					</li>
				</ul>
			</div>
		</aside>
		<article id="content" class="content">
			
		</article>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
