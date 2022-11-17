<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOGO마켓</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    color: white;
    
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
                        <button type="button" id="cart-option" style=" background-color : #fdbe02;  color: black; font-weight: 600;">결제</button>
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
		                	
		                <c:forEach items="${list }" var="Cart">
		                	<tr class="showCartList" id="font">
		                        
		                        	<td style="text-align:center">${Cart.PName }</td>
					            	<td class="pImg" style="text-align:center"><img src="/resources/upload/market/${Cart.PImg }"></td>
						           	<td class="pPrice" style="text-align:center">${Cart.PPrice }</td>
						           	<td style="text-align:center">${Cart.cartQuan }</td>
					            	<td class="shipping">무료</td>
					            	<td style="text-align:center;" class="cartTotalPrice">${Cart.PPrice*Cart.cartQuan }</td>
								 		 
					            	
		                    </tr>
		             
		                 </c:forEach>
		             
                 		
                 		   <tr>
		                      	<td colspan="5"></td>
		                      	
		                      	<td>
		                      		<input type="hidden" style="border:none;" class="hiddenPayPrice payPrice" name="productsPrice" readonly>
		                      		<p id="font" class="lastPrice totalp" style="float:left;"></p>
		                      		<p id="font"class="totalp" style="float:left;">원</p>
		                     </td>
		                      
	                      	</tr>
                     	</tbody>
                        
		                        
                            
               </table>
            </div>
        </div>
            
            
            <form id="order-form" action="/orderNext.do" method="post" autocomplete="off">
                
                <div class="page-title order-title" id="font">주문정보</div>
                <div class="order-info" id="font">
                    <div class="order-box">
                        <label for="name" class="order-label">주문자명</label>
                        <input type="text" id="orderName" class="order-input medium" value="${sessionScope.m.memberName }">
                    </div>
                    <div class="order-box">
                        <label for="phone" class="order-label">전화번호</label>
                        <input type="text"  id="orderPhone" class="order-input medium" value="${sessionScope.m.memberPhone }">
                    </div>
                   
                </div>
				<input type="hidden" id="cart-quantity-sum" name="orderQuan" value="${Order.cartQuan }">
				<input type="hidden" id="cart-price-sum" name="orderPrice" value="${Order.PPrice }">
				<input type="hidden" id="cart-price-sum" name="pNo" value="${Order.PNo }">
				
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
                        <input type="text" class="order-input medium hidden-order-info" value="${sessionScope.m.memberName }" style="display:none;">
                        <span class="comment"></span>
                    </div>
                    <div class="order-box">
                        <label for="shippingPhone" class="order-label">전화번호</label>
                        <input type="text" name="shippingPhone" id="shippingPhone" class="order-input medium view-order-info" placeholder="010-0000-0000"required>
                        <input type="text" class="order-input medium hidden-order-info" value="${sessionScope.m.memberPhone }" style="display:none;">
                        <span class="comment"></span>
                    </div>
                    <div class="order-box">
                        <label for="shippingAddr1" class="order-label">주소</label>
                        <input type="text" name="shippingAddr1" id="shippingAddr1" class="order-input long" readonly="readonly">
                        <input type="text"  style="display:none;" readonly>
                        <button type="button" id="addr-btn" onclick="searchAddr();">주소찾기</button>
                        <span class="comment"></span>
                    </div>
                    <div class="order-box">
                        <label for="shippingAddr2" class="order-label">상세 주소<span class="comment"></span></label>
                        <input type="text" name="shippingAddr2" id="shippingAddr2" class="order-input llong">
                        <input type="text"  style="display:none;">
                        <span class="comment"></span>
                    </div>
                </div>
               
                 

                <div class="order-info" style="padding-top: 80px;">
                    <div id="agree-box" >
                        <input type="checkbox" id="info-agree" class="order-agree">
                        <label for="info-agree"><i class="fa-solid fa-check"></i></label>
                        <label for="info-agree" id="font">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</label>
                    </div>
                    <div class="order-btn" id="font">
                        <button type="button" id="payBtn">결제하기</button>
                    </div>
                </div>               
              
              
              
                
            </form>
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
    


<script>
function searchAddr() {
    new daum.Postcode({
        oncomplete: function(data) {
           
           console.log(data);
            
            
          
           $("#shippingAddr1").val(data.zonecode + " " + data.roadAddress);
           $("#shippingAddr2").focus();
            
            
        }
    }).open();
}

$("#order-same").on("change", function(){
    if($(this).prop("checked")) {
        $(".view-order-info").hide();
        $(".view-order-info").attr("name", "");
        $(".hidden-order-info").show();
        $(".hidden-order-info").eq(0).attr("name", "shippingName");
        $(".hidden-order-info").eq(1).attr("name", "shippingPhone");
        
    } else {
        $(".hidden-order-info").hide();
        $(".hidden-order-info").attr("name", "");
        $(".view-order-info").show();
        $(".view-order-info").eq(0).attr("name", "shippingName");
        $(".view-order-info").eq(1).attr("name", "shippingPhone");
        $(".view-order-info").eq(2).attr("name", "shippingAddr1");
        $(".view-order-info").eq(3).attr("name", "shippingAddr2");
    }
});

$("#payBtn").on("click",function(){
const price = $(".totalp").val();
console.log(price);
const name = $("#orderName").val();
const d = new Date();
const date = d.getFullYear() +""+ (d.getMonth()+1) +""+ d.getDate() +""+ d.getHours() +""+ d.getMinutes() +""+ d.getSeconds(); // 문자열덧셈을 위해 빈 문자열 넣음
IMP.init("imp47242167");
IMP.request_pay({
    pg: "html5_inicis",
    merchat_uid : "mgmg"+date, 			// 거래ID
    name : "믿고먹고",						// 결제 이름
    amount : price,							// 결제 금액
    
    buyer_name : name					// 구매자 이름
    // buyer_tel : "010-1234-1234", 			// 구매자 전화번호
    // buyer_addr : "서울시 영등포구 당산동",			// 구매자 주소
    // buyer_postcode : "12345"				// 구매자 우편번호
}, function(rsp){
    if(rsp.success) {
    	const input = $("<input type='hidden' name='impUid' value='"+rsp.imp_uid+"'>");
		$("#order-form").append(input);	
        $("#order-form").submit();
    } else { 
        alert("결제 실패");						
    }

})

});

function sum(){
    const cartTotalPrice = $(".cartTotalPrice");
    let result = 0;
    for(let i=0; i<cartTotalPrice.length; i++){
       result += Number(cartTotalPrice.eq(i).text());
    }        
    $(".payPrice").val(result);
    const lastPrice = $(".lastPrice");
    const ViewPrice = result.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    lastPrice.text(ViewPrice);
 }
sum();
</script>

</body>
</html>