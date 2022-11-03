<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/owner.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<h2>사업자 마이페이지</h2>
		<aside id="aside" class="sidebar">
			<div class="sidebar-1">
				<ul class="category">
					<li>
						<div><a href="#">내 정보 수정</a></div>
						<c:choose>
							<c:when test="${empty s }">
								<div><a href="/addStoreFrm.do">업체 등록</a></div>
							</c:when>
							<c:otherwise>
								<div><a href="/updateStoreFrm.do">업체 정보 수정</a></div>
								<div><a href="#">메뉴 추가</a></div>
							</c:otherwise>
						</c:choose>
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
			${sessionScope.o.ownerId }
		</article>
	</div>
	<!--  
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	-->
</body>
</html>