<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOGO마켓</title>
<style>
	#cart-option{
    float: left;
    margin: 10px;
    width: 150px;
    height: 60px;
    border: none;
    border-radius: 5px;
    background-color : #f5d575;
    text-align: center;
    
}

.cart-option{
  margin-left: 380px;
  margin-top: 50px;
 }
 
 .line{

    float: left;
    margin: 10px;
   
    float: left;
    width: 2px;
    height: 60px;
    border-left: 1px solid rgb(136, 136, 136);
 }
</style>
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
	<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
	<link rel="stylesheet" href="/resources/css/order.css">



 <!-- ////////////////////////////////////////////////////////////////////// -->
<section id="services" class="text-center">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="intro" id="font">
                    <h1 id="font" >My Order</h1>
                    <h2 id="font">주문/결제</h2>
                    <div class="cart-option">
                    <div >
                        <button type="button" id="cart-option">장바구니</button>
                    </div>
                    <div class="line"></div>
                    <div>
                        <button type="button" id="cart-option" style=" background-color : #fdbe02;">결제</button>
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
	
      
        <div class="order">
            <div class="cart-table order-info">
                <table>
                    <tr id="font">
                        <th style=" width: 20%;" class="cart-product-title">상품명</th>
                        <th style=" width: 20%;">이미지</th>
                        <th style=" width: 15%;">가격</th>
                        <th style=" width: 10%;">수량</th>
                        <th style=" width: 15%;">배송비</th>
                        <th style=" width: 20%;">총 금액</th>
                    </tr>
                    
	                   <tbody>
		                	
		                	
		                	<tr class="showCartList" id="font">
		                        
		                        	<td style="text-align:center">${Order.PName }</td>
					            	<td class="pImg" style="text-align:center"><img src="/resources/upload/market/${Order.PImg }"></td>
						           	<td class="pPrice" style="text-align:center">${Order.PPrice }</td>
						           	<td style="text-align:center">${Order.cartQuan }</td>
					            	<td class="shipping">무료</td>
					            	<td style="text-align:center;" class="cartTotalPrice">${Order.PPrice*Order.cartQuan }</td>
								 		
					            	
		                    </tr>
		             
		             
		             
                 		
                 		   <tr>
		                      	<td colspan="4"></td>
		                      	
		                      	<td>
		                      		<input type="hidden" style="border:none;" class="hiddenPayPrice payPrice" name="productsPrice" readonly>
		                      		<p class="lastPrice"></p>
		                        </td>
		                        <td id="font">총 합계 : ${Order.PPrice*Order.cartQuan }원</td>
	                      	</tr>
                     	</tbody>
                        
                            
               </table>
            </div>

            <form id="order-form" action="/insertOrder.do" method="post" autocomplete="off">
                <div class="page-title order-title">주문정보</div>
                <div class="order-info">
                    <div class="order-box">
                        <label for="name" class="order-label">주문자명</label>
                        <input type="text" name="name" id="orderName" class="order-input medium" >
                    </div>
                    <div class="order-box">
                        <label for="phone" class="order-label">전화번호</label>
                        <input type="text" name="phone" id="orderPhone" class="order-input medium" >
                    </div>
                   
                </div>
				<input type="hidden" name="memberNo" value="">
				<input type="hidden" id="cart-quantity-sum" name="orderQuan">
				<input type="hidden" id="cart-price-sum" name="orderPrice">
				
                <div class="page-title order-title">배송정보</div>
                <div class="order-info shipping">
                    <div id="same-check">
                        <input type="checkbox" id="order-same" class="order-agree">
                        <label for="order-same"><i class="fa-solid fa-check"></i></label>
                        <label for="order-same">주문자와 동일</label>
                    </div>
                    <div class="order-box">
                        <label for="shippingName" class="order-label">수령인명</label>
                        <input type="text" name="shippingName" id="shippingName" class="order-input medium view-order-info" required>
                        <input type="text" class="order-input medium hidden-order-info" style="display:none;">
                        <span class="comment"></span>
                    </div>
                    <div class="order-box">
                        <label for="shippingPhone" class="order-label">전화번호</label>
                        <input type="text" name="shippingPhone" id="shippingPhone" class="order-input medium view-order-info" required>
                        <input type="text" class="order-input medium hidden-order-info" style="display:none;">
                        <span class="comment"></span>
                    </div>
                    <div class="order-box">
                        <label for="shippingAddr1" class="order-label">주소</label>
                        <!-- <input type="text" name="postcode" id="postcode" class="order-input short" required readonly> -->
                        <input type="text" name="shippingAddr1" id="shippingAddr1" class="order-input long view-order-info" required readonly>
                        <input type="text" class="order-input long hidden-order-info" style="display:none;" readonly>
                        <button type="button" id="addr-btn" onclick="searchAddr();">주소찾기</button>
                        <span class="comment"></span>
                    </div>
                    <div class="order-box">
                        <label for="shippingAddr2" class="order-label">상세 주소<span class="comment"></span></label>
                        <input type="text" name="shippingAddr2" id="shippingAddr2" class="order-input llong view-order-info" required>
                        <input type="text"  class="order-input llong hidden-order-info" value="" style="display:none;">
                        <span class="comment"></span>
                    </div>
                </div>

                <div class="page-title order-title">결제정보</div>
                <div class="order-info">
                    <div class="order-box">
                        <input type="radio" name="payType" id="order-card" value="card" checked>
                        <label for="order-card">카드 결제</label>
                        <input type="radio" name="payType" id="order-cash" value="cash">
                        <label for="order-cash">무통장입금</label>
                    </div>
                </div>

                <div class="order-info">
                    <div id="agree-box">
                        <input type="checkbox" id="info-agree" class="order-agree">
                        <label for="info-agree"><i class="fa-solid fa-check"></i></label>
                        <label for="info-agree">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</label>
                    </div>
                    <div class="order-btn">
                        <button type="button" id="payBtn">결제하기</button>
                    </div>
                </div>
            </form>
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