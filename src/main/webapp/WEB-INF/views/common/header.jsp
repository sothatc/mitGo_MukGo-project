<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<!-- TOP NAV -->
<div class="top-nav" id="home">
	<div class="container">
		<div class="row justify-content-between">
			<div class="col-auto">
				<p>
					<i class='bx bxs-envelope'></i> info@example.com
				</p>
				<p>
					<i class='bx bxs-phone-call'></i> 123 456-7890
				</p>
			</div>
			<div class="col-auto social-icons">
				<a href="#"><i class='bx bxl-facebook'></i></a> <a href="#"><i class='bx bxl-twitter'></i></a> <a href="#"><i class='bx bxl-instagram'></i></a> <a href="#"><i class='bx bxl-pinterest'></i></a>
			</div>
		</div>
	</div>
</div>

<!-- BOTTOM NAV -->
<nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">
	<div class="container">
		<a class="navbar-brand" href="#">믿GO먹GO<span class="dot">!</span></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item">
					<a class="nav-link" href="#home">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#recommend">추천받기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#services">GOGO리스트</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="http://127.0.0.1:5501/marketmain.html#mealkit-list">GOGO마켓</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#realreview">생생리뷰</a>
				</li>
			</ul>
			<a href="#" id="font" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-brand1 ms-lg-3">로그인 | 회원가입 </a>
		</div>
	</div>
</nav>