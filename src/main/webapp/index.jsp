<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
	a {
		text-decoration: none;
		color: #000;
	}
	
	a:hover {
		color: red;
	}
	
	.review:hover {
		cursor: pointer;
		color: red;
	}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<h1>믿고먹고</h1>
	<c:choose>
		<c:when test="${empty sessionScope.m }">
			<a href="/loginFrm.do">로그인</a>
			<a href="/selectJoin.do">회원가입</a>
		</c:when>
		<c:otherwise>
			<a href="/pwChk.do">마이페이지</a>
			<a href="/logout.do">로그아웃</a>
		</c:otherwise>
	</c:choose>
	<h2><a href="/addStoreFrm.do">업체 등록(이정우)</a></h2>
	<h2><a href="/mapFrm.do">map 길찾기 생성중(이규진)</a></h2>
	<h2><a href="/storeDetailView.do">맛집상세페이지(양내윤)</a></h2>
	<h2><a href="/selectAllFaq.do?reqPage=1">FAQ List(안형관)</a></h2>
	<h2><a href="/storeList.do?reqPage=1">맛집 리스트 생성중(이규진)</a></h2>
	<h2><span class="review">리뷰 작성하기(이정우)</span></h2>
	<h2><a href="/selectNoticeList.do?reqPage=1">공지사항(안형관)</a></h2>
	<h2><a href="/addMenuFrm.do">메뉴 추가(이정우)</a></h2>
	<h2><a href="index2.jsp">인덱스</a></h2>
	<h2><a href="marketMain.jsp">마켓메인</a></h2>




	<script>
		$(".review").on("click", function() {
			var win = window.open("/writeReviewFrm.do", "_blank", "toolbar=yes,scrollbars=yes,top=200,left=600,width=520,height=500");
		});
	</script>
</body>
</html>