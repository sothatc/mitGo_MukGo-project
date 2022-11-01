<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
						<a class="nav-link" href="#meallist1">간단하게 한끼!</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#meallist2">든든하게 두끼!</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#meallist3">출출할땐 야식!</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#meallist4">우리집 실내포차!</a>
					</li>

				</div>
			</div>
		</div>
	</div>

	<!-- ////////////////////////////////////////////////////////////////// -->

	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="market1">
				<h6 id="font" id="meallist1">간단하게 한끼!</h6>
			</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/제육밀키트.png" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[담꾹]<br>3분 제육볶음
								</h5>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트1.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[Fresheasy]<br>간편 파스타 5종
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">15,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트9.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[PEACOCK] <br> 오뎅식당 부대찌개
								</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">15,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트10.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[PEACOCK] <br> 마라 소고기 전골
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트4.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[올반]<br> 마늘족발
								</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">15,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트12.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[편한식당]<br>한끼 도시락 5종
								</h5>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트떡볶이.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[미미네] <br> 미미네 국물떡볶이
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">18,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트7.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[PEACOCK] <br> 통나무집 닭갈비
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ////////////////////////////////////////////////////////////////// -->

	<section class="py-5" id="meallist2">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="market1">
				<h6 id="font">든든하게 두끼!</h6>
			</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/제육밀키트.png" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[담꾹]<br>3분 제육볶음
								</h5>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트1.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[Fresheasy]<br>간편 파스타 5종
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">15,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트9.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[PEACOCK] <br> 오뎅식당 부대찌개
								</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">15,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트10.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[PEACOCK] <br> 마라 소고기 전골
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트4.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[올반]<br> 마늘족발
								</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">15,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트12.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[편한식당]<br>한끼 도시락 5종
								</h5>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트떡볶이.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[미미네] <br> 미미네 국물떡볶이
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">18,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트7.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[PEACOCK] <br> 통나무집 닭갈비
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ////////////////////////////////////////////////////////////////// -->

	<section class="py-5" id="meallist3">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="market1">
				<h6 id="font">출출할땐 야식!</h6>
			</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/제육밀키트.png" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[담꾹]<br>3분 제육볶음
								</h5>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트1.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[Fresheasy]<br>간편 파스타 5종
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">15,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트9.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[PEACOCK] <br> 오뎅식당 부대찌개
								</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">15,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트10.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[PEACOCK] <br> 마라 소고기 전골
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트4.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[올반]<br> 마늘족발
								</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">15,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트12.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[편한식당]<br>한끼 도시락 5종
								</h5>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트떡볶이.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[미미네] <br> 미미네 국물떡볶이
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">18,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트7.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[PEACOCK] <br> 통나무집 닭갈비
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ////////////////////////////////////////////////////////////////// -->

	<section class="py-5" id="meallist4">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="market1">
				<h6 id="font">우리집 실내포차!</h6>
			</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/제육밀키트.png" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[담꾹]<br>3분 제육볶음
								</h5>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트1.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[Fresheasy]<br>간편 파스타 5종
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">15,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트9.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[PEACOCK] <br> 오뎅식당 부대찌개
								</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">15,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트10.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[PEACOCK] <br> 마라 소고기 전골
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트4.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[올반]<br> 마늘족발
								</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">15,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트12.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[편한식당]<br>한끼 도시락 5종
								</h5>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트떡볶이.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[미미네] <br> 미미네 국물떡볶이
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">18,000원</span>
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="img/밀키트7.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 id="font">[PEACOCK] <br> 통나무집 닭갈비
								</h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								12,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script src="/resources/js/index/jquery.min.js"></script>
	<script src="/resources/js/index/bootstrap.bundle.min.js"></script>
	<script src="/resources/js/index/owl.carousel.min.js"></script>
	<script src="/resources/js/index/app.js"></script>
</body>
</html>