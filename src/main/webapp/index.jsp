<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<h1>믿고먹고</h1>
<hr>
<h2><a href="/loginFrm.do">로그인(김동환)</a></h2>
<h2><a href="/joinFrm.do">회원가입(김동환)</a></h2>
<h2><a href="/addStoreFrm.do">업체 등록(이정우)</a></h2>
<h2><a href="/mapFrm.do">map 길찾기 생성중(이규진)</a></h2>
<h2><a href="/storeDetailView.do">맛집상세페이지(양내윤)</a></h2>
<h2><a href="/selectAllFaq.do?reqPage=1">FAQ List(안형관)</a></h2>
<h2><a href="/storeList.do">맛집 리스트 생성중(이규진)</a></h2>
<h2><span class="review">리뷰 작성하기(이정우)</span></h2>



<script>
	$(".review").on("click", function() {
		var win = window.open("/writeReviewFrm.do", "_blank", "toolbar=yes,scrollbars=yes,top=100,left=500,width=520,height=450");
	});
</script>
</body>
</html>