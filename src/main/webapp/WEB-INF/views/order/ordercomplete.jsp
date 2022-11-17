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
	<link rel="stylesheet" href="/resources/css/ordercomplete.css">
	


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
                        <button type="button" id="cart-option" style="color: white;">장바구니</button>
                    </div>
                    <div class="line"></div>
                    <div>
                        <button type="button"  id="cart-option" style="color: white;">결제</button>
                    </div>
                    <div class="line"></div>
                    <div>
                        <button type="button"  id="cart-option" style=" background-color : #fdbe02;  color: black; font-weight: 600;">주문완료</button>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
</section>

    <!-- ////////////////////////////////////////////////////////////////////// -->
<div class="done">

    <div class="done1" id="font">
     <div id="order-msg"><br>주문이 완료되었습니다.<br>감사합니다.</div>
     
     <div class="back">
        <div class="back-main" id="font">
            <a href="http://127.0.0.1:5501/index.html"><img src="/resources/img/index/카트.png"/></a>
            <p>HOME</p>
        </div>
        <div class="back-mypage" id="font">
            <a href="http://127.0.0.1:5501/index.html"><img src="/resources/img/index/홈백.png"/></a>
            <p>CART</p>
            
        </div>

    </div>
    </div>
   
  
    
   

</div>


    <!-- ////////////////////////////////////////////////////////////////////// -->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>
</body>
</html>