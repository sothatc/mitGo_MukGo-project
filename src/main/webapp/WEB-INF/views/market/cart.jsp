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
	<link rel="stylesheet" href="/resources/css/cart.css">
	


  <!-- ////////////////////////////////////////////////////////////////////// -->
<section id="services" class="text-center">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="intro" id="font">
                    <h1 id="font" >My Cart</h1>
                    <h2 id="font">주문/결제</h2>
                    <div class="cart-option">
                    <div>
                        <button type="button" id="cart-option">장바구니</button>
                    </div>
                    <div class="line"></div>
                    <div>
                        <button type="button"  id="cart-option">결제</button>
                    </div>
                    <div class="line"></div>
                    <div>
                        <button type="button"  id="cart-option">주문완료</button>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
</section>
    <!-- ////////////////////////////////////////////////////////////////////// -->
    <div class="page-content">
        
        
        <div class="cart">
            <div class="cart-table">
                 
                 <table>
                 	
                     <tr id="font">
                         <th colspan="3" class="cart-product-title">상품명</th>
                         <th>가격</th>
                         <th>수량</th>
                         <th>배송비</th>
                     </tr>
               			
		                	<tr id="font">
		                        <td>
		                        	<input type="hidden" name="cartNo" value="">
		                        	<input type="hidden" name="userNo" value="">
		                            <input type="checkbox" id="" class="cart-check">
		                            <label for="">
		                                <i class="fa-solid fa-check"></i>
		                            </label>
		                        </td>
		                        <td>
		                            <img src="/resources/img/index/메인맛집리스트슬라이드.jpg">
		                        </td>
		                        <td>마켓상품이름</td>
		                        <td>
		                        	상품가격
		                        	<input type="hidden" name="bookPrice" class="cart-price" value="">
		                        </td>
		                        <td>
		                            <button type="button" class="cart-quantity-down">-</button>
		                            <input type="text" class="cart-quantity" value="" readonly>
		                            <button type="button" class="cart-quantity-up">+</button>
		                        </td>
		                       
		                    </tr>
		                    
                 		<tr>
                         <td colspan="6" id="font">
                             <p>총 <span class="cart-quantity-sum"></span>개</p>
                             총 상품가격 <span class="cart-price-sum"></span>원 + 배송비 <span>0</span>원 = 총 결제 예상 금액 <span class="cart-price-sum"></span>원
                         </td>
                     	</tr>
                 </table>
                 <div class="cart-checks-btn">
                    <button type="button" class="allCheck" id="font">전체 선택</button>
                    <input type="checkbox" id="allCheckbox">
                    <button type="button" class="deleteCheck"id="font">선택 삭제</button>
                </div>
                
                 <div class="cart-btn" id="font">
                     <button type="button" onclick="goToPage();">계속 쇼핑하기</button>
                    
                 </div>
            </div>
        </div>
    </div>
<footer>
        <div class="footer-top text-center">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 text-center">
                        <h4 class="navbar-brand">믿GO먹GO<span class="dot">!</span></h4>
                        <p id="font">서울 맛집 탐방하기. 서울에서 꼭 먹어봐야 할 음식 리스트! 서울의 감성 카페부터 한식, 중식, 일식, 양식, 아시아식, 채식, 할랄까지 서울 맛집 총정리.</p>
                        <div class="col-auto social-icons">
                            <a href="#"><i class='bx bxl-facebook'></i></a>
                            <a href="#"><i class='bx bxl-twitter'></i></a>
                            <a href="#"><i class='bx bxl-instagram'></i></a>
                            <a href="#"><i class='bx bxl-pinterest'></i></a>
                        </div>
                        <div class="col-auto conditions-section">
                            <a href="#">privacy</a>
                            <a href="#">terms</a>
                            <a href="#">disclaimer</i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom text-center">
            <p class="mb-0">Copyright vicpra 2022. All rights Reserved</p> Distributed By <a
                hrefs="https://themewagon.com">ThemeWagon</a>
        </div>
    </footer>
</body>
</html>
