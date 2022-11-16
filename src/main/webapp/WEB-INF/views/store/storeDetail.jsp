<%@page import="kr.co.mitgomukgo.member.model.vo.Owner"%>
<%@page import="kr.co.mitgomukgo.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>맛집상세 페이지</title>
</head>
<style>
/*-----스크롤  css ------*/
body{
height: 100%;
}
.reviewContent::-webkit-scrollbar{
    width: 8px;
}
.reviewContent::-webkit-scrollbar-thumb{
    background: rgb(51,51,51);
    border-radius: 25px;
}

.reviewContent::-webkit-scrollbar-track{
    background-color: rgb(246,246,246);
}

.star{
	color: rgb(255, 83, 86) !important;
}

</style>

<body onload="initTmap()">

   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,200" />
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

   <link rel="stylesheet" href="/resources/demos/store/style.css">
   <link rel="stylesheet" href="/resources/css/store/storeDetail.css">
   <link rel="stylesheet" href="/resources/css/map.css">
   
   
   <!---------------------내용----------------------->
   <div class="content-wrap" style="font-family:Gowun Dodum;">
      <div class="content-wrap1" style="width:1200px;">
         <div class="content-wrap1-1" style="width:1200px; height:50px; display:inline; color: black;">
	            <span class="categorySpan" style="float:left;"></span>
	            <span class="storeNameSpan" style="float:left; margin-left:5px;">${s.storeName}</span>
	            <span class="reviewNum" style="color:rgba(255, 83, 86, 0.99); margin-left:10px; float:left;" >★ ${s.rating }</span>
		 	<span style=" margin-left:20px; font-weight: lighter;">${s.content }</span>
		 	<div style="margin-right:0; float:right;">
            <c:choose>
              <c:when test="${!empty sessionScope.m }">
                  <a class="material-symbols-rounded share pointer" id="share">share</a>
                  <span class="material-symbols-rounded favorite pointer" id="favorite" style="display:none;">favorite</span>
                  <span class="material-symbols-outlined unfavorite pointer" id="unfavorite" style="float:right; margin-top:10px; margin-right:15px;">favorite</span>
               </c:when>
         	</c:choose>
         	</div>
         </div>
      </div>

      <div class="content-wrap2" style="width:1200px; margin: 0 auto; background-color: rgba(255, 255, 255, 0.06);">
         <div class="content-wrap2-1" >
            <!-- 사진 슬라이드 영역 -->
            <div class="photo-wrap">
               
               <ul class="storeImgUl" style="height: 460px; width: 100%;">

                  
               </ul>
               
               
               <div class="slide-navi prev">
                  <span class="material-icons">arrow_back_ios_new</span>
               </div>
               <div class="slide-navi next">
                  <span class="material-icons">arrow_forward_ios</span>
               </div>
            </div>

            <div class="info-reserve-wrap">
               <table class="w3-table w3-bordered" id="infoTable" style="font-family:Gowun Dodum; width: 550px;">
                  <tr>
                     <th style="width:120px;">주소</th>
                     <td colspan="3" class="addressTd" style="color:black;">${s.address }</td>
                  </tr>
                  <tr>
                     <th>전화번호</th>
                     <td colspan="3" class="phoneTd" style="color:black;">${s.phone }</td>
                  </tr>
                  <tr>
                     <th>운영시간</th>
                     <td colspan="3" class="openHourTd" style="color:black;">${s.openHour }</td>
                  </tr>
                  <tr>
                     <th>휴일</th>
                     <td colspan="3" class="closedDayTd" style="color:black;">${s.closedDay}</td>
                  </tr>

                  <tr style="height: 47px;">
                     <th style="height: 47px;">일자</th>
                     <td class="calTd">
                        <div style="height: fit-content;">
                           <label for="datePicker">
                              <span class="material-symbols-outlined pointer" style="height: fit-content; line-height: 1.2;">calendar_month</span>
                           </label>
                        </div>
                     </td>
                     <td colspan="2">
                        <input type="text" id="datePicker" style="border:none;" placeholder="예약날짜선택">
                     </td>
                  </tr>
                  <tr style="height: 47px;">
                     <th>인원</th>
                     <td>
                        <button class="w3-button w3-circle" id="down" style="width: 35px; height: 35px; padding: 0; background-color: #ffc107; color:white;">-</button>
                     </td>
                     <td class="peopleTd" style="width:30px; text-align: center;">
                        <span class="people">1</span>
                     </td>
                     <td>
                        <button class="w3-button w3-circle" id="up" style="width: 35px; height: 35px; padding: 0; background-color: #ffc107; color:white;">+</button>
                     </td>
                  </tr>
                  <tr>
                     <th>예약가능시간</th>
                     <td colspan="3" class="buttonTd">
                     </td>
                  </tr>
               </table>
               <c:choose>
                  <c:when test="${empty sessionScope.m && empty sessionScope.o}">
                        <a href="/loginFrm.do">
                         <button id="loginBtn" style="font-family:Gowun Dodum; border-radius: 15px; width:550px; height:50px; background-color: rgb(51,51,51); color: white;
                         margin-top: 10px;">로그인</button>
                      </a>
                  </c:when> 
                  <c:otherwise>
                       <button name="reserveBtn" class="reserveBtn2" style="font-family:Gowun Dodum;  width:550px; height:50px; background-color: rgb(51,51,51); color: white;
                         margin-top: 10px;">예약하기</button>
                  </c:otherwise>
            </c:choose>
            </div>
         </div>
      </div>
   </div>


   <!--상세 페이지-->
   <div class="content-wrap4" style="font-family:Gowun Dodum; margin-top:30px; height:100%; width:1200px; margin-bottom:100px; margin:0 auto;">
      <div class="testDiv" style="width: 1200px; margin:0 auto;">
     	 <!----- 메뉴판 부분 ----->
         <p class="menuTitle" style="margin-top: 20px;">MENU</p>
         <blockquote class="w3-panel w3-leftbar w3-light-grey" id="menuWrap" style="width: 1200px; height:100%; padding-bottom:20px;">
            <div class="menuWrap" style="font-family:Gowun Dodum;">
               <p class="menuSubTitle">대표메뉴</p>
               <table class="w3-table w3-bordered" id="menuTable">
               <c:forEach items="${list }" var="me">
                  <tr>
                     <td style="text-align:left;">${me.menuName }</td>
                     <td style="text-align:right;"><fmt:formatNumber value="${me.menuPrice }" pattern="#,###원" /></td>
                  </tr>
				</c:forEach>
               </table>
            </div>
         </blockquote>
         
		<!----- 메뉴 부분 ----->
         <div class="food-wrap" style="width:1200px; overflow:hidden; height:100%; margin: 0 auto; text-align:center; margin:50px 0;">
	         <c:forEach items="${list }" var="me">
	            <div class="w3-card" id="photoWrap" style="font-family:Gowun Dodum; width:350px; height:300px; margin: 10px 25px;">
	               <img src=/resources/upload/menu/${me.menuImg} style='width: 100%; height: 200px;'>
	               <div class="w3-container" style="font-family:Gowun Dodum;">
	                  <p style="font-weight: bolder; font-size: 20px; margin-top:10px;">${me.menuName}</p>
	                  <p><fmt:formatNumber value="${me.menuPrice }" pattern="#,###원"/></p>
	               </div>
	            </div>
			</c:forEach>
         </div>
         
         <!----- LOCATION 부분 ----->
		 <div class="location-wrap" style="width:1200px;">
	         <div class="menuTitle" style="margin: 0 auto;">LOCATION</div>
	         <div class="map-content-wrap">
				<div id="map_wrap" class="map_wrap">
					<div id="map_div"></div>
				</div>
				<div class="map_act_btn_wrap clear_box"></div>
				<div>
					<!-- 자동차 -->
					<div class="selectCar" style="background-color:rgb(51,51,51);"><span class="material-symbols-outlined">directions_car</span>자동차</div>
					<div class="selectFoot"style="background-color:rgb(51,51,51);"><span class="material-symbols-outlined">footprint</span>도보</div>
				</div>

				<div class="ft_select_wrap">
					<div class="ft_select">
						<div class="address-wrap">

							<input type="text" class="text_custom" id="fullAddr" name="fullAddr" value="" onclick="searchAddr();" placeholder="클릭하여 출발지를 입력하세요" readonly>
							<span type="text" class="text_custom addressTd" id="E_fullAddr" name="E_fullAddr" readonly style="display:none;"></span>
							<button id="btn_select" style="display : none;">검색하기</button>
							<button id="hidden_btn_select" style="display : none;">검색하기</button>					
						</div>

						<div class="car-content">
							<button id="btn_select1">길찾기</button>
						</div>
						<div class="foot-content">
							<button id="btn_select2">길찾기</button>
						</div>
					</div>
				</div>
				<div id="resultBox">
					<p id="result">예상 정보</p>
				</div>
				
				<div class="map_act_btn_wrap clear_box"></div>
				<div class="clear"></div>
			</div>
		 </div>
		 
		 
         <!----- 마켓 상품 부분 ----->
		<c:choose>
              <c:when test="${!empty mList }">
		         <div class="market-wrap" style="margin-top:50px; width:1200px; height:300px;">
			         <div class="menuTitle" style="margin: 0 auto;">MARKET</div>
			         
			         <c:forEach items="${mList }" var="ma">
			            <div class="w3-card-4" id="marketWrap">
			               <a href="/marketDetail.do?pNo=${ma.PNo }"><img src="/resources/upload/market/${ma.PImg }" style="width: 100%"></a>
			               <div class="w3-container w3-center">
			                  <p>${ma.PName }</p>
			               </div>
			            </div>
					</c:forEach>
				</div>
		    </c:when>
        </c:choose>	
		
		
		
        <!--------- 후기 시작 ----->
        <c:choose>
              <c:when test="${!empty rList }">
			        <div class="review-wrap" style="margin:50px 0;">
			            <div class="menuTitle" style="width:100px; margin:0 auto;">REVIEW</div>
			            <ul class="w3-ul w3-card-4" id="reviewWrapUl" style="height:content-fit;">
			            <c:forEach items="${rList }" var="r">
			
							<li class="w3-bar" style="height:content-fit;">
			                  <div class="w3-bar-1" style="margin:0; height: content-fit;">
			                     <img src="/resources/upload/review/${r.reviewImg }" class="w3-hide-small" style="float: left; width:35%; height:100%;">
			                     <div class="w3-bar-item" id="w3-bar-item" style="width:60%; height: content-fit; padding:0; margin-left:5%; position: relative;">
			                        <div style="color: rgb(255, 83, 86); float:left;"><c:forEach begin="1" step="1" end="${r.rating }" varStatus="i">★</c:forEach></div>
			                        <div>${r.rating }</div>
			                        <div class="w3-large" style="font-weight: 700;">${r.writer }</div>
			                        <div class="reviewContent" style="display: inline; float: left; height:150px; overflow: auto;">${r.content}</div>
			                        <div class="regDate" style="position: absolute; bottom: 0px; right: 0px;">${r.enrollDate }</div>
			                     </div>
			                  </div>
			               </li>
			               
						</c:forEach>
			            </ul>
			        </div>
        	</c:when>
        </c:choose>	
        <!--------후기 끝 -->
         
      </div><!-- testDiv 끝 -->
      
      
      <!-- 모달 부분 -->
      <div class="modal-wrap hidden" id="modal">
          <div class="modal-box">
              <div class="modal-title">예약 정보</div>
              <div class="modal-contents">
              <form action="/reserve.do?memberNo=${m.memberNo }&storeNo=${s.storeNo}">
                  <table class="w3-table w3-bordered" id="reserveCheckTbl">
                      <tr>
                          <th>상호명</th>
                          <td class="storeNameTd">${s.storeName }</td>
                      </tr>
                      <tr>
                          <th>일자</th>
                          <td class="dateTd"></td>
                      </tr>
                      <tr>
                          <th>시간</th>
                          <td class="timeTd"></td>
                      </tr>
                      <tr>
                          <th>인원</th>
                          <td class="peopleNumTd"></td>
                      </tr>
                  </table>
                   
                  <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
                  <input type="hidden" name="storeNo" value="${s.storeNo }">
                  <input type="hidden" name="storeName" value="${s.storeName }">
                  <input type="hidden" name="eatDate" class="eatDate">
                  <input type="hidden" name="eatTime" class="eatTime">
                  <input type="hidden" name="eatNum" class="eatNum">
                  <div class="explanation">* 가게에서 최종 확정 시 예약이 확정됩니다.</div>
                  <button class="closeModal pointer" onclick="hideModal();" type="button" >닫기</button>
                  <button class="reserveBtn pointer" type="submit">예약하기</button>
              </form>
              </div>
          </div>
       </div>
       </div>
       
       
       <div style="margin-bottom:50px;"></div> <!-- 리뷰/마켓 제품이 없을 시 바로 하단에 푸터 방지 위한 div-->
       <jsp:include page="/WEB-INF/views/common/footer.jsp" />
       
       
       
       <!-- 시간 날짜 미입력 모달 -->
       <div class="w3-container" style="font-family:Gowun Dodum;">
           <div id="timeDateModal" class="w3-modal" style="font-family:Gowun Dodum; z-index:2000;">
             <div class="w3-modal-content w3-animate-top w3-card-4" style="width:30%; height: 40%;">
               <header class="w3-container w3-teal" style="height:10%;"> 
                 <span onclick="document.getElementById('timeDateModal').style.display='none'" 
                 class="w3-button w3-display-topright" style="width:5%; height:10%;">&times;</span>
               </header>
                 <p style="width:100%; height:100%;padding:0; margin:0;display:flex; justify-content: center; align-items: center; color:black;">예약하실 날짜와 시간을 선택해주세요.</p>
             </div>
           </div>
      </div>
      
      <!-- 업주일 때 모달 -->
       <div class="w3-container" style="font-family:Gowun Dodum;">
           <div id="ownerModal" class="w3-modal" style="font-family:Gowun Dodum; z-index:2000;">
             <div class="w3-modal-content w3-animate-top w3-card-4" style="width:30%; height: 40%;">
               <header class="w3-container w3-teal" style="height:10%;"> 
                 <span onclick="document.getElementById('ownerModal').style.display='none'" 
                 class="w3-button w3-display-topright" style="width:5%; height:10%;">&times;</span>
               </header>
                 <p style="width:100%; height:100%;padding:0; margin:0;display:flex; justify-content: center; align-items: center; color:black;">업주입니다!!</p>
             </div>
           </div>
      </div>
      
       <!-- 정원 초과 모달 -->
       <div class="w3-container" style="font-family:Gowun Dodum;">
           <div id="noReserveModal" class="w3-modal" style="font-family:Gowun Dodum; z-index:2000;">
             <div class="w3-modal-content w3-animate-top w3-card-4" style="width:30%; height: 40%;">
               <header class="w3-container w3-teal" style="height:10%;"> 
                 <span onclick="document.getElementById('noReserveModal').style.display='none'" 
                 class="w3-button w3-display-topright" style="width:5%; height:10%;">&times;</span>
               </header>
                 <p style="width:100%; height:100%;padding:0; margin:0;display:flex; justify-content: center; align-items: center; color:black;">
                	 시간당 정원이 초과되었습니다.잔여 좌석 수: <span class="minusNum" style="color:red; margin-left:10px;"></</span> 좌석
                 </p>
             </div>
           </div>
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
		                 	<a href="javascript:shareMessage()" style="text-decoration: none;">카카오톡 공유하기</a>
		                 </button>
		                 <input type="text" id="currentUrl"  style="width:400px; margin-left: 20px;"readonly>
		                 <button type="button" class="urlBtn" name="btnClick"  style="padding:2px; margin-left:10px;background-color: rgb(51,51,51); border-radius: 15px; color: white;" class="pointer">
		                 	<a style="text-decoration: none;width:120px;data-clipboard-target="#currentUrl">url 복사</a>
		                 </button>
                 </div>
             </div>
           </div>
      </div>
       
       
       
       
      <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      
      <!-- 카카오톡 공유하기 API -->
      <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js" integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script>
      <script>
         Kakao.init('b9d4c91a07666b464ce95d2ffa8d018c');
      </script>
      
      <!-- map api ------------------------------->
      <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx85918c7e8848478d8513312430044e0d"></script>
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <script src="/resources/js/store/map.js"></script>
      
      <!-- 클립보드 복사하기 API -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.0/clipboard.min.js"></script>
      
      
      
      
      <script>
               
       //----------카테고리
       // 1:한식 , 2: 양식, 3: 일식, 4: 중식, 5:분식, 6:육류, 7:씨푸드,8:디저트,9:기타
       var categoryNum=${s.category};
       var category;//실카테고리
               
       if(categoryNum=="1"){
       		category="한식";
       }else if(categoryNum=="2"){
       		category="양식";
       }else if(categoryNum=="3"){
       		category="일식";
       }else if(categoryNum=="4"){
       		category="중식";
       }else if(categoryNum=="5"){
       		category="분식";
       }else if(categoryNum=="6"){
       		category="육류";
       }else if(categoryNum=="7"){
       		category="씨푸드";
       }else if(categoryNum=="8"){
       		category="디저트";
       }else if(categoryNum=="9"){
       		category="기타";
       }
      
      $(".categorySpan").append("["+category+"]");
      
      
      
      //--------------찜하기 버튼
      $("#unfavorite").on("click",function(){
         console.log("하트 눌림");
         $("#unfavorite").hide();
         $("#favorite").show();
      });
      
      $("#favorite").on("click",function(){
         console.log("하트 눌림");
         $("#favorite").hide();
         $("#unfavorite").show();
      });
      
      var closedDay= "${s.closedDay}";
      //---------- datePicker
      $.datepicker.setDefaults({
      		dateFormat : 'yy-mm-dd',
            prevText : '이전 달',
            nextText : '다음 달',
            monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
            monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
            dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
            dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
            dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
            showMonthAfterYear : true,
            yearSuffix : '년',
            beforeShowDay: disabledDays
      });
         
      $(function() {
      		//데이트피커 생성 및 당일 선택 불가
            $("#datePicker").datepicker({minDate:1});
      });
         
      //---------- 휴일 데이터피커 비활성화
      var dayArr = new Array();
      var daysArr = new Array();
      
      function disabledDays(date){
            
	      var day = date.getDay();
	      dayArr = closedDay.split(",");
	
	      for(let i= 0; i<dayArr.length; i++){   
	           if(dayArr[i]=="월"){
	           		daysArr.push("1");
	           }
	           if(dayArr[i]=="화"){
	           		daysArr.push("2");
	           }
	           if(dayArr[i]=="수"){
	           		daysArr.push("3");
	           }
	           if(dayArr[i]=="목"){
	           		daysArr.push("4");
	           }
	           if(dayArr[i]=="금"){
	           		daysArr.push("5");
	          }
	          if(dayArr[i]=="토"){
	          		daysArr.push("6");
	          }
	          if(dayArr[i]=="일"){
	          		daysArr.push("0");
	          }
	      }//for문 종료
            
	      //데이트피커 휴일 비활성화 코드
	      let result = true;
	      for(let i=0;i<daysArr.length;i++){
	      	result = result && (day != Number(daysArr[i]));
	      }
	      return [result];
            
      }//함수 disabledDays종료
         
      
      //---------- 주소 * 없애기
      var addr;
      function addrSlice() {
             addr = $(".addressTd");
             splitWord = addr.text().split("*");
                addr.text(splitWord[1] + " " +splitWord[2]);
      }// addrSlice 함수 종료
      addrSlice();

     

            
      
       var storePhoto;
       var storeNo = "${s.storeNo}";
       $.ajax({
            url: "/ajaxSelectStore.do",
            type:"post",
            data: {storeNo:storeNo},
            success: function(data){
               const storeImgUl = $(".storeImgUl");
               storePhoto = new Array();
               for(let i=0; i<data.length; i++){
                  storeImgUl.append("<li><img src=/resources/upload/store/"+data[i].imgpath.replace(" ", "%20")+" style='height:460px; width:600px;'></li>");
                  storePhoto.push(data[i].imgpath);
               }
               //---------- 메뉴 사진 슬라이더
               let imgNo = 0;
               const ul = $(".photo-wrap>ul");
               const imgCount = ul.children().length;
               const width = 600;
               ul.css("width",(imgCount*width)+"px");
               
               $(".prev").on("click", function() {
                  if (imgNo != 0) {
                     imgNo--;
                     const move = -imgNo * width;
                     ul.css("transform", "translateX(" + move + "px)").css("transition-duration", "1s");
                  }
               });

               $(".next").on("click", function() {
                  if (imgNo != imgCount - 1) {
                     imgNo++;
                     const move = -imgNo * width;
                     ul.css("transform", "translateX(" + move + "px)").css("transition-duration", "1s");
                  }
               });
               

            }
       }); //ajax 종료
         
         
         var reserveNo = "${rs.reserveNo}";
         var reserveDate = "${rs.reserveDate}"
         var btnVal = new Array();
         var checkTimeBtn = new Array();
         
         var hour="${s.openHour}";
         var hourArr = new Array();
         hourArr = hour.split("~");
         var openTime = new Array();
         openTime = hourArr[0].split(":");
         var closeTime= new Array();
         closeTime = hourArr[1].split(":");
         var realOpenTime = openTime[0]; //실오픈시간
         var realCloseTime = closeTime[0]; //실폐점시간
         var selectTime;
         var selectDate = $("#datePicker").val();
         
         //---------- 날짜 input 클릭 시 시간 버튼 삭제
	      $("#datePicker").on("click",function(){
	         $(".timeBtn").remove();
	         disabledTime = new Array();
	      });
         
	      var disabledTime = new Array();
         //---------- 시간확인하기 버튼 (용도: 비활성화)checkTime
         $("#datePicker").on("change",function(){
             
             $.ajax({
                 url: "/checkReserve.do",
                 type:"post",
                 data: {storeNo:storeNo},
                 success: function(data){
                     //삭제하고 생성
                     $(".timeBtn").remove();
                   	 //시간 버튼 생성
                     for(let i=realOpenTime; i<realCloseTime; i++){
                         $(".buttonTd").append("<button class=timeBtn style=margin-right:1%;background-color:white;color:rgb(51,51,51); value="+i+">"+i+":00"+"</button>");
                      }
                     //버튼 클릭
                     const timeBtns = $(".timeBtn");
                     timeBtns.on("click",function(){
                        timeBtns.css("color","rgb(51,51,51)").css("background-color","white");
                        $(this).css("color","white").css("background-color","rgb(51,51,51)");
                        const index = timeBtns.index(this);
                        selectTime = $(this).text();
                        
                        //예약불가 시간의 버튼 비활성화
			             for(let i=0; i<btnVal.length; i++){
			                  for(let j=0; j<disabledTime.length; j++){
			                     if(btnVal[i]==disabledTime[j]){
			                        checkTimeBtn[i].style.color="red";
			                        checkTimeBtn[i].style.background="pink";
			                        checkTimeBtn[i].setAttribute("disabled", true);
			                     }
			                  }
			             }
                     });
                     
		             var selectDate = $("#datePicker").val();
		             checkTimeBtn = document.getElementsByClassName('timeBtn');
		       
		             
		             //btnVal 이란 배열에 버튼의 value값 넣기
		             for(let i=0; i<checkTimeBtn.length; i++){
		             	btnVal.push(document.getElementsByClassName('timeBtn')[i].value+":00");
		             }
		             
		              var maxNum = "${s.maxNum}";
		              var selectDate = $("#datePicker").val();
		              var storeNo = "${s.storeNo}";
		              
		              $.ajax({
		                  url: "/checkReserveTime.do",
		                  type:"post",
		                  data: {storeNo:storeNo,selectDate:selectDate, maxNum:maxNum},
		                  success: function(data){
		                	  for(let i=0; i<data.length; i++){
		                		  disabledTime.push(data[i].eatTime);
		                	  }
		                	  
					             for(let i=0; i<btnVal.length; i++){
					                  for(let j=0; j<disabledTime.length; j++){
					                     if(btnVal[i]==disabledTime[j]){
					                        checkTimeBtn[i].style.color="red";
					                        checkTimeBtn[i].style.background="pink";
					                        checkTimeBtn[i].setAttribute("disabled", true);
					                     }
					                  }
					             }
		                  }
		              }); //--------------내부 ajax종료
            	}//--------success문 종료
              }); //--------------ajax종료 
         });//데이트 피커 눌렀을 떄 함수 종료
         
            
         //---------- 공유하기 버튼
         function shareMessage() {
            Kakao.Share.sendDefault({
               objectType : 'location',
               address : $(".addressTd").text(),
               addressTitle : "${s.storeName}",
               content : {
                  title : "${s.storeName}",
                  description : "${s.storeName}"+" 로 지금 먹으러갈까요~~?",
                  imageUrl : 'http://192.168.10.26/resources/img/logo.png',
                  link : {
                     mobileWebUrl : 'http://192.168.10.26/storeDetail.do?storeNo='+storeNo,
                     webUrl : 'http://192.168.10.26/storeDetail.do?storeNo='+storeNo
                  },
               },
               buttons : [ {
                  title : '웹으로 보기',
                  link : {
                     mobileWebUrl : 'http://192.168.10.26/storeDetail.do?storeNo='+storeNo,
                     webUrl : 'http://192.168.10.26/storeDetail.do?storeNo='+storeNo
                  }
               } ]
            });
         }
         
         
         
         //---------- 인원수 늘리기
         let count = 1;
         var maxNum="${s.maxNum}";
         $("#up").on("click", function(e) {
      	   console.log(maxNum);
           	if(count== maxNum){
             		return false;
             	}
         		count++;
         		$(".people").text(count);
         });
               
         $("#down").on("click", function(e) {
         		if (count == 1) {
         			return false;
           	}
          	 count--;
           	$(".people").text(count);
         }); 
         
         
         //---------- 모달 
         const modal = document.querySelector(".modal-wrap");
         var ownerId = "${sessionScope.o.ownerId}";
         var memberId = "${sessionScope.m.memberId}"
         var selectedDate;
       
         
         //예약하기 모달 열기
         $(".reserveBtn2").on("click",function(){

                modal.classList.remove("hidden");
                if(ownerId != ""){
                   document.getElementById('ownerModal').style.display='block';
                }
                selectedDate =$("#datePicker").val();
                $(".eatDate").attr("value",selectedDate);
                $(".eatTime").attr("value",selectTime);
                $(".eatNum").attr("value",count);
                $(".dateTd").text(selectedDate);
                $(".peopleNumTd").text(count);
                $(".timeTd").text(selectTime);
                //날짜를 선택하지 않았을 때
                if($("#datePicker").val() == "" || selectTime== null){
                	document.getElementById('timeDateModal').style.display='block';
                	modal.classList.add("hidden");
               }
                //잔여 좌석 수 확인
                $.ajax({
                    url: "/checkCountNum.do",
                    type:"post",
                    data: {storeNo:storeNo,selectedDate:selectedDate, selectTime:selectTime},
                    success: function(data){
                    	//선택한 날짜 시간에 이미 예약된 좌석 수
                    	var reservedNum = data; 
                    	if(reservedNum+count>maxNum){
                        	document.getElementById('noReserveModal').style.display='block';
                        	modal.classList.add("hidden");
                        	//남은 좌석 수
                        	var minusNum = maxNum-reservedNum;
                        	$(".minusNum").text(minusNum);
                    	}
                    }
                }); 

                
         });
            

      function hideModal(){
    	  modal.classList.add("hidden");
      }
      
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