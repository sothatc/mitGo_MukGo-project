<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOGO마켓</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
    input[type="checkbox"] {
        -webkit-appearance: none;
        position: relative;
        width: 16px;
        height: 16px;
        cursor: pointer;
        outline: none !important;
        border: 2px solid #ffe9a4;
        border-radius: 2px;
        background: #fbfbfb;
    }
 
    input[type="checkbox"]::before {
        content: "\2713";
        position: absolute;
        top: 50%;
        left: 50%;
        overflow: hidden;
        transform: scale(0) translate(-50%, -50%);
        line-height: 1;
    }
 
    input[type="checkbox"]:hover {
        border-color: #ffe9a4;
    }
 
    input[type="checkbox"]:checked {
        background-color: #ffc107;
        border-color: rgba(255, 255, 255, 0.3);
        color: white;
    }
 
    input[type="checkbox"]:checked::before {
        border-radius: 2px;
        transform: scale(1) translate(-50%, -50%)
    }
    .cart-option{
	 width: 1300px;
	background-color: #ffc107;
    margin: 0 auto;
}
</style>
 
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
                        <div id="cart-option" style=" background-color : #fdbe02;  color: black; font-weight: 600;">장바구니</div>
                    </div>
                    <div class="line"></div>
                    <div>
                        <div id="cart-option" style="color: white;">결제</div>
                    </div>
                    <div class="line"></div>
                    <div>
                        <div  id="cart-option" style="color: white;">주문완료</div>
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
                         <th style=" width: 5%;"><label></label><input type="checkbox" name="productCheck" onclick="selectAll(this)" style="width: 15px; height: 15px; "></th>
                         <th style=" width: 20%;">이미지</th>
                         <th style=" width: 20%;" class="cart-product-title">상품명</th>
                         <th style=" width: 15%;">가격</th>
                         <th style=" width: 10%;">수량</th>
                         <th style=" width: 15%;">배송비</th>
                         <th style=" width: 15%;">총 금액</th>
                     </tr>
               			
		                	
		                	<tbody>
		                	
		                	<c:forEach items="${list }" var="Cart">
		                	
		                	<tr class="showCartList" id="font">
		                        
		                        	 <td style="text-align:center">
		                        	 	<input type="checkbox" name="productCheck" class="deleteBtn">
					           		 	<input type="hidden" value="${sessionScope.m.memberId }">
					           		 	<input class="pNo" type="hidden" value="${Cart.PNo }">
					            	 </td>
					            	<td class="pImg" style="text-align:center"><img src="/resources/upload/market/${Cart.PImg }" ></td>
						          	<td style="text-align:center">${Cart.PName }</td>
						           	<td class="pPrice" style="text-align:center"><fmt:formatNumber value="${Cart.PPrice }" pattern="#,###" /></td>
						           	<td style="text-align:center">${Cart.cartQuan }
		                          		  
		                        	 </td>
					            	<td class="shipping">무료</td>
					            	<td style="text-align:center; display: none;" class="cartTotalPrice">${Cart.PPrice*Cart.cartQuan }</td>
					            	<td style="text-align:center;"><fmt:formatNumber value="${Cart.PPrice*Cart.cartQuan }" pattern="#,###" /></td>
					            	
		                    </tr>
		             
		             
		             
								 
		                 </c:forEach>    
                 		
                 		   <tr>
		                      	<td colspan="6"></td>
		                      	
		                      	<td>
		                      		<input type="hidden" style="border:none;" class="hiddenPayPrice payPrice" name="productsPrice" readonly>
		                      		<p id="font" class="lastPrice" style="float:left;"></p>
		                      		<p id="font" style="float:left;">원</p>
		                    </td>
		                    
		                    
	                      	</tr>
                     	</tbody>
                 </table>
                 <div class="cart-checks-btn">
                   
                    <button type="button" class="deleteCheck"id="font">선택 삭제</button>
                </div>
                
             <div class="cart-btn">
                     <button type="button" id="font">계속 쇼핑하기</button>
	                 
                    <button type="button" class="payBtn" onclick="goToOrder('${sessionScope.m.memberId }');">주문하러 가기</button>
                 </div>
                 
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
    function selectAll(selectAll)  { // 전체선택
		  const checkboxes 
		       = document.getElementsByName("productCheck");
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		}
      
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

		
	function goToOrder(memberId){
		console.log(memberId);
		location.href = "/ordercart.do?memberId="+memberId;
	}
	

	
	
 	$(".deleteCheck").on("click", function(){
		// 체크한것 삭제
			
		    const check = $(".deleteBtn:checked");
		    if(check.length == 0) {
		        alert("선택된 상품이 없습니다.")
				return;
		    }
		    
		    const delCartArr = new Array();
		    const memberId = check.next().val();
		    console.log(memberId);
		    
		    for(let i=0; i<check.length; i++) {
			    // 체크된 카트 번호
			    const cartNo = check.eq(i).next().next().val();
				console.log(cartNo);
				delCartArr.push(cartNo);	
			}
			console.log(delCartArr);	    
			location.href="/deleteCart.do?memberId="+memberId+"&delCartArr="+delCartArr.join("/");
		});
			
			
		
	 
	
	
	
		
	
    
	</script>
</body>
</html>
