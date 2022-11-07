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

