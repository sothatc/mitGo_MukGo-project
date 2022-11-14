<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>GOGO마켓</title>

</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
	<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
	<link rel="stylesheet" href="/resources/css/market/marketmain.css">

	<section id="services" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="intro">
						<h6>먹킷리스트</h6>
						<h1>믿고 먹는 GOGO마켓</h1>
						<p id="font" class="mx-auto">
							우리집이 맛집?!
							<br>
							집에서도 맛볼수있는 서울 전 지역 인기 메뉴!
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ////////////////////////////////////////////////////////////////// -->

	<div class="mid-nav" id="home">
		<div class="container">
			<div class="row justify-content-between">
				<div id="font">
					<li class="nav-item">
						<a class="nav-link" href="/marketMain.do?reqPage=1&pCategory=10">밀키트</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/marketMain.do?reqPage=1&pCategory=11">냉동식품</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/marketMain.do?reqPage=1&pCategory=8">디저트</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/marketMain.do?reqPage=1&pCategory=9">기타</a>
					</li>
				</div>
			</div>
		</div>
	</div>

	<!-- ////////////////////////////////////////////////////////////////// -->

	<section class="py-5" >
		<div class="container px-4 px-lg-5 mt-5">
			<div class="market1">
				<h6 id="font">
					<c:if test="${pCategory == 10}">
						밀키트
					</c:if>
					<c:if test="${pCategory == 11}">
						냉동식품
					</c:if>
					<c:if test="${pCategory == 8}">
						디저트
					</c:if>
					<c:if test="${pCategory == 9}">
						기타
					</c:if>		
				</h6>		
			</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center minHeight">				
				<c:forEach items="${list }" var="ma">
						<div class="col mb-5">
							<div class="card h-100">
								<!-- Product image-->
								<img class="card-img-top" src="resources/upload/market/${ma.PImg }"/>
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h5 id="font">${ma.storeName }<br>${ma.PName }
										</h5>
										<!-- Product price-->
										<fmt:formatNumber value="${ma.PPrice }" pattern="#,###"/>원
									</div>
								</div>
								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto" href="/marketDetail.do?pNo=${ma.PNo }">View options</a>
									</div>
								</div>
							</div>
						</div>
				</c:forEach>				
			</div>
		</div>
	</section>

	<!-- ////////////////////////////////////////////////////////////////// -->

	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script src="/resources/js/index/jquery.min.js"></script>
	<script src="/resources/js/index/bootstrap.bundle.min.js"></script>
	<script src="/resources/js/index/owl.carousel.min.js"></script>
	<script src="/resources/js/index/app.js"></script>
</body>
</html>