<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="icon" type="image/x-icon" href="favicon.ico">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/resources/css/header/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/header/style.css">
<!-- TOP NAV -->
<div class="top-nav" id="home">
	<div class="container">
		<div class="row justify-content-between">
			<div class="col-auto">
				<p>
					<i class='bx bxs-envelope'></i> mgmg@gmail.com
				</p>
				<p>
					<i class='bx bxs-phone-call'></i> 02 123-7890
				</p>
			</div>
			<div class="col-auto social-icons">
				<a href="#"><i class='bx bxl-facebook'></i></a> <a href="#"><i class='bx bxl-twitter'></i></a> <a href="#"><i class='bx bxl-instagram'></i></a>
			</div>
		</div>
	</div>
</div>

<!-- BOTTOM NAV -->
<nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">
	<div class="container">
		<a class="navbar-brand" href="/index.jsp">믿GO먹GO<span class="dot">!</span></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item">
					<a class="nav-link" href="/index.jsp">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/index2.jsp">인덱스이동(임시)</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/storeList.do?reqPage=1">GOGO리스트</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/marketMain.do?reqPage=1">GOGO마켓</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/selectNoticeList.do?reqPage=1">고객센터</a>
				</li>
			</ul>
			<c:choose>
				<c:when test="${empty sessionScope.m && empty sessionScope.o }">
					<a href="/loginFrm.do" id="font" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-brand1 ms-lg-3">로그인 | 회원가입 </a>
				</c:when>
				<c:otherwise>
					<c:if test="${not empty sessionScope.o }">
						<a href="/ownerPwChk.do" id="font" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-brand1 ms-lg-3">[사업자] ${sessionScope.o.ownerId }</a>
					</c:if>
					<c:if test="${sessionScope.m.memberClass eq 2}">
						<a href="/pwChk.do" id="font" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-brand1 ms-lg-3">[일반회원] ${sessionScope.m.memberId }</a>
					</c:if>
					<c:if test="${sessionScope.m.memberClass  eq 1}">
						<a href="/pwChk.do" id="font" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-brand1 ms-lg-3">[최고관리자] ${sessionScope.m.memberId }</a>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</nav>