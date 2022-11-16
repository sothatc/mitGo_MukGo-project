<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>믿GO먹GO</title>
<link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">

</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- SLIDER -->
	<div class="owl-carousel owl-theme hero-slider">
		<div class="slide slide1">
			<div class="container">
				<div class="row">
					<div class="col-12 text-center text-white">
						<h1 class="display-3 my-4">믿을수있는 맛집리스트,<br />믿GO<br />먹GO
						</h1> <a href="/storeList.do?reqPage=1" class="btn btn-brand" id="font">맛집보러가기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="slide slide2">
			<div class="container">
				<div class="row">
					<div class="col-12 col-lg-10 offset-lg-1 text-white">
						<h6 class="text-white text-uppercase" id="font">맛집리스트를 집에서도</h6>
						<h1 class="display-3 my-4">GOGO마켓 <br />신선, 간편, 프리미엄 밀키트
						</h1> <a href="/marketMain.do?reqPage=1" class="btn btn-brand" id="font">상품보러가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ABOUT -->
	<section id="recommend" class="text-center">
		<div class="recommend">
			<div class="dropdown-label">나는</div>
			<div class="dropdown">
				<button class="dropbtn">
					<span class="dropbtn_click">
						<img class="mini" src="/resources/img/index/who친구.svg">친구와
					</span>
				</button>
				<div class="dropdown-content">
					<option value="withwho">친구와</option>
					<option value="withwho">가족과</option>
					<option value="withwho">연인과</option>
				</div>
			</div>
			<div class="dropdown-label2">함께</div>
			<div class="dropdown2">
				<button class="dropbtn2">
					<span class="dropbtn_click2">
						<img class="mini" src="/resources/img/index/where분위기.svg">분위기 좋은 곳
					</span>
				</button>
				<div class="dropdown-content2">
					<option value="where">분위기 좋은 곳</option>
					<option value="where">트렌디한 곳</option>
					<option value="where">조용한 곳</option>
				</div>
			</div>
			<div class="dropdown-label3">에서</div>






			<div class="dropdown3">
				<button class="dropbtn3">
					<span class="dropbtn_click3">
						<img class="mini" src="/resources/img/index/what일식.png">일식을
					</span>
				</button>

				<div class="dropdown-content3">
					<option value="which">일식을</option>
					<option value="which">양식을</option>
					<option value="which">한식을</option>
				</div>
			</div>
			<div class="dropdown-label4">먹고싶어요</div>
			<div class="dropdown-label5">
				<img src="/resources/img/index/싶어요!.png">
			</div>
		</div>
	</section>

	<!-- MILESTONE -->
	<section id="milestone">
		<div class="container">
			<div class="row text-center justify-content-center gy-4">
				<div class="col-lg-2 col-sm-6">
					<h1 class="display-4">25개 구</h1>
					<p class="mb-0" id="font">서울 전 지역</p>
				</div>
				<div class="col-lg-2 col-sm-6">
					<h1 class="display-4">+500</h1>
					<p class="mb-0" id="font">맛집리스트</p>
				</div>
				<div class="col-lg-2 col-sm-6">
					<h1 class="display-4">+300</h1>
					<p class="mb-0" id="font">밀키트</p>
				</div>
				<div class="col-lg-2 col-sm-6">
					<h1 class="display-4">+1000</h1>
					<p class="mb-0" id="font">검증된 후기</p>
				</div>
			</div>
		</div>
	</section>

	<section id="services" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="intro">
						<h6>먹킷리스트</h6>
						<h1>믿고 보는 맛집 리스트</h1>
						<p id="font" class="mx-auto">
							맛집을 종류별로 한눈에!
							<br>
							GOGO에서 엄선한 서울 맛집리스트
						</p>
					</div>
				</div>
			</div>
			<div class="row g-4">
				<c:forEach items="${sList }" var="ss">
				<div class="col-lg-4 col-md-6">
					<div class="service" style="height: 500px;">
						<a href="/storeDetail.do?storeNo=${ss.storeNo }"><img src="resources/upload/store/${ss.thumbNail }" alt=""></a>
						<h5>${ss.storeName }</h5>
						<p id="font">"${ss.content }"</p>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<section class="bg-light" id="mealkit-list">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="intro">
						<h6>MEALKIT</h6>
						<h1>GOGO마켓 밀키트 출시!</h1>
						<p id="font" class="mx-auto">집에서도 먹을 수 있는 맛집리스트!</p>
					</div>
				</div>
			</div>
		</div>
		<div id="projects-slider" class="owl-theme owl-carousel">
			<c:forEach items="${mList }" var="ms">
				<div class="project">
					<div class="overlay"></div>
					<a href="/marketDetail.do?pNo=${ms.PNo }"><img class="mealkit" src="resources/upload/market/${ms.PImg }" alt=""></a>
					<div class="content">
						<h2>${ms.PName }</h2>
						<h6>${ms.storeName }</h6>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>


	<section class="bg-light" id="realreview">
		<div class="owl-theme owl-carousel reviews-slider container">
			<c:forEach items="${rList }" var="rs">
				<div class="review">
					<div class="person">
						<a href="/storeDetail.do?storeNo=${rs.storeNo }"><img id="reviewrestaurant" src="/resources/upload/review/${rs.reviewImg }" alt=""></a>
						<h5 id="font" style="color: rgb(51, 51, 51); font-size: 15px;">${rs.writer }</h5> <small>${rs.storeName }</small>
					</div>
					<h3 id="font">${rs.content }</h3>
					<div class="stars">
						<c:forEach begin="1" step="1" end="${rs.rating }" varStatus="i">
							<i class='bx bxs-star' style="color: rgb(255, 83, 86);"></i>
						</c:forEach>
					</div>
					<i class='bx bxs-quote-alt-left'></i>
				</div>
			</c:forEach>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script src="/resources/js/index/jquery.min.js"></script>
	<script src="/resources/js/index/owl.carousel.min.js"></script>
	<script src="/resources/js/index/app.js"></script>
</body>
</html>