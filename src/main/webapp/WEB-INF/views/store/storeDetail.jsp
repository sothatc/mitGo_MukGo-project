<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>맛집상세 페이지</title>
   

</head>

<body>
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,200" />
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <link rel="stylesheet" href="/resources/css/store/storeDetail.css">
   <link rel="stylesheet" href="/resources/demos/store/style.css">
   
   
   
   <!---------------------내용----------------------->
   <div class="content-wrap">
      <div class="content-wrap1">
         <div class="content-wrap1-1">
            <span class="categorySpan" style="font-family:Gowun Dodum;"></span>
            <span class="storeNameSpan" style="font-family:Gowun Dodum;">${s.storeName}</span>
            <span class="material-symbols-rounded star">star</span>
            <span class="reviewNum" style="font-family:Gowun Dodum;"></span>
         </div>

         <div class="content-wrap1-2">
            <a class="material-symbols-rounded share pointer" id="share" href="javascript:shareMessage()">share</a>
            <span class="material-symbols-rounded favorite pointer" id="favorite" style="display:none;">favorite</span>
            <span class="material-symbols-outlined unfavorite pointer" id="unfavorite" style="float:right; margin-top:10px; margin-right:20px;">favorite</span>
         </div>

      </div>


      <div class="content-wrap2">
         <div class="content-wrap2-1">
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
               <table class="w3-table w3-bordered" id="infoTable" style="font-family:Gowun Dodum;">
                  <tr>
                     <th>주소</th>
                     <td colspan="3" class="addressTd">${s.address }</td>
                  </tr>
                  <tr>
                     <th>전화번호</th>
                     <td colspan="3" class="phoneTd">${s.phone }</td>
                  </tr>
                  <tr>
                     <th>운영시간</th>
                     <td colspan="3" class="openHourTd">${s.openHour }</td>
                  </tr>
                  <tr>
                     <th>휴일</th>
                     <td colspan="3" class="closedDayTd">${s.closedDay}</td>
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
                        <input type="text" id="datePicker" style="border:none;">
                     </td>
                  </tr>
                  <tr style="height: 47px;">
                     <th>인원</th>
                     <td>
                        <button class="w3-button w3-circle w3-teal" id="down" style="width: 35px; height: 35px; padding: 0;">-</button>
                     </td>
                     <td class="peopleTd">
                        <span class="people">1</span>
                     </td>
                     <td>
                        <button class="w3-button w3-circle w3-teal" id="up" style="width: 35px; height: 35px; padding: 0;">+</button>
                     </td>
                  </tr>
                  <tr>
                     <th class="timeTh">시간</th>
                     <td colspan="3" class="buttonTd"></td>
                  </tr>
               </table>
               <button name="reserveBtn" class="reserveBtn2" style="font-family:Gowun Dodum;">예약하기</button>
               <button name="recommendBtn" style="font-family:Gowun Dodum;">추천글작성</button>
            </div>
         </div>
      </div>
   </div>

   <!--조회수 및 후기 수-->
   <div class="content-wrap3" style="font-family:Gowun Dodum;">
      <div class="content-wrap3-1">
         <span class="material-symbols-outlined">visibility</span>
         <span>100</span>
         <span class="material-symbols-outlined">rate_review</span>
         <span>100</span>
      </div>
   </div>

   <!--상세 페이지-->
   <div class="content-wrap4" style="font-family:Gowun Dodum;">
      <div class="testDiv">
         <p class="menuTitle">MENU</p>
         <blockquote class="w3-panel w3-leftbar w3-light-grey" id="menuWrap">
            <div class="menuWrap" style="font-family:Gowun Dodum;">
               <p class="menuSubTitle">대표메뉴</p>
               <table class="w3-table w3-bordered" id="menuTable">
                  <tr>
                     <td>피자A</td>
                     <td>--------------------------------------</td>
                     <td>18,000</td>
                  </tr>
                  <tr>
                     <td>피자B</td>
                     <td>--------------------------------------</td>
                     <td>18,000</td>
                  </tr>
                  <tr>
                     <td>피자C</td>
                     <td>--------------------------------------</td>
                     <td>18,000</td>
                  </tr>
                  <tr>
                     <td>피자D</td>
                     <td>--------------------------------------</td>
                     <td>18,000</td>
                  </tr>
                  <tr>
                     <td>피자E</td>
                     <td>--------------------------------------</td>
                     <td>18,000</td>
                  </tr>
               </table>
            </div>
         </blockquote>

         <div class="food-wrap">
            <div class="w3-card" id="photoWrap">
               <img src="/resources/img/pizza.PNG" style="width: 100%">
               <div class="w3-container">
                  <h4><b>PIZZA-A</b></h4>
                  <p>18,000원</p>
               </div>
            </div>

            <div class="w3-card" id="photoWrap">
               <img src="/resources/img/pizza.PNG" style="width: 100%">
               <div class="w3-container">
                  <h4><b>PIZZA-B</b></h4>
                  <p>18,000원</p>
               </div>
            </div>

            <div class="w3-card" id="photoWrap">
               <img src="/resources/img/pizza.PNG" style="width: 100%">
               <div class="w3-container">
                  <h4><b>PIZZA-C</b></h4>
                  <p>18,000원</p>
               </div>
            </div>

            <div class="w3-card" id="photoWrap">
               <img src="/resources/img/pizza.PNG" style="width: 100%">
               <div class="w3-container">
                  <h4><b>PIZZA-D</b></h4>
                  <p>18,000원</p>
               </div>
            </div>
         </div>

         <!----- LOCATION 부분 ----->
         <p class="menuTitle">LOCATION</p>
         <div class="map-wrap">지도 넣을 자리</div>

         <!----- 마켓 상품 부분 ----->
         <p class="menuTitle">MARKET</p>
         <div class="market-wrap">
            <div class="w3-card-4" id="marketWrap">
               <img src="/resources/img/pizza.PNG" style="width: 100%">
               <div class="w3-container w3-center">
                  <p>상품 A</p>
               </div>
            </div>

            <div class="w3-card-4" id="marketWrap">
               <img src="/resources/img/pizza.PNG" style="width: 100%">
               <div class="w3-container w3-center">
                  <p>상품 A</p>
               </div>
            </div>

            <div class="w3-card-4" id="marketWrap">
               <img src="/resources/img/pizza.PNG" style="width: 100%">
               <div class="w3-container w3-center">
                  <p>상품 A</p>
               </div>
            </div>
         </div>

         <!----- 후기 부분 ----->

         <div class="review-wrap">
            <p class="menuTitle" style="display: block;">REVIEW</p>
            <ul class="w3-ul w3-card-4" id="reviewWrapUl">
               <li class="w3-bar" style="height: 270px;">
                  <div class="w3-bar-1" style="margin:0;">
                     <span class="reviewDelete" style="line-height: 250px;">×</span>
                     <img src="/resources/img/pizza.PNG" class="w3-hide-small" style="float: left; width:30%; height:100%;">
                     <div class="w3-bar-item" id="w3-bar-item" style="width:60%;">
                        <span class="w3-large">홍길동</span>
                        <span class="material-symbols-rounded">star</span>
                        <span class="material-symbols-rounded">star</span>
                        <span>3.0</span>
                        <br>
                        <span style="display: inline; float: left;"> 너무 맛있어서 눈물이 다 났어요... 또 올게요 사장님ㅠㅠㅠㅠㅠㅠㅠㅠㅠ ㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ 너무 맛있어서 눈물이 다 났어요... 또 올게요 사장님ㅠㅠㅠㅠㅠㅠㅠㅠㅠ ㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</span>
                        <br>
                        <div class="w3-bar-item-1">
                           <span class="regDate">2022-10-26</span>
                        </div>
                     </div>
                  </div>
               </li>

               <li class="w3-bar" style="height: 270px;">
                  <div class="w3-bar-1" style="margin:0;">
                     <span class="reviewDelete" style="line-height: 250px;">×</span>
                     <img src="/resources/img/pizza.PNG" class="w3-hide-small" style="float: left; width:30%; height:100%;">
                     <div class="w3-bar-item" id="w3-bar-item">
                        <span class="w3-large">홍길동</span>
                        <span class="material-symbols-rounded">star</span>
                        <span class="material-symbols-rounded">star</span>
                        <span>3.0</span>
                        <br>
                        <span style="display: inline; float: left;"> 너무 맛있어서 눈물이 다 났어요... 또 올게요 사장님ㅠㅠㅠㅠㅠㅠㅠㅠㅠ ㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ 너무 맛있어서 눈물이 다 났어요... 또 올게요 사장님ㅠㅠㅠㅠㅠㅠㅠㅠㅠ ㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</span>
                        <br>
                        <div class="w3-bar-item-1">
                           <span class="regDate">2022-10-26</span>
                        </div>
                     </div>
                  </div>
               </li>

               <li class="w3-bar" style="height: 270px;">
                  <div class="w3-bar-1" style="margin:0;">
                     <span class="reviewDelete" style="line-height: 250px;">×</span>
                     <img src="/resources/img/pizza.PNG" class="w3-hide-small"  style="float: left; width:30%; height:100%;">
                     <div class="w3-bar-item" id="w3-bar-item" style="width:70%;">
                        <span class="w3-large">홍길동</span>
                        <span class="material-symbols-rounded">star</span>
                        <span class="material-symbols-rounded">star</span>
                        <span>3.0</span>
                        <br>
                        <span style="display: inline; float: left;"> 너무 맛있어서 눈물이 다 났어요... 또 올게요 사장님ㅠㅠㅠㅠㅠㅠㅠㅠㅠ ㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ 너무 맛있어서 눈물이 다 났어요... 또 올게요 사장님ㅠㅠㅠㅠㅠㅠㅠㅠㅠ ㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</span>
                        <br>
                        <div class="w3-bar-item-1">
                           <span class="regDate">2022-10-26</span>
                        </div>
                     </div>
                  </div>
               </li>
            </ul>
         </div>
      </div>
      <!-- 모달 부분 -->
       <div class="modal-wrap hidden">
          <div class="modal-box">
              <div class="modal-title">예약 정보</div>
              <div class="modal-contents">
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
                  <div class="explanation">* 가게에서 최종 확정 시 예약이 확정됩니다.</div>
                  <button class="closeModal pointer">닫기</button>
                  <button class="reserveBtn pointer">예약하기</button>
              </div>
          </div>
       </div>
       </div>
       
       <!------------------------ 시간 날짜 미입력 모달 -->
       <div class="w3-container" style="font-family:Gowun Dodum;">
           <div id="timeDateModal" class="w3-modal">
             <div class="w3-modal-content w3-animate-top w3-card-4" style="width:30%; height: 40%;">
               <header class="w3-container w3-teal" style="height:10%;"> 
                 <span onclick="document.getElementById('timeDateModal').style.display='none'" 
                 class="w3-button w3-display-topright" style="width:5%; height:10%;">&times;</span>
               </header>
                 <p style="width:100%; height:100%;padding:0; margin:0;display:flex; justify-content: center; align-items: center; color:black;">예약하실 날짜와 시간을 선택해주세요.</p>
             </div>
           </div>
      </div>
       
       
       
       
       <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
       <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js" integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script>
      <script>
         Kakao.init('c089c8172def97eb00c07217cae17495');
      </script>
      <script>
      //------------------------------------------------------------------------------------------------------------------------------
      
      //--------------------카테고리
       var categoryNum=${s.category};
         var category;//실카테고리
               
       //카테고리 
         //1:한식 , 2: 양식, 3: 일식, 4: 중식, 5:분식, 6:육류, 7:기타
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



         //----------------------- datePicker
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
            //데이트피커 생성 및 오늘날짜 이전 선택 불가
            $("#datePicker").datepicker({minDate:0});
         });
         
         //--------------------------휴일 데이터피커 비활성화
         

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
            
         }
         
         
         //-------------------주소 * 없애기
         function addrSlice() {
             const addr = $(".addressTd");
             console.log(addr);
             const splitWord = addr.text().split("*");
                addr.text(splitWord[1] + " " +splitWord[2]);
             }
             addrSlice();

         //----------------------------- 인원수 늘리기
            let count = 1;
   
            $("#up").on("click", function(e) {
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
            
            
            var hour="${s.openHour}";
            console.log(hour);
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
             //시간 버튼 생성
             for(let i=realOpenTime; i<realCloseTime; i++){
                $(".buttonTd").append("<button class=timeBtn style=margin-right:1%;background-color:white;color:rgb(51,51,51);>"+i+":00"+"</button>");
             }
            
            //-----------------버튼 클릭
            const timeBtns = $(".timeBtn");
            timeBtns.on("click",function(){
               timeBtns.css("color","rgb(51,51,51)").css("background-color","white");
               $(this).css("color","white").css("background-color","rgb(51,51,51)");
               const index = timeBtns.index(this);
               selectTime = $(this).text();
            });
            
            
      
       //-------------------------------------------------------------------@@@@@@@@@@@@@@@@@@@@@       AJAX 
         var storePhoto;
       	 var storeNo = "${s.storeNo}";
         $.ajax({
            url: "/ajaxSelectStore.do",
            type:"post",
            data: {storeNo:storeNo},
            success: function(data){
               console.log(storeNo);
               const storeImgUl = $(".storeImgUl");
               storePhoto = new Array();
            for(let i=0; i<data.length; i++){
               storeImgUl.append("<li><img src=/resources/upload/store/"+data[i].imgpath+" style='height:460px; width:600px;'></li>");
               storePhoto.push(data[i].imgpath);
            }
            
              //--------------------------메뉴 사진 슬라이더
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
         }); //---------------------------------------------------------ajax 종료----------------------------------------------
         
         
            
         //----------------------------- 공유하기 버튼
         function shareMessage() {

            Kakao.Share.sendDefault({
               objectType : 'location',
               address : "${s.address}",
               addressTitle : "${s.storeName}",
               content : {
                  title : "${s.storeName}",
                  description : "${s.storeName}"+"먹으러갈까요~~?",
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
         
         //---------------------------------- 모달 
         const open = document.querySelector(".reserveBtn2");
         const close = document.querySelector(".closeModal");
         const modal = document.querySelector(".modal-wrap");

         function init(){
            //모달 여는 코드

            open.addEventListener("click",function(){
               modal.classList.remove("hidden");

               
               $(".dateTd").text($("#datePicker").val());
               $(".peopleNumTd").text(count);
               $(".timeTd").text(selectTime);
               //날짜를 선택하지 않았을 때
               if($("#datePicker").val() == "" || selectTime== null){
                  document.getElementById('timeDateModal').style.display='block';
                  modal.classList.add("hidden");
               }
             });
            
            // 모달 닫기 버튼 클릭 시
            close.addEventListener("click",function(){
               modal.classList.add("hidden");
            });
         }
         init();
         
      </script>

</body>
</html>