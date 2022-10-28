<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

		<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
		<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx85918c7e8848478d8513312430044e0d">

		</script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	</head>
	<!-- body onload가 지도 생성
	생성한 것을 id="map_div"에 띄우는거 -->

	<body onload="initTmap()">
		<link rel="stylesheet" href="/resources/css/map.css">
		<div class="ft_area">
			<div class="map-content-wrap">

				<div id="map_wrap" class="map_wrap">
					<div id="map_div"></div>
				</div>
				<div class="map_act_btn_wrap clear_box"></div>
				<div>
					<div class="selectCar">자동차</div>
					<div class="selectFoot">도보</div>
				</div>
				<p id="result">예상 정보</p>

				<div class="ft_select_wrap">
					<div class="ft_select">
						<!-- 
					<select id="selectLevel">
						<option value="0" selected="selected">교통최적+추천</option>
						<option value="1">교통최적+무료우선</option>
						<option value="2">교통최적+최소시간</option>
						<option value="3">교통최적+초보</option>
						<option value="4">교통최적+고속도로우선</option>
						<option value="10">최단거리+유/무료</option>
						<option value="12">이륜차도로우선</option>
						<option value="19">교통최적+어린이보호구역 회피</option>
					</select> 
				 -->
						<div class="address-wrap">

							<!--<p id="result"></p> -->
							<input type="text" class="text_custom" id="fullAddr" name="fullAddr" value="" readonly>
							<button onclick="searchAddr();">출발지 입력</button>
							<button id="btn_select" style="display : none;">적용하기</button>
						</div>

						<div class="car-content">
							<select id="year">
								<option value="N" selected="selected">교통정보 표출 옵션</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
							<button id="btn_select1">적용하기</button>
						</div>
						<div class="foot-content">
							<button id="btn_select2">적용하기</button>
						</div>
					</div>
				</div>
				<div class="map_act_btn_wrap clear_box"></div>
				<div class="clear"></div>
			</div>
		</div>
		<script src="/resources/js/map.js"></script>
	</body>

	</html>