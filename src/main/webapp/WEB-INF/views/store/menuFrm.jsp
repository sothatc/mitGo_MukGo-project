<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" href="/resources/css/member/owner.css">
	<div class="content-wrap">
		<h2>사업자 마이페이지</h2>
		<aside id="aside" class="sidebar">
			<div class="sidebar-1">
				<ul class="category">
					<li>
						<div>
							<a href="#">내 정보 수정</a>
						</div>
						<c:choose>
							<c:when test="${empty s }">
								<div>
									<a href="/addStoreFrm.do">업체 등록</a>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<a href="/updateStoreFrm.do">업체 정보 수정</a>
								</div>
								<div>
									<a href="/addMenuFrm.do?storeNo=${s.storeNo }">메뉴 추가</a>
								</div>
								<div>
									<a href="/MenuFrm.do?storeNo=${s.storeNo }">메뉴 관리</a>
								</div>
							</c:otherwise>
						</c:choose>
						<div>
							<a href="/ownerLogout.do">로그아웃</a>
						</div>
						<div>
							<a href="#">회원 탈퇴</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="sidebar-2">
				<ul class="category">
					<li>
						<h4>공지사항</h4>
					</li>
				</ul>
			</div>
		</aside>
		<article id="content" class="content">
			<div class="page-content" style="display: flex;">
				<div class="content-wrap">
					<div class="tabcontent" id="menuList">
						<div class="contentHead">
							<h2>메뉴 관리</h2>
						</div>
						<table class="table" style="text-align: center; vertical-align: middle;">
							<tr>
								<th scope="col">메뉴사진</th>
								<th scope="col">메뉴명</th>
								<th scope="col">가격</th>
								<th scope="col">수정</th>
								<th scope="col">삭제</th>
							</tr>
							<tr>
								<td>
									<img src="#" style="width: 50px; height: 50px;">
								</td>
								<td>에그타르트</td>
								<td>3000원</td>
								<td>
									<button type="button">수정</button>
								</td>
								<td>
									<button type="button">삭제</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</article>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>