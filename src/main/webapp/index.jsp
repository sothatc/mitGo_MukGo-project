<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<h1>믿고먹고</h1>
	<c:choose>
		<c:when test="${empty sessionScope.m }">
			<a href="/loginFrm.do">로그인</a>
			<a href="/joinFrm.do">회원가입</a>
		</c:when>
		<c:otherwise>
			<a href="/pwChk.do">마이페이지</a>
		</c:otherwise>
	</c:choose>
	<a href="addStoreFrm.do">업체 등록</a>
	<h2><a href="/addStoreFrm.do">업체 등록</a></h2>
	<h2><a href="/mapFrm.do">map 길찾기 생성중</a></h2>
	<h2><a href="/storeDetailView.do">맛집상세페이지</a></h2>
	<h2><a href="/selectAllFaq.do?reqPage=1">faqList</a></h2>
	<a href="/storeList.do">업체 상세보기 생성중</a>
</body>
</html>