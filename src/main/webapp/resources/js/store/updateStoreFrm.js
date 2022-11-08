var selCate = $("[name=category]").children().first();
var selCateVal = selCate.val();
if(selCateVal == 1) {
	selCate.text("한식");			
}else if(selCateVal == 2) {
	selCate.text("양식");
}else if(selCateVal == 3) {
	selCate.text("일식");
}else if(selCateVal == 4) {
	selCate.text("중식");
}else if(selCateVal == 5) {
	selCate.text("분식");
}else if(selCateVal == 6) {
	selCate.text("육식");
}else if(selCateVal == 7) {
	selCate.text("씨푸드");
}else if(selCateVal == 8) {
	selCate.text("디저트");
}else if(selCateVal == 9) {
	selCate.text("기타");
}

var selWith = $("[name=withEatCate]").children().first();
var selWithVal = selWith.val();
if(selWithVal == 1) {
	selWith.text("친구와");			
}else if(selWithVal == 2) {
	selWith.text("가족과");
}else if(selWithVal == 3) {
	selWith.text("연인과");
}

var selWhere = $("[name=whereEatCate]").children().first();
var selWhereVal = selWhere.val();
if(selWhereVal == 1) {
	selWhere.text("분위기 좋은 곳");			
}else if(selWhereVal == 2) {
	selWhere.text("트렌디한 곳");
}else if(selWhereVal == 3) {
	selWhere.text("조용한 곳");
}


// 영업시간 짜르는 로직
function hourSlice() {
  	const hour = $("[name=openHour]").val();
  	const splitWord = hour.split("~");
	$("[name=openHour]").val(splitWord[0]);
	$("[name=closedHour]").val(splitWord[1]);
}
hourSlice();


//영업시간 합치고 업데이트로 보내기 위한 로직
//const hour1 = $("[name=hour]").val();
//const hour2 = $("[name=closedHour]").val();
//const openHour = hour1+"~"+hour2;
//$("[name=openHour]").val(openHour);

function closedDaySlice() {
	const closedDay = $(".getClosedDay").val();
	const splitWord = closedDay.split(",");
	const day1 = splitWord[0];
	const day2 = splitWord[1];
	
	for(var i=1;i<8;i++){
		var day = $("#btn-check"+i);
		var dayVal = day.val();
		if(day1 == dayVal){
			day.prop("checked",true);
		}
		if(day2 == dayVal){
			day.prop("checked",true);
		}
		
	}
}
closedDaySlice();

function deleteImg(obj, storeImgNo, imgpath){
	const imgNoInput = $("<input>");
	imgNoInput.attr("name","imgNoList");
	imgNoInput.val(storeImgNo);
	imgNoInput.hide();
	
	const imgpathInput = $("<input>");
	imgpathInput.attr("name","imgpathList");
	imgpathInput.val(imgpath);
	imgpathInput.hide();

	$("#updateStore").append(imgNoInput).append(imgpathInput);
	$(obj).parent().remove();
}



// 영업시간 타임피커 API
$(document).ready(function () {
  $('input.timepicker').timepicker({});
});

$('.time').timepicker({
  timeFormat: 'HH:mm',
  interval: 60,
  startTime: '24:00',
  dynamic: false,
  dropdown: true,
  scrollbar: true
});

// 파일첨부 시 input에 파일명 출력하는 로직
(function ($) {
  'use strict';
  $(function () {
    $('.file-upload-browse').on('click', function () {
      var file = $(this).parent().parent().parent().find('.file-upload-default');
      file.trigger('click');
    });
    $('.file-upload-default').on('change', function () {
      	//$(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
      	const list = this.files;
      	let fileList = "";
      	for (let i = 0; i < list.length; i++) {
        fileList += list[i].name + '     ';
      	}
	  	const p = $("<p>");
	  	const fileInput = $("<input>");
		const delBtn = $("<button>");
		fileInput.attr("type","text");
		fileInput.addClass("form-control");
		fileInput.addClass("file-upload-info");
		delBtn.attr("type","button");
		delBtn.attr("onclick","deleteImg(this,${si.storeImgNo},'${si.imgpath }');");
		delBtn.text("삭제");
		delBtn.attr("class","imgDelBtn");
		p.append(fileInput);
		p.append(delBtn);
		$(".input-group").append(p);
		
		fileInput.val(fileList);
    });
  });
})(jQuery);

// 주소 API .기준으로 주소 자르는 로직
function addrSlice() {
  const addr = $("#inputAddress1").val();
  const splitWord = addr.split("*");
  $("#inputAddress1").val(splitWord[0]);
  $("#inputAddress2").val(splitWord[1]);
  $("#detailAddress").val(splitWord[2]);
}
addrSlice();



function searchPost() {
  new daum.Postcode({
    oncomplete: function (data) {
      $("#inputAddress1").val(data.zonecode);
      $("#inputAddress2").val(data.roadAddress);
      $("#detailAddress").focus();
    }
  }).open();
}

// 업체번호 유효성검사 로직
$("#inputPhone").on("change", function (event) {
  const phoneValue = $(this).val();
  const phoneComment = $(this).next();
  const phoneReg = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;

  //공백확인
  if (phoneValue == "") {
    phoneComment.text("");
    phoneChkResult = false;
    event.preventDefault();
  } else {
    // 유효성 검사
    if (phoneReg.test(phoneValue)) {
      phoneComment.text("사용가능합니다.");
      phoneComment.css("color", "blue");
      phoneChkResult = true;
    } else {
      phoneComment.text("전화번호 형식을 맞춰주세요.");
      phoneComment.css("color", "red");
      phoneChkResult = false;
      event.preventDefault();
    }
  }
});

// 영업 시간 입력 유/무 체크
$(":submit").on("click", function (event) {
  const openHourValue = $(".time").val();
  if (openHourValue == "") {
    alert("영업 시간을 입력해주세요. ");
    event.preventDefault();
  }
});


