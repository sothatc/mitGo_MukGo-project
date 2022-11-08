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
	<link rel="stylesheet" href="/resources/css/member/member.css">
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<div class="content-wrap">
		<h2>마이페이지</h2>
		<aside id="aside" class="sidebar">
			<div class="sidebar-1">
				<ul class="category">
					<li>
						<div>
							<a href="/mypage.do">내 정보 수정</a>
						</div>
						<div>
							<a href="/reserveList.do">예약 내역</a>
						</div>
						<div>
							<a href="/logout.do">로그아웃</a>
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
						<h4>공지사항
							</h3>
					</li>
				</ul>
			</div>
		</aside>
		<article id="content" class="content">
			<div class="page-content">
				<div class="reserve-wrap">
					<div id="menuList">
						<div class="content-head">
							<h2>예약 내역</h2>
						</div>
						<table class="table" style="text-align: center; vertical-align: middle;">
							<tr>
								<th scope="col">예약 번호</th>
								<th scope="col">가게 이름</th>
								<th scope="col">예약 접수날짜</th>
								<th scope="col">예약일</th>
								<th scope="col">예약 시간</th>
								<th scope="col">리뷰</th>
								<th></th>
							</tr>
							<c:forEach items="${rsList }" var="rs">
								<tr>
									<td>${rs.reserveNo }</td>
									<td>${rs.storeName }</td>
									<td>${rs.reserveDate }</td>
									<td>${rs.eatDate }</td>
									<td>${rs.eatTime }</td>
									<td>
										<c:choose>
											<c:when test="${rs.RStatus } eq 0">
										<button type="button" onclick="WirteReview(this,${rs.reserveNo},${rs.storeNo},'${rs.storeName }')">리뷰쓰기</button>
											</c:when>
											<c:otherwise>
										<button type="button" onclick="updateReview(this,${rs.reserveNo},${rs.storeNo},'${rs.storeName }')">리뷰수정</button>
											</c:otherwise>
										</c:choose>
									<td>
										<button type="button">취소</button>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</article>
	</div>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	
	function WirteReview(obj,reserveNo, storeNo, storeName) {
		var win = window.open("/writeReviewFrm.do?storeNo="+storeNo+"&storeName="+storeName+"&reserveNo="+reserveNo, "_blank", "toolbar=yes,scrollbars=yes,top=200,left=600,width=520,height=500");
	};
	</script>

</body>
</html>