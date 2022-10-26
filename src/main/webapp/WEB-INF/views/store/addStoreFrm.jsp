<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 등록</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="/resources/css/addStoreFrm.css">
</head>
<body>
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h1 class="card-title">업체 등록</h1>
				<form method="post" action="addStore.do" enctype="multipart/form-data">
					<div class="form-group">
						<label for="inputName">업체명을 입력해주세요</label>
						<br>
						<input type="text" class="form-control" id="inputName" name="storeName" placeholder="대표 업체명을 입력해주세요.">
					</div>
					<div class="form-group">
						<label for="inputCategory">카테고리를 선택해주세요</label>
						<br>
						<select class="form-control" id="inputCategory" name="category">
							<option value="1">한식</option>
							<option value="2">양식</option>
							<option value="3">일식</option>
							<option value="4">중식</option>
							<option value="5">분식</option>
							<option value="6">육류</option>
							<option value="7">기타</option>
						</select>
					</div>
					<div class="form-group">
						<label for="inputPhone">전화번호를 입력해주세요</label>
						<br>
						<input type="email" class="form-control" id="inputPhone" name="phone" placeholder="예) 000-0000-0000">
					</div>
					<div class="form-group">
						<label for="inputAddress">주소를 입력해주세요</label>
						<br>
						<input type="text" class="form-control" id="inputAddress" name="address1" onclick="searchPost();">
						<br>
						<input type="text" class="form-control" id="detailAddress" name="address2">
					</div>
					<div class="form-group">
						<label>업체 사진을 추가해 주세요</label>
						<input type="file" name="storeImg" class="file-upload-default" multiple>
						<div class="input-group col-xs-12">
							<input type="text" class="form-control file-upload-info" disabled placeholder="대표사진을 넣어주세요">
							<span class="input-group-append">
								<button class="file-upload-browse btn btn-primary" type="button">사진추가</button>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="textarea">상세설명을 입력해주세요</label>
						<br>
						<textarea class="form-control" name="content" id="textarea" rows="4"></textarea>
					</div>
					<div class="form-group">
						<label for="inputTime">영업 시간을 알려주세요</label>
						<br>
						<input type="text" class="form-control time" name="openHour" id="time1">
						~
						<input type="text" class="form-control time" id="time2">
					</div>
					<div class="form-group">
						<label for="inputTime">휴무일을 알려주세요</label>
						<br>
						<input type="checkbox" class="btn-check" id="btn-check1" name="closedDay" value="월" autocomplete="off">
						<label for="btn-check1" class="btn btnday">월</label>
						<input type="checkbox" class="btn-check" id="btn-check2" name="closedDay" value="화" autocomplete="off">
						<label for="btn-check2" class="btn btnday">화</label>
						<input type="checkbox" class="btn-check" id="btn-check3" name="closedDay" value="수" autocomplete="off">
						<label for="btn-check3" class="btn btnday">수</label>
						<input type="checkbox" class="btn-check" id="btn-check4" name="closedDay" value="목" autocomplete="off">
						<label for="btn-check4" class="btn btnday">목</label>
						<input type="checkbox" class="btn-check" id="btn-check5" name="closedDay" value="금" autocomplete="off">
						<label for="btn-check5" class="btn btnday">금</label>
						<input type="checkbox" class="btn-check" id="btn-check6" name="closedDay" value="토" autocomplete="off">
						<label for="btn-check6" class="btn btnday">토</label>
						<input type="checkbox" class="btn-check" id="btn-check7" name="closedDay" value="일" autocomplete="off">
						<label for="btn-check7" class="btn btnday">일</label>
					</div>
					<div class="submitBtn">
						<button type="submit" class="btn-primary">저장</button>
						<button class="cancle">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- script 구역 -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script type="text/javascript" src="/resources/js/addStoreFrm.js"></script>
</body>
</html>