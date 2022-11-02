<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/owner.css">
</head>
<body>
	<div class="content-wrap">
		<h2>사업자 마이페이지</h2>
		<aside id="aside" class="sidebar">
			<div class="sidebar-1">
				<ul class="category">
					<li>
						<div><a href="#">내 정보 수정</a></div>
						<div><a href="/updateStoreFrm.do">업체 정보 수정</a></div>
						<div><a href="#">메뉴 추가</a></div>
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
</body>
</html>