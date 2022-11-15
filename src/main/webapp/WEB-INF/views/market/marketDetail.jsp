<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>GOGO마켓 상세</title>
<style type="text/css">
	.titleDiv>#bookMark{
		margin-left: 330px;
		font-size: 33px;
		height: 50px;
		line-height: 50px;
	}
	
	.titleDiv>#bookMark:hover{
		cursor: pointer;
		color: gold;
		transition-duration : 0.4s;
	}
	
	.titleDiv>span:first-child, .titleDiv>span:nth-child(2) {
		padding-bottom: 10px;
	}
	
</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,200" />
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
	<link rel="stylesheet" href="/resources/css/market/marketDetail.css">
	
	<div class="contentWrap" style="font-family:Gowun Dodum;">
		<div class="directoryDiv">홈 > GOGO마켓 > 밀키트</div>
         	<div class="infoDiv1">
         		<img src="/resources/upload/market/${ma.PImg }" class="pImg">
         		<div class="titleDiv">
		            <span class="categorySpan"></span>
		            <span class="storeNameSpan">${ma.PName}</span>
		            

		            <c:choose>
		            	<c:when test="${empty bm }">
		            		<c:choose> 
				            	<c:when test="${not empty sessionScope.m }">
				            		<span class="material-icons" id="bookMark" onclick="addBookmark(${ma.PNo}, '${sessionScope.m.memberId }','${ma.PName}', ${ma.PPrice} )">
										bookmark
									</span>
				            	</c:when>
				            	
				            	<c:when test="${not empty sessionScope.o }">
				            		<span class="material-icons" id="bookMark" onclick="addBookmark(${ma.PNo}, '${sessionScope.o.ownerId }','${ma.PName}', ${ma.PPrice})">
										bookmark
									</span>
				            	</c:when>
				            	
				            	<c:otherwise>
				            		
				            	</c:otherwise>
				            </c:choose>
		            	</c:when>
		            	
		            	<c:when test="${not empty bm }">
		            		<c:choose> 
				            	<c:when test="${not empty sessionScope.m }">
				            		<span class="material-icons" id="bookMark" style="color:gold;" onclick="deleteBookmark(${ma.PNo}, '${sessionScope.m.memberId }' )">
										bookmark
									</span>
				            	</c:when>
				            	
				            	<c:when test="${not empty sessionScope.o }">
				            		<span class="material-icons" id="bookMark" style="color:gold;" onclick="deleteBookmark(${ma.PNo}, '${sessionScope.o.ownerId }')">
										bookmark
									</span>
				            	</c:when>
				            	
				            	<c:otherwise>
				            		
				            	</c:otherwise>
				            </c:choose>
		            	</c:when>
		            	
		            	<c:otherwise>
		            		
		            	</c:otherwise>
		            </c:choose>
		           
		            <a class="material-symbols-rounded share pointer" id="share">share</a>
					
         		</div>
         		<div class="tableDiv" >
         		
         			<table class="productTable">
         				<tr>
         					<th>카테고리</th>
         					<td colspan="4" class="categoryTd"></td>
         				</tr>
         				<tr>
         					<th>배송</th>
         					<td colspan="4">무료배송</td>
         				</tr>
         				<tr>
         					<th>알레르기 정보</th>
         					<td colspan="4">${ma.allergyInfo}</td>
         				</tr>
         				<tr>
         					<th>유통기한</th>
         					<td colspan="4">${ma.expiryDate}</td>
         				</tr>
         				<tr>
         					<th>수량 선택</th>
		                     <td style="width:30px;">
		                        <button class="w3-button w3-circle w3-teal" id="down" style="width: 35px; height: 35px; padding: 0;">-</button>
		                     </td>
		                     <td class="peopleTd" style="width:30px;">
		                        <span class="countNum" style="width:30px;">1</span>
		                     </td>
		                     <td style="width:30px;">
		                        <button class="w3-button w3-circle w3-teal" id="up" style="width: 35px; height: 35px; padding: 0;">+</button>
		                     </td>
		                     <td><td>
         				</tr>
         			</table>
         		</div>
         		<div class="priceDiv" >
         			<div class="priceDiv1">
	         			<span>총 금액: </span>
	         			<span class="priceSpan"></span>
	         			<span>원</span>
         			</div>
         		</div>
         		<c:choose>
         			<c:when test="${empty sessionScope.m && empty sessionScope.o}">
                        <a href="/loginFrm.do">
	                         <button id="loginMarketBtn">로그인</button>
                      	</a>
         			</c:when>
         			<c:otherwise>
         			<form action="/insertCart.do">
         				<div class="btnWrap">
		         			<button type="submit" class="cartBtn">장바구니</button>
		         			<button type="submit" class="buyBtn">구매하기</button>
		         			<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
		         			<input type="hidden" name="pPrice" class="allPrice">
		         			<input type="hidden" name="pNo" class="pNumber">
		         			<input type="hidden" name="cartQuan" class="count">
		         			<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
		         		</div>
		         	</form>
         			</c:otherwise>
         		</c:choose>
         	</div>
         	
	</div> <!-- contentWrap 종료 -->
	
	<!-- 상품 상세 내용 div -->
	<div class="contentWrap2" style="font-family:Gowun Dodum;">
		${ma.PContent}
	</div>
	
	<!-- 공유하기 모달 -->
    <div class="w3-container" style="font-family:Gowun Dodum;">
           <div id="shareModal" class="w3-modal" style="font-family:Gowun Dodum; z-index:2000;">
             <div class="w3-modal-content w3-animate-top w3-card-4" style="width:50%; height: 30%;">
               <header class="w3-container w3-teal" style="height:15%;"> 
                 <span onclick="document.getElementById('shareModal').style.display='none'" 
                 class="w3-button w3-display-topright" style="width:5%; height:15%;">&times;</span>
               </header>
               	 <h5 style="font-family:Gowun Dodum; text-align: center; font-weight: bolder; margin-top:40px;">공유하기</h5>
                 <div style="width:100%; height:30%;padding:0; margin-top:20px;;display:flex; justify-content: center; align-items: center; color:black;">
		                 <button style="height:30px; background-color: rgb(51,51,51); border-radius: 15px; color: white;" class="pointer">
		                 	<a href="javascript:shareMessage()" id="share2" style="text-decoration: none;">카카오톡 공유하기</a>
		                 </button>
		                 <input type="text" id="currentUrl"  style="width:400px; margin-left: 20px;"readonly>
		                 <button type="button" class="urlBtn" name="btnClick"  style="padding:2px; margin-left:10px;background-color: rgb(51,51,51); border-radius: 15px; color: white;" class="pointer">
		                 	<a style="text-decoration: none;width:120px;data-clipboard-target="#currentUrl">url 복사</a>
		                 </button>
                 </div>
             </div>
           </div>
      </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />


    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js" integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script>
    <script>
    	Kakao.init('b9d4c91a07666b464ce95d2ffa8d018c');
    </script>
      
    <!-- 클립보드 복사하기 API -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.0/clipboard.min.js"></script>

	<script>
	
		function deleteBookmark(pNo, id){
			$("#bookMark").css("color", "#516171");
			
			$.ajax({
				url : "/deleteBookmark.do",
				type : "post",
				data : {pNo : pNo, bookMarkId : id},
				success : function(data){
					console.log(data);
				}
			})
		}	
	
	function addBookmark(pNo, id, pName, pPrice){
		$("#bookMark").css("color", "gold");
		
		$.ajax({
			url : "/insertBookMark.do",
			type : "post",
			data : {pNo : pNo, bookMarkId : id, pName : pName, pPrice : pPrice},
			success : function(data){
				console.log(data)
			}
		})
	}
	
    //---------- 인원수 늘리기
    var countNumVal = $(".peopleTd").text();
    var price = "${ma.PPrice}";
    $(".priceSpan").text((countNumVal*price).toLocaleString('ko-KR'));
    let count = 1;
	
    $("#up").on("click", function(e) {
    	count++;
    	$(".countNum").text(count);
    	var countNumVal = $(".peopleTd").text();
        const sumPrice = (countNumVal*price).toLocaleString('ko-KR');
        $(".priceSpan").text(sumPrice);
    });
          
    $("#down").on("click", function(e) {
    	if(count==1){
    		return false;
    	}
   	 	count--;
    	$(".countNum").text(count);
    	var countNumVal = $(".peopleTd").text();
        const sumPrice = (countNumVal*price).toLocaleString('ko-KR');
        $(".priceSpan").text(sumPrice);
        
    }); 
    

    var categoryNum = "${ma.PCategory}";
    console.log(categoryNum);
	if(categoryNum=8){
		$(".categorySpan").text("[디저트]");
		$(".categoryTd").text("디저트");
	}else if(categoryNum=9){
		$(".categorySpan").text("[기타]");
		$(".categoryTd").text("기타");
	}else if(categoryNum=10){
		$(".categorySpan").text("[밀키트]");
		$(".categoryTd").text("밀키트");
	}else if(categoryNum=11){
		$(".categorySpan").text("[냉동식품]");
		$(".categoryTd").text("냉동식품");
	}
	
	
	var pNo = "${ma.PNo}";
	//---------- 공유하기 버튼
	 function shareMessage(){
		
		Kakao.Share.createDefaultButton({
		  container: '#share2',
		  objectType: 'text',
		  text:
		    '우리집도 맛집이라고? 이제는 집에서도 즐기자!',
		  link: {
		    mobileWebUrl: 'http://192.168.10.26/marketDetail.do?pNo='+pNo,
		    webUrl: 'http://192.168.10.26/marketDetail.do?pNo='+pNo
		  }
		});
	}
	
	//장바구니 클릭 시 hidden으로 넘겨주는 값
	$(".cartBtn").on("click", function(){
	 	$(".allPrice").attr("value",count*price);
	 	$(".pNumber").attr("value",pNo);
	 	$(".count").attr("value",count);
	});
	
    //------ 공유하기 모달
    $("#share").on("click",function(){
  	  document.getElementById('shareModal').style.display='block';
    });
    
    
    //---- 클립보드 복사 기능
    var url = window.location.href;
    $("#currentUrl").attr("value",url);
    $(".urlBtn").attr("data-clipboard-text",url);
    
    var clipboard = new ClipboardJS('.urlBtn');
		clipboard.on('success', function(e) {
		    console.info('Action:', e.action);
		    console.info('Text:', e.text);
		    console.info('Trigger:', e.trigger);
		    alert("클립보드에 복사되었습니다.");
		});

		clipboard.on('error', function(e) {
		    console.error('Action:', e.action);
		    console.error('Trigger:', e.trigger);
		});
		
		</script>
</body>
</html>