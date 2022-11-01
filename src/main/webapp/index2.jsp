<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>믿GO먹GO</title>
<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
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
						</h1> <a href="#" class="btn btn-brand" id="font">맛집보러가기</a> <a href="#" class="btn btn-outline-light ms-3" id="font">Our work</a>
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
						</h1> <a href="http://127.0.0.1:5501/marketmain.html#mealkit-list" class="btn btn-brand" id="font">상품보러가기</a> <a href="#" class="btn btn-outline-light ms-3" id="font">Our work</a>
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
				<div class="col-lg-4 col-md-6">
					<div class="service">
						<a href="#"><img src="img/꼬치구이.jpg" alt=""></a>
						<h5>강남역 맛집 Best 20</h5>
						<p id="font">"강남역 주변의 맛집을 한눈에!"</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="service">
						<a href="#"><img src="img/마라.jfif" alt=""></a>
						<h5>추운 겨울 화끈한 메뉴! 마라탕 TOP 7!</h5>
						<p id="font">"수많은 마라탕집, 어디로 가야할지 고민된다면?"</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="service">
						<a href="#"><img src="img/카이센동.jpeg" alt=""></a>
						<h5>떠오르는 인기메뉴, 카이센동! TOP 5!</h5>
						<p id="font">"싱싱한 해물이 올라간 카이센동이 먹고싶다면?"</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="service">
						<a href="#"><img src="img/치킨.jpg" alt=""></a>
						<h5>불금엔 치킨! 우리동네 치킨집 Best 5!</h5>
						<p id="font">"트렌디한 분위기 속에서 치킨과 맥주 한 잔?!"</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="service">
						<a href="#"><img src="img/다이닝.png" alt=""></a>
						<h5>연인과 가기좋은 데이트 맛집 10곳</h5>
						<p id="font">"뷰 맛집! 분위기 한 번 제대로 타고 싶은 날엔"</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="service">
						<a href="#"><img src="img/안주.jpg" alt=""></a>
						<h5>안주가 맛있는 맛집 Best 10</h5>
						<p id="font">치맥! 삼쏘! 오늘의 안주는?!</p>
					</div>
				</div>
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
			<div class="project">
				<div class="overlay"></div>
				<img class="mealkit" src="img/칼국수밀ㅋ트.jpg" alt="">
				<div class="content">
					<h2>Consulting Marketing</h2>
					<h6>Website Design</h6>
				</div>
			</div>
			<div class="project">
				<div class="overlay"></div>
				<img class="mealkit" src="img/제육밀키트.png" alt="">
				<div class="content">
					<h2>Consulting Marketing</h2>
					<h6>Website Design</h6>
				</div>
			</div>
			<div class="project">
				<div class="overlay"></div>
				<img class="mealkit" src="img/샤브밀키트.jpg" alt="">
				<div class="content">
					<h2>Consulting Marketing</h2>
					<h6>Website Design</h6>
				</div>
			</div>
			<div class="project">
				<div class="overlay"></div>
				<img class="mealkit" src="img/마라탕밀키트.jpg" alt="">
				<div class="content">
					<h2>Consulting Marketing</h2>
					<h6>Website Design</h6>
				</div>
			</div>
			<div class="project">
				<div class="overlay"></div>
				<img class="mealkit" src="img/밀키트떡볶이.jpg" alt="">
				<div class="content">
					<h2>Consulting Marketing</h2>
					<h6>Website Design</h6>
				</div>
			</div>
		</div>
	</section>


	<section class="bg-light" id="realreview">

		<div class="owl-theme owl-carousel reviews-slider container">
			<div class="review">
				<div class="person">
					<img id="reviewrestaurant" src="img/레스토랑1.jpg" alt="">
					<h5 id="font">Ralph Edwards</h5> <small>청담 페코리노</small>
				</div>
				<h3 id="font">트러플 파스타 뇨끼 이 조합을 좋아해서 전국 투어 다니는데 우연히 검색해서 발견한 맛집으로 피넛뇨끼-고소하고 쫀득에 더 가까운 느낌 트러플따야린파스타-트러플 풍미가 좋음 약간 짠 감도 있고 파스타 면발이 약간 안 풀어지지만 그거 빼곤 공간도 분위기 있고 조용하고 무엇보다 친절하십니다. 사탕 센스 감사해요 다음에 일정 있을 때 또 오겠습니다.</h3>
				<div class="stars">
					<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i class="bx bxs-star-half"></i>
				</div>
				<i class='bx bxs-quote-alt-left'></i>
			</div>
			<div class="review">
				<div class="person">
					<img id="reviewrestaurant" src="img/레스토랑2.jpeg" alt="">
					<h5 id="font">Ralph Edwards</h5> <small>한남 이원일식탁</small>
				</div>
				<h3 id="font">바형태의 식사구조지만 쉐프님의 요리와 조리를 직접 눈앞에서 볼 수 있고, 신선로에 나오는 감칠맛 좋은 군계일학과 작금채소의 궁합은 너무 좋았습니다! 다음 시즌메뉴와 전을 꼭 먹어보고 싶네요.</h3>
				<div class="stars">
					<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i class="bx bxs-star-half"></i>
				</div>
				<i class='bx bxs-quote-alt-left'></i>
			</div>
			<div class="review">
				<div class="person">
					<img id="reviewrestaurant" src="img/레스토랑3.jfif" alt="">
					<h5 id="font">Ralph Edwards</h5> <small>이태원 꾸띠자르당</small>
				</div>
				<h3 id="font">정말 해외에 온듯한 느낌이 들어서 특별하고 좋았구, 메뉴들도 맛있었어요 ! 직원분들 다 영어로 얘기하시지만 다 한국말 알아들으시는것도 재미있구 💜 특별한 날 가기에 너무 좋겠더라구요 ! 🙂</h3>
				<div class="stars">
					<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i class="bx bxs-star-half"></i>
				</div>
				<i class='bx bxs-quote-alt-left'></i>
			</div>
		</div>
	</section>

	<section id="blog">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="intro">
						<h6>Blog</h6>
						<h1>생생한 맛집 리뷰</h1>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<article class="blog-post">
						<img class="blog" src="img/KakaoTalk_20221027_140641868_01.jpg" alt=""> <a href="https://blog.naver.com/khj04hee/222898143611" class="tag" id="font">텐동</a>
						<div class="content">
							<small>01 Dec, 2022</small>
							<h5>겉바속촉의 정석, 성수동 텐동 맛집 <br>"온센"
							</h5>
							<p id="font">친구랑 같이 서울 올라간김에 같이 만났는데 어디갈지 리스트를 보내주셨는데 거기서 선택한 #러시아가정식 식당 #연남동 연남동에 위치한 #부퓌에트발랴</p>
						</div>
					</article>
				</div>
				<div class="col-md-4">
					<article class="blog-post">
						<img class="blog" src="img/KakaoTalk_20221027_140641868_02.jpg" alt=""> <a href="https://blog.naver.com/kkokko_yum/222666593553" class="tag" id="font">러시아 가정식</a>
						<div class="content">
							<small>01 Dec, 2022</small>
							<h5>내돈 내산! 연남동 러시아 가정식 맛집 <br>[부퓌에트발랴]
							</h5>
							<p id="font">친구랑 같이 서울 올라간김에 같이 만났는데 어디갈지 리스트를 보내주셨는데 거기서 선택한 #러시아가정식 식당 #연남동 연남동에 위치한 #부퓌에트발랴</p>
						</div>
					</article>
				</div>
				<div class="col-md-4">
					<article class="blog-post">
						<img class="blog" src="img/KakaoTalk_20221027_140641868_03.jpg" alt=""> <a href="https://blog.naver.com/chxndygks/222879052370" class="tag" id="font">오코노미야끼</a>
						<div class="content">
							<small>01 Dec, 2022</small>
							<h5>노량진 맛집 :: 노량진 오코노미야끼 <br>-오코노미스토리-
							</h5>
							<p id="font">친구랑 같이 서울 올라간김에 같이 만났는데 어디갈지 리스트를 보내주셨는데 거기서 선택한 #러시아가정식 식당 #연남동 연남동에 위치한 #부퓌에트발랴</p>
						</div>
					</article>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-body p-0">
					<div class="container-fluid">
						<div class="row gy-4">
							<div class="col-lg-4 col-sm-12 bg-cover" style="background-image: url(img/KakaoTalk_20221027_140641868_03.jpg); min-height: 300px;">
								<div></div>
							</div>
							<div class="col-lg-8">
								<form class="p-lg-5 col-12 row g-3">
									<div>
										<h1>Get in touch</h1>
										<p>Fell free to contact us and we will get back to you as soon as possible</p>
									</div>
									<div class="col-lg-6">
										<label for="userName" class="form-label">First name</label>
										<input type="text" class="form-control" placeholder="Jon" id="userName" aria-describedby="emailHelp">
									</div>
									<div class="col-lg-6">
										<label for="userName" class="form-label">Last name</label>
										<input type="text" class="form-control" placeholder="Doe" id="userName" aria-describedby="emailHelp">
									</div>
									<div class="col-12">
										<label for="userName" class="form-label">Email address</label>
										<input type="email" class="form-control" placeholder="Johndoe@example.com" id="userName" aria-describedby="emailHelp">
									</div>
									<div class="col-12">
										<label for="exampleInputEmail1" class="form-label">Enter Message</label>
										<textarea name="" placeholder="This is looking great and nice." class="form-control" id="" rows="4"></textarea>
									</div>

									<div class="col-12">
										<button type="submit" class="btn btn-brand">Send Message</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>








    <script src="/resources/js/index/jquery.min.js"></script>
  
    <script src="/resources/js/index/owl.carousel.min.js"></script>
    <script src="/resources/js/index/app.js"></script>

</body>
</html>