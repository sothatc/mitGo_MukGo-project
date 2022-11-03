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
	<link rel="stylesheet" href="/resources/css/payment.css">

	<div class="page-content">
	
        <div class="page-title"></div>
        <div class="order">
            <div class="cart-table order-info">
                <table>
                    <tr>
                        <th colspan="2" class="cart-product-title">상품명</th>
                        <th>가격</th>
                        <th>수량</th>
                    </tr>
                    
	                    <tr>
	                        <td>
	                            <img src="/resources/img/index/마켓도시락.jpg">
	                        </td>
	                        <td>제육밀키트</td>
	                        <td>
	                        	(밀키트 가격)
	                        	<input type="hidden" name="bookPrice" class="cart-price" value="">
	                        </td>
	                        <td class="cart-quantity">10</td>
	                    </tr>
	                
                    <tr>
                        <td colspan="4">
                            결제 금액 <span class="cart-price-sum"></span>원
                        </td>
                    </tr>
                </table>
            </div>

            <form id="order-form" action="/insertOrder.do" method="post" autocomplete="off">
                <div class="page-title order-title">주문정보</div>
                <div class="order-info">
                    <div class="order-box">
                        <label for="name" class="order-label">주문자명</label>
                        <input type="text" name="name" id="orderName" class="order-input medium" value="주문자이름" readonly>
                    </div>
                    <div class="order-box">
                        <label for="phone" class="order-label">전화번호</label>
                        <input type="text" name="phone" id="orderPhone" class="order-input medium" value="전화번호" readonly>
                    </div>
                    <div class="order-box">
                        <label for="email" class="order-label">이메일</label>
                        <input type="text" name="email" id="orderEmail" class="order-input medium" value="주소" readonly>
                    </div>
                </div>
				<input type="hidden" name="memberNo" value="">
				<input type="hidden" id="cart-quantity-sum" name="orderQuan">
				<input type="hidden" id="cart-price-sum" name="orderPrice">
				<input type="hidden" name="cartArr" value="">
				
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
                        <input type="text" class="order-input medium hidden-order-info" value="" style="display:none;">
                        <span class="comment"></span>
                    </div>
                    <div class="order-box">
                        <label for="shippingPhone" class="order-label">전화번호</label>
                        <input type="text" name="shippingPhone" id="shippingPhone" class="order-input medium view-order-info" required>
                        <input type="text" class="order-input medium hidden-order-info" value="" style="display:none;">
                        <span class="comment"></span>
                    </div>
                    <div class="order-box">
                        <label for="shippingAddr1" class="order-label">주소</label>
                        <!-- <input type="text" name="postcode" id="postcode" class="order-input short" required readonly> -->
                        <input type="text" name="shippingAddr1" id="shippingAddr1" class="order-input long view-order-info" required readonly>
                        <input type="text" class="order-input long hidden-order-info" value="" style="display:none;" readonly>
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

	
</body>
</html>