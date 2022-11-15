<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                         <th style=" width: 5%;">v</th>
                         <th style=" width: 5%;">No.</th>
                         <th style=" width: 20%;">이미지</th>
                         <th style=" width: 20%;" class="cart-product-title">상품명</th>
                         <th style=" width: 20%;">가격</th>
                         <th style=" width: 10%;">수량</th>
                         <th style=" width: 20%;">배송비</th>
                     </tr>
               			
		                	
		                	<tbody>
		                	<c:forEach items="${list }" var="Cart">
		                	
		                	<tr class="showCartList" id="font">
		                        
		                        	 <td style="text-align:center"><input type="checkbox" name="productCheck" class="deleteBtn">
					           		 	<input type="hidden" value="${sessionScope.m.memberNo }">
					           		 	<input class="pNo" type="hidden" value="${Cart.pNo }">
					            	 </td>
					                <td style="text-align:center">${Cart.cartNo }</td>
						          	<td style="text-align:center">${Cart.pName }</td>
						           	<td class="pPrice" style="text-align:center">${Cart.pPrice }</td>
						           	<td style="text-align:center">${Cart.cartQuan }
		                          		  <button type="button" class="cart-quantity-down">-</button>
		                            		<input type="text" class="cart-quantity" value="" readonly>
		                            	  <button type="button" class="cart-quantity-up">+</button>
		                        	 </td>
					            	<td class="shipping">무료</td>
		                    </tr>
		                </c:forEach>    
                 		<tr>
		                      	<td colspan="5"></td>
		                      	<td id="font">합계 :</td>
		                      	<td>
		                      		<input type="hidden" style="border:none;" class="hiddenPayPrice payPrice" name="productsPrice" readonly>
		                      		<p class="lastPrice"></p>
		                      		
		                     	</td>
	                      	</tr>
                     	</tbody>
                 </table>
                 <div class="cart-checks-btn">
                    <button type="button" class="allCheck" id="font">전체 선택</button>
                    <input type="checkbox" id="allCheckbox">
                    <button type="button" class="deleteCheck"id="font">선택 삭제</button>
                </div>
                
             <div class="cart-btn">
                     <button type="button" id="font">계속 쇼핑하기</button>
	                 <button type="button" id="font">주문하러 가기</button>
                    
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
            <p class="mb-0">믿고먹고 mgmg</p>Made By <a
                hrefs="https://themewagon.com">MGMG</a>
        </div>
    </footer>
    <script>
    const allCheckbox = document.querySelector("#productCheck");
	const allCheck = document.querySelector(".allCheck");
	allCheck.addEventListener("click", function(){
	    allCheckbox.click();
	    const check = document.querySelectorAll(".allCheck");
	    const status = allCheckbox.checked; // check되면 true
	    for(let i=0; i<check.length; i++) {
	        check[i].checked = status;
	    }
	    if(status) {
			allCheck.innerText = "선택 해제";
		} else {
			allCheck.innerText = "전체 선택";
		}
	});
	
	
	const chkArr = new Array();
	const check = document.querySelectorAll(".cart-check");
	for(let i=0; i<check.length; i++) {
	    check[i].addEventListener("change", function(){
	        for(let j=0; j<check.length; j++) {
	            chkArr.push(check[j].checked);
	            if(chkArr.length > check.length) {
	                chkArr.shift();
	            }
	        }
	        if(chkArr.indexOf(false) == -1) { // chkArr에 false가 포함되지 않았다면
	            allCheckbox.checked = true;
	            allCheck.innerText = "선택 해제";
	        } else {
	            allCheckbox.checked = false;
	            allCheck.innerText = "전체 선택";
	        }
	    });
	}
	
    
	</script>
</body>
</html>
