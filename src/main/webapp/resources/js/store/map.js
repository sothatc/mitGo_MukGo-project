
var map;
var markerInfo;
//출발지,도착지 마커
var marker_s, marker_e, marker_p, marker_p2;
var totalMarkerArr = [];
//경로그림정보
var drawInfoArr = [];
var drawInfoArr2 = [];

var chktraffic = [];
var resultdrawArr = [];
var resultMarkerArr = [];
var S_lon;
var S_lat;
var E_lon;
var E_lat;
var marker1;
function initTmap() {
	// 1. 지도 띄우기
	map = new Tmapv2.Map("map_div", {
		center: new Tmapv2.LatLng(37.49241689559544, 127.03171389453507),
		width: "100%",
		height: "500px",
		zoom: 11,
		zoomControl: true,
		scrollwheel: true
	});
	//좌표 api 사용
	//사용자 입력 주소지를 좌표로 변경
	$("#btn_select").click(function () {
		// 2. API 사용요청
		
		
		fullAddr = $("#fullAddr").val();
		
		$.ajax({
			method: "GET",
			url: "https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?version=1&format=json&callback=result",
			async: false,
			data: {
				"appKey": "l7xx85918c7e8848478d8513312430044e0d",
				"coordType": "WGS84GEO",
				"fullAddr": fullAddr
			},
			success: function (response) {
				var resultInfo = response.coordinateInfo; // .coordinate[0];
				console.log(resultInfo);

				//기존 마커 삭제
				resettingMap();
				// 3.마커 찍기
				// 검색 결과 정보가 없을 때 처리
				if (resultInfo.coordinate.length == 0) {
					$("#result").text(
						"요청 데이터가 올바르지 않습니다.");
				} else {

					var resultCoordinate = resultInfo.coordinate[0];
					if (resultCoordinate.lon.length > 0) {
						// 구주소
						S_lon = resultCoordinate.lon;
						S_lat = resultCoordinate.lat;
					} else {
						// 신주소
						S_lon = resultCoordinate.newLon;
						S_lat = resultCoordinate.newLat
					}

					var lonEntr, latEntr;

					if (resultCoordinate.lonEntr == undefined && resultCoordinate.newLonEntr == undefined) {
						lonEntr = 0;
						latEntr = 0;
					} else {
						if (resultCoordinate.lonEntr.length > 0) {
							lonEntr = resultCoordinate.lonEntr;
							latEntr = resultCoordinate.latEntr;
						} else {
							lonEntr = resultCoordinate.newLonEntr;
							latEntr = resultCoordinate.newLatEntr;
						}
					}

					var markerPosition = new Tmapv2.LatLng(Number(S_lat), Number(S_lon));
					
					// 마커 올리기
					marker_s = new Tmapv2.Marker(
						{
							position: markerPosition,
							icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
							iconSize: new Tmapv2.Size(24, 38),
							map: map
						});
					
					map.setCenter(markerPosition);
					// 검색 결과 표출
					var matchFlag, newMatchFlag;
					// 검색 결과 주소를 담을 변수
					var address = '', newAddress = '';
					var city, gu_gun, eup_myun, legalDong, adminDong, ri, bunji;
					var buildingName, buildingDong, newRoadName, newBuildingIndex, newBuildingName, newBuildingDong;

					// 새주소일 때 검색 결과 표출
					// 새주소인 경우 matchFlag가 아닌
					// newMatchFlag가 응답값으로
					// 온다
					if (resultCoordinate.newMatchFlag.length > 0) {
						// 새(도로명) 주소 좌표 매칭
						// 구분 코드
						newMatchFlag = resultCoordinate.newMatchFlag;

						// 시/도 명칭
						if (resultCoordinate.city_do.length > 0) {
							city = resultCoordinate.city_do;
							newAddress += city + "\n";
						}

						// 군/구 명칭
						if (resultCoordinate.gu_gun.length > 0) {
							gu_gun = resultCoordinate.gu_gun;
							newAddress += gu_gun + "\n";
						}

						// 읍면동 명칭
						if (resultCoordinate.eup_myun.length > 0) {
							eup_myun = resultCoordinate.eup_myun;
							newAddress += eup_myun + "\n";
						} else {
							// 출력 좌표에 해당하는
							// 법정동 명칭
							if (resultCoordinate.legalDong.length > 0) {
								legalDong = resultCoordinate.legalDong;
								newAddress += legalDong + "\n";
							}
							// 출력 좌표에 해당하는
							// 행정동 명칭
							if (resultCoordinate.adminDong.length > 0) {
								adminDong = resultCoordinate.adminDong;
								newAddress += adminDong + "\n";
							}
						}
						// 출력 좌표에 해당하는 리 명칭
						if (resultCoordinate.ri.length > 0) {
							ri = resultCoordinate.ri;
							newAddress += ri + "\n";
						}
						// 출력 좌표에 해당하는 지번 명칭
						if (resultCoordinate.bunji.length > 0) {
							bunji = resultCoordinate.bunji;
							newAddress += bunji + "\n";
						}
						// 새(도로명)주소 매칭을 한
						// 경우, 길 이름을 반환
						if (resultCoordinate.newRoadName.length > 0) {
							newRoadName = resultCoordinate.newRoadName;
							newAddress += newRoadName + "\n";
						}
						// 새(도로명)주소 매칭을 한
						// 경우, 건물 번호를 반환
						if (resultCoordinate.newBuildingIndex.length > 0) {
							newBuildingIndex = resultCoordinate.newBuildingIndex;
							newAddress += newBuildingIndex + "\n";
						}
						// 새(도로명)주소 매칭을 한
						// 경우, 건물 이름를 반환
						if (resultCoordinate.newBuildingName.length > 0) {
							newBuildingName = resultCoordinate.newBuildingName;
							newAddress += newBuildingName + "\n";
						}
						// 새주소 건물을 매칭한 경우
						// 새주소 건물 동을 반환
						if (resultCoordinate.newBuildingDong.length > 0) {
							newBuildingDong = resultCoordinate.newBuildingDong;
							newAddress += newBuildingDong + "\n";
						}
						// 검색 결과 표출
						if (lonEntr > 0) {
							var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
							var text = "검색결과(새주소) : " + newAddress + ",\n 응답코드:" + newMatchFlag + "(상세 코드 내역은 " + docs + " 에서 확인)" + "</br> 위경도좌표(중심점) : " + S_lat + ", " + S_lon + "</br>위경도좌표(입구점) : " + latEntr + ", " + lonEntr;
							//$("#result").html(text);
						} else {
							var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
							var text = "검색결과(새주소) : " + newAddress + ",\n 응답코드:" + newMatchFlag + "(상세 코드 내역은 " + docs + " 에서 확인)" + "</br> 위경도좌표(입구점) : 위경도좌표(입구점)이 없습니다.";
							//$("#result").html(text);
						}
					}

					// 구주소일 때 검색 결과 표출
					// 구주소인 경우 newMatchFlag가
					// 아닌 MatchFlag가 응닶값으로
					// 온다
					if (resultCoordinate.matchFlag.length > 0) {
						// 매칭 구분 코드
						matchFlag = resultCoordinate.matchFlag;

						// 시/도 명칭
						if (resultCoordinate.city_do.length > 0) {
							city = resultCoordinate.city_do;
							address += city + "\n";
						}
						// 군/구 명칭
						if (resultCoordinate.gu_gun.length > 0) {
							gu_gun = resultCoordinate.gu_gun;
							address += gu_gun + "\n";
						}
						// 읍면동 명칭
						if (resultCoordinate.eup_myun.length > 0) {
							eup_myun = resultCoordinate.eup_myun;
							address += eup_myun + "\n";
						}
						// 출력 좌표에 해당하는 법정동
						// 명칭
						if (resultCoordinate.legalDong.length > 0) {
							legalDong = resultCoordinate.legalDong;
							address += legalDong + "\n";
						}
						// 출력 좌표에 해당하는 행정동
						// 명칭
						if (resultCoordinate.adminDong.length > 0) {
							adminDong = resultCoordinate.adminDong;
							address += adminDong + "\n";
						}
						// 출력 좌표에 해당하는 리 명칭
						if (resultCoordinate.ri.length > 0) {
							ri = resultCoordinate.ri;
							address += ri + "\n";
						}
						// 출력 좌표에 해당하는 지번 명칭
						if (resultCoordinate.bunji.length > 0) {
							bunji = resultCoordinate.bunji;
							address += bunji + "\n";
						}
						// 출력 좌표에 해당하는 건물 이름
						// 명칭
						if (resultCoordinate.buildingName.length > 0) {
							buildingName = resultCoordinate.buildingName;
							address += buildingName + "\n";
						}
						// 출력 좌표에 해당하는 건물 동을
						// 명칭
						if (resultCoordinate.buildingDong.length > 0) {
							buildingDong = resultCoordinate.buildingDong;
							address += buildingDong + "\n";
						}
						// 검색 결과 표출
						if (lonEntr > 0) {
							var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>";
							var text = "검색결과(지번주소) : " + address + "," + "\n" + "응답코드:" + matchFlag + "(상세 코드 내역은 " + docs + " 에서 확인)" + "</br>" + "위경도좌표(중심점) : " + S_lat + ", " + S_lon + "</br>" + "위경도좌표(입구점) : " + latEntr + ", " + lonEntr;
							//$("#result").html(text);
						} else {
							var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>";
							var text = "검색결과(지번주소) : " + address + "," + "\n" + "응답코드:" + matchFlag + "(상세 코드 내역은 " + docs + " 에서 확인)" + "</br>" + "위경도좌표(입구점) : 위경도좌표(입구점)이 없습니다.";
							//$("#result").html(text);
						}
					}
				}
			},
			error: function (request, status, error) {
				console.log(request);
				console.log("code:" + request.status + "\n message:" + request.responseText + "\n error:" + error);
				// 에러가 발생하면 맵을 초기화함
				// markerStartLayer.clearMarkers();
				// 마커초기화
				map.setCenter(new Tmapv2.LatLng(37.570028, 126.986072));
				$("#result").html("");

			}
		});
	});

	//가게 주소 좌표 변경
	$("#hidden_btn_select").click(function () {
		// 2. API 사용요청
		
		fullAddr = $(".addressTd").text();
		$.ajax({
			method: "GET",
			url: "https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?version=1&format=json&callback=result",
			async: false,
			data: {
				"appKey": "l7xx85918c7e8848478d8513312430044e0d",
				"coordType": "WGS84GEO",
				"fullAddr": fullAddr
			},
			success: function (response) {
				var resultInfo = response.coordinateInfo; // .coordinate[0];
				console.log(resultInfo);
				// 3.마커 찍기
				// 검색 결과 정보가 없을 때 처리
				if (resultInfo.coordinate.length == 0) {
					$("#result").text(
						"요청 데이터가 올바르지 않습니다.");
				} else {

					var resultCoordinate = resultInfo.coordinate[0];
					if (resultCoordinate.lon.length > 0) {
						// 구주소
						E_lon = resultCoordinate.lon;
						E_lat = resultCoordinate.lat;
					} else {
						// 신주소
						E_lon = resultCoordinate.newLon;
						E_lat = resultCoordinate.newLat
					}

					var lonEntr, latEntr;

					if (resultCoordinate.lonEntr == undefined && resultCoordinate.newLonEntr == undefined) {
						lonEntr = 0;
						latEntr = 0;
					} else {
						if (resultCoordinate.lonEntr.length > 0) {
							lonEntr = resultCoordinate.lonEntr;
							latEntr = resultCoordinate.latEntr;
						} else {
							lonEntr = resultCoordinate.newLonEntr;
							latEntr = resultCoordinate.newLatEntr;
						}
					}

					var markerPosition = new Tmapv2.LatLng(Number(E_lat), Number(E_lon));
					// 마커 올리기
					marker_e = new Tmapv2.Marker(
						{
							position: markerPosition,
							icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
							iconSize: new Tmapv2.Size(24, 38),
							map: map
						});
					/*
					marker1 = new Tmapv2.Marker(
						{
							position: markerPosition,
							icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_a.png",
							iconSize: new Tmapv2.Size(
								24, 38),
							map: map
						});
					*/
					map.setCenter(markerPosition);

					// 검색 결과 표출
					var matchFlag, newMatchFlag;
					// 검색 결과 주소를 담을 변수
					var address = '', newAddress = '';
					var city, gu_gun, eup_myun, legalDong, adminDong, ri, bunji;
					var buildingName, buildingDong, newRoadName, newBuildingIndex, newBuildingName, newBuildingDong;

					// 새주소일 때 검색 결과 표출
					// 새주소인 경우 matchFlag가 아닌
					// newMatchFlag가 응답값으로
					// 온다
					if (resultCoordinate.newMatchFlag.length > 0) {
						// 새(도로명) 주소 좌표 매칭
						// 구분 코드
						newMatchFlag = resultCoordinate.newMatchFlag;

						// 시/도 명칭
						if (resultCoordinate.city_do.length > 0) {
							city = resultCoordinate.city_do;
							newAddress += city + "\n";
						}

						// 군/구 명칭
						if (resultCoordinate.gu_gun.length > 0) {
							gu_gun = resultCoordinate.gu_gun;
							newAddress += gu_gun + "\n";
						}

						// 읍면동 명칭
						if (resultCoordinate.eup_myun.length > 0) {
							eup_myun = resultCoordinate.eup_myun;
							newAddress += eup_myun + "\n";
						} else {
							// 출력 좌표에 해당하는
							// 법정동 명칭
							if (resultCoordinate.legalDong.length > 0) {
								legalDong = resultCoordinate.legalDong;
								newAddress += legalDong + "\n";
							}
							// 출력 좌표에 해당하는
							// 행정동 명칭
							if (resultCoordinate.adminDong.length > 0) {
								adminDong = resultCoordinate.adminDong;
								newAddress += adminDong + "\n";
							}
						}
						// 출력 좌표에 해당하는 리 명칭
						if (resultCoordinate.ri.length > 0) {
							ri = resultCoordinate.ri;
							newAddress += ri + "\n";
						}
						// 출력 좌표에 해당하는 지번 명칭
						if (resultCoordinate.bunji.length > 0) {
							bunji = resultCoordinate.bunji;
							newAddress += bunji + "\n";
						}
						// 새(도로명)주소 매칭을 한
						// 경우, 길 이름을 반환
						if (resultCoordinate.newRoadName.length > 0) {
							newRoadName = resultCoordinate.newRoadName;
							newAddress += newRoadName + "\n";
						}
						// 새(도로명)주소 매칭을 한
						// 경우, 건물 번호를 반환
						if (resultCoordinate.newBuildingIndex.length > 0) {
							newBuildingIndex = resultCoordinate.newBuildingIndex;
							newAddress += newBuildingIndex + "\n";
						}
						// 새(도로명)주소 매칭을 한
						// 경우, 건물 이름를 반환
						if (resultCoordinate.newBuildingName.length > 0) {
							newBuildingName = resultCoordinate.newBuildingName;
							newAddress += newBuildingName + "\n";
						}
						// 새주소 건물을 매칭한 경우
						// 새주소 건물 동을 반환
						if (resultCoordinate.newBuildingDong.length > 0) {
							newBuildingDong = resultCoordinate.newBuildingDong;
							newAddress += newBuildingDong + "\n";
						}
						// 검색 결과 표출
						if (lonEntr > 0) {
							var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
							var text = "검색결과(새주소) : " + newAddress + ",\n 응답코드:" + newMatchFlag + "(상세 코드 내역은 " + docs + " 에서 확인)" + "</br> 위경도좌표(중심점) : " + E_lat + ", " + E_lon + "</br>위경도좌표(입구점) : " + latEntr + ", " + lonEntr;
							//$("#result").html(text);
						} else {
							var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
							var text = "검색결과(새주소) : " + newAddress + ",\n 응답코드:" + newMatchFlag + "(상세 코드 내역은 " + docs + " 에서 확인)" + "</br> 위경도좌표(입구점) : 위경도좌표(입구점)이 없습니다.";
							//$("#result").html(text);
						}
					}

					// 구주소일 때 검색 결과 표출
					// 구주소인 경우 newMatchFlag가
					// 아닌 MatchFlag가 응닶값으로
					// 온다
					if (resultCoordinate.matchFlag.length > 0) {
						// 매칭 구분 코드
						matchFlag = resultCoordinate.matchFlag;

						// 시/도 명칭
						if (resultCoordinate.city_do.length > 0) {
							city = resultCoordinate.city_do;
							address += city + "\n";
						}
						// 군/구 명칭
						if (resultCoordinate.gu_gun.length > 0) {
							gu_gun = resultCoordinate.gu_gun;
							address += gu_gun + "\n";
						}
						// 읍면동 명칭
						if (resultCoordinate.eup_myun.length > 0) {
							eup_myun = resultCoordinate.eup_myun;
							address += eup_myun + "\n";
						}
						// 출력 좌표에 해당하는 법정동
						// 명칭
						if (resultCoordinate.legalDong.length > 0) {
							legalDong = resultCoordinate.legalDong;
							address += legalDong + "\n";
						}
						// 출력 좌표에 해당하는 행정동
						// 명칭
						if (resultCoordinate.adminDong.length > 0) {
							adminDong = resultCoordinate.adminDong;
							address += adminDong + "\n";
						}
						// 출력 좌표에 해당하는 리 명칭
						if (resultCoordinate.ri.length > 0) {
							ri = resultCoordinate.ri;
							address += ri + "\n";
						}
						// 출력 좌표에 해당하는 지번 명칭
						if (resultCoordinate.bunji.length > 0) {
							bunji = resultCoordinate.bunji;
							address += bunji + "\n";
						}
						// 출력 좌표에 해당하는 건물 이름
						// 명칭
						if (resultCoordinate.buildingName.length > 0) {
							buildingName = resultCoordinate.buildingName;
							address += buildingName + "\n";
						}
						// 출력 좌표에 해당하는 건물 동을
						// 명칭
						if (resultCoordinate.buildingDong.length > 0) {
							buildingDong = resultCoordinate.buildingDong;
							address += buildingDong + "\n";
						}
						// 검색 결과 표출
						if (lonEntr > 0) {
							var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>";
							var text = "검색결과(지번주소) : " + address + "," + "\n" + "응답코드:" + matchFlag + "(상세 코드 내역은 " + docs + " 에서 확인)" + "</br>" + "위경도좌표(중심점) : " + E_lat + ", " + E_lon + "</br>" + "위경도좌표(입구점) : " + latEntr + ", " + lonEntr;
							//$("#result").html(text);
						} else {
							var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>";
							var text = "검색결과(지번주소) : " + address + "," + "\n" + "응답코드:" + matchFlag + "(상세 코드 내역은 " + docs + " 에서 확인)" + "</br>" + "위경도좌표(입구점) : 위경도좌표(입구점)이 없습니다.";
							//$("#result").html(text);
						}
					}
				}
			},
			error: function (request, status, error) {
				console.log(request);
				console.log("code:" + request.status + "\n message:" + request.responseText + "\n error:" + error);
				// 에러가 발생하면 맵을 초기화함
				// markerStartLayer.clearMarkers();
				// 마커초기화
				map.setCenter(new Tmapv2.LatLng(37.570028, 126.986072));
				$("#result").html("");

			}
		});
	});
	$("#hidden_btn_select").click();
	// 2. 시작, 도착 심볼찍기
	// 시작
	marker_s = new Tmapv2.Marker(
		{
			position: new Tmapv2.LatLng(),
			icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
			iconSize: new Tmapv2.Size(24, 38),
			map: map
		});

	//도착
	marker_e = new Tmapv2.Marker(
		{
			position: new Tmapv2.LatLng(),
			icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
			iconSize: new Tmapv2.Size(24, 38),
			map: map
		});
	
	// 3. 경로탐색 API 사용요청
	$("#btn_select1").click(function () {
		//기존 맵에 있던 정보들 초기화					
		resettingMap();
		var searchOption = $("#selectLevel").val();
		var trafficInfochk = $("#year").val();
		//JSON TYPE EDIT [S]
		$.ajax({
			type: "POST",
			url: "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
			async: false,
			data: {
				"appKey": "l7xx85918c7e8848478d8513312430044e0d",
				"startX": S_lon,
				"startY": S_lat,
				"endX": E_lon,
				"endY": E_lat,
				"reqCoordType": "WGS84GEO",
				"resCoordType": "EPSG3857",
				"searchOption": searchOption,
				"trafficInfo": trafficInfochk
			},
			success: function (response) {

				var resultData = response.features;

				var tDistance = "총 거리 : "
					+ (resultData[0].properties.totalDistance / 1000)
						.toFixed(1) + "km,";
				var tTime = " 총 시간 : "
					+ (resultData[0].properties.totalTime / 60)
						.toFixed(0) + "분,";
				var tFare = " 총 요금 : "
					+ resultData[0].properties.totalFare
					+ "원,";
				var taxiFare = " 예상 택시 요금 : "
					+ resultData[0].properties.taxiFare
					+ "원";

				$("#result").text(
					tDistance + tTime + tFare
					+ taxiFare);


				//교통정보 표출 옵션값을 체크
				if (trafficInfochk == "Y") {
					for (var i in resultData) { //for문 [S]
						var geometry = resultData[i].geometry;
						var properties = resultData[i].properties;

						if (geometry.type == "LineString") {
							//교통 정보도 담음
							chktraffic
								.push(geometry.traffic);
							var sectionInfos = [];
							var trafficArr = geometry.traffic;

							for (var j in geometry.coordinates) {
								// 경로들의 결과값들을 포인트 객체로 변환 
								var latlng = new Tmapv2.Point(
									geometry.coordinates[j][0],
									geometry.coordinates[j][1]);
								// 포인트 객체를 받아 좌표값으로 변환
								var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
									latlng);

								sectionInfos
									.push(convertPoint);
							}

							drawLine(sectionInfos,
								trafficArr);
						} else {

							var markerImg = "";
							var pType = "";
							if (properties.pointType == "S") { //출발지 마커
								markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
								pType = "S";
							} else if (properties.pointType == "E") { //도착지 마커
								markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
								pType = "E";
							} else { //각 포인트 마커
								markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
								pType = "P"
							}

							// 경로들의 결과값들을 포인트 객체로 변환 
							var latlon = new Tmapv2.Point(
								geometry.coordinates[0],
								geometry.coordinates[1]);
							// 포인트 객체를 받아 좌표값으로 다시 변환
							var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
								latlon);

							var routeInfoObj = {
								markerImage: markerImg,
								lng: convertPoint._lng,
								lat: convertPoint._lat,
								pointType: pType
							};
							// 마커 추가
							addMarkers(routeInfoObj);
						}
					}//for문 [E]

				} else {
					for (var i in resultData) { //for문 [S]
						var geometry = resultData[i].geometry;
						var properties = resultData[i].properties;

						if (geometry.type == "LineString") {
							for (var j in geometry.coordinates) {
								// 경로들의 결과값들을 포인트 객체로 변환 
								var latlng = new Tmapv2.Point(
									geometry.coordinates[j][0],
									geometry.coordinates[j][1]);
								// 포인트 객체를 받아 좌표값으로 변환
								var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
									latlng);
								// 포인트객체의 정보로 좌표값 변환 객체로 저장
								var convertChange = new Tmapv2.LatLng(
									convertPoint._lat,
									convertPoint._lng);
								// 배열에 담기
								drawInfoArr
									.push(convertChange);
							}
							drawLine(drawInfoArr,
								"0");
						} else {
							var markerImg = "";
							var pType = "";
							console.log("markerCarTest3");
							if (properties.pointType == "S") { //출발지 마커
								console.log("markerCarTest4");
								markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
								pType = "S";
							} else if (properties.pointType == "E") { //도착지 마커
								console.log("markerCarTest5");
								markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
								pType = "E";
							} else { //각 포인트 마커
								console.log("markerCarTest6");
								markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
								pType = "P"
							}

							// 경로들의 결과값들을 포인트 객체로 변환 
							var latlon = new Tmapv2.Point(
								geometry.coordinates[0],
								geometry.coordinates[1]);
							// 포인트 객체를 받아 좌표값으로 다시 변환
							var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
								latlon);

							var routeInfoObj = {
								markerImage: markerImg,
								lng: convertPoint._lng,
								lat: convertPoint._lat,
								pointType: pType
							};

							// Marker 추가
							addMarkers(routeInfoObj);
						}
					}//for문 [E]
				}
			},
			error: function (request, status, error) {
				console.log("code:"
					+ request.status + "\n"
					+ "message:"
					+ request.responseText
					+ "\n" + "error:" + error);
			}
		});
		//JSON TYPE EDIT [E]
	});
	/* 도보 */
	$("#btn_select2").click(function () {
		//차에서 생긴 데이터를 지우기 위한것
		resettingMap();
		marker_s = new Tmapv2.Marker(
			{
				position: new Tmapv2.LatLng(37.666567545861645,
					126.9850380932383),
				icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
				iconSize: new Tmapv2.Size(24, 38),
				map: map
			});

		marker_e = new Tmapv2.Marker(
			{
				position: new Tmapv2.LatLng(37.403049076341794,
					127.10331814639885),
				icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
				iconSize: new Tmapv2.Size(24, 38),
				map: map
			});

		$.ajax({
			method: "POST",
			url: "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1&format=json&callback=result",
			async: false,
			data: {
				"appKey": "l7xx85918c7e8848478d8513312430044e0d",
				"startX": lon,
				"startY": lat,
				"endX": "127.10331814639885",
				"endY": "37.403049076341794",
				"reqCoordType": "WGS84GEO",
				"resCoordType": "EPSG3857",
				"startName": "출발지",
				"endName": "도착지"
			},
			success: function (response) {
				var resultData = response.features;

				//결과 출력
				var tDistance = "총 거리 : "
					+ ((resultData[0].properties.totalDistance) / 1000)
						.toFixed(1) + "km,";
				var tTime = " 총 시간 : "
					+ ((resultData[0].properties.totalTime) / 60)
						.toFixed(0) + "분";

				$("#result").text(tDistance + tTime);

				//기존 그려진 라인 & 마커가 있다면 초기화
				if (resultdrawArr.length > 0) {
					for (var i in resultdrawArr) {
						resultdrawArr[i]
							.setMap(null);
					}
					resultdrawArr = [];
				}

				drawInfoArr = [];

				for (var i in resultData) { //for문 [S]
					var geometry = resultData[i].geometry;
					var properties = resultData[i].properties;
					var polyline_;
					console.log("markerfootTest1");

					if (geometry.type == "LineString") {
						console.log("markerfootTest2");
						for (var j in geometry.coordinates) {
							// 경로들의 결과값(구간)들을 포인트 객체로 변환 
							var latlng = new Tmapv2.Point(
								geometry.coordinates[j][0],
								geometry.coordinates[j][1]);
							// 포인트 객체를 받아 좌표값으로 변환
							var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
								latlng);
							// 포인트객체의 정보로 좌표값 변환 객체로 저장
							var convertChange = new Tmapv2.LatLng(
								convertPoint._lat,
								convertPoint._lng);
							// 배열에 담기
							drawInfoArr.push(convertChange);
						}
					} else {
						var markerImg = "";
						var pType = "";
						var size;
						console.log("markerfootTest3");
						/*
						var markerList = [];
						var pointArray = [];
						
						// 시작
						addMarker("llStart",127.02810900563199,37.519892712436906,1);
						// 도착 
						addMarker("llEnd",127.11971717230388,37.49288934463672,2);
						function addMarker(status, lon, lat, tag) {
								//출도착경유구분
								//이미지 파일 변경.
								var markerLayer;
								switch (status) {
									case "llStart":
										imgURL = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png';
										break;
									case "llPass":
										imgURL = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_p.png';
										break;
									case "llEnd":
										imgURL = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
										break;
									default:
								};
							var marker = new Tmapv2.Marker({
								position: new Tmapv2.LatLng(lat,lon),
								icon: imgURL,
								map: map
							});
						}
						*/

						//if문의 출발지마커,도착마커가 일을 하지않음으로 다른 코드추가
						if (properties.pointType == "S") { //출발지 마커
							console.log("markerfootTest4");
							markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
							pType = "S";
							size = new Tmapv2.Size(24, 38);
						} else if (properties.pointType == "E") { //도착지 마커
							console.log("markerfootTest5");
							markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
							pType = "E";
							size = new Tmapv2.Size(24, 38);
						} else { //각 포인트 마커
							console.log("markerfootTest6");
							markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
							pType = "P";
							size = new Tmapv2.Size(8, 8);
						}

						// 경로들의 결과값들을 포인트 객체로 변환 
						var latlon = new Tmapv2.Point(
							geometry.coordinates[0],
							geometry.coordinates[1]);

						// 포인트 객체를 받아 좌표값으로 다시 변환
						var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
							latlon);

						var routeInfoObj = {
							markerImage: markerImg,
							lng: convertPoint._lng,
							lat: convertPoint._lat,
							pointType: pType
						};
						// Marker 추가
						addMarkers(routeInfoObj);
					}
				}//for문 [E]
				drawLine(drawInfoArr);
				
			},
			error: function (request, status, error) {
				console.log("code:" + request.status + "\n"
					+ "message:" + request.responseText + "\n"
					+ "error:" + error);
			}
		});
	});

}


function addComma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}

//마커 생성하기
function addMarkers(infoObj) {
	console.log("markerAddMarkerTest1");
	var size = new Tmapv2.Size(24, 38);//아이콘 크기 설정합니다.

	if (infoObj.pointType == "P") { //포인트점일때는 아이콘 크기를 줄입니다.
		size = new Tmapv2.Size(8, 8);
		console.log("markerAddMarkerTest2");
	}

	marker_p = new Tmapv2.Marker({
		position: new Tmapv2.LatLng(infoObj.lat, infoObj.lng),
		icon: infoObj.markerImage,
		iconSize: size,
		map: map
	});
	console.log("markerAddMarkerTest3");
	resultMarkerArr.push(marker_p);
}

//라인그리기
function drawLine(arrPoint, traffic) {
	var polyline_;

	if (chktraffic.length != 0) {

		// 교통정보 혼잡도를 체크
		// strokeColor는 교통 정보상황에 다라서 변화
		// traffic :  0-정보없음, 1-원활, 2-서행, 3-지체, 4-정체  (black, green, yellow, orange, red)

		var lineColor = "";

		if (traffic != "0") {
			if (traffic.length == 0) { //length가 0인것은 교통정보가 없으므로 검은색으로 표시

				lineColor = "#06050D";
				//라인그리기[S]
				polyline_ = new Tmapv2.Polyline({
					path: arrPoint,
					strokeColor: lineColor,
					strokeWeight: 6,
					map: map
				});
				resultdrawArr.push(polyline_);
				//라인그리기[E]
			} else { //교통정보가 있음

				if (traffic[0][0] != 0) { //교통정보 시작인덱스가 0이 아닌경우
					var trafficObject = "";
					var tInfo = [];

					for (var z = 0; z < traffic.length; z++) {
						trafficObject = {
							"startIndex": traffic[z][0],
							"endIndex": traffic[z][1],
							"trafficIndex": traffic[z][2],
						};
						tInfo.push(trafficObject)
					}

					var noInfomationPoint = [];

					for (var p = 0; p < tInfo[0].startIndex; p++) {
						noInfomationPoint.push(arrPoint[p]);
					}

					//라인그리기[S]
					polyline_ = new Tmapv2.Polyline({
						path: noInfomationPoint,
						strokeColor: "#06050D",
						strokeWeight: 6,
						map: map
					});
					//라인그리기[E]
					resultdrawArr.push(polyline_);

					for (var x = 0; x < tInfo.length; x++) {
						var sectionPoint = []; //구간선언

						for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
							sectionPoint.push(arrPoint[y]);
						}

						if (tInfo[x].trafficIndex == 0) {
							lineColor = "#06050D";
						} else if (tInfo[x].trafficIndex == 1) {
							lineColor = "#61AB25";
						} else if (tInfo[x].trafficIndex == 2) {
							lineColor = "#FFFF00";
						} else if (tInfo[x].trafficIndex == 3) {
							lineColor = "#E87506";
						} else if (tInfo[x].trafficIndex == 4) {
							lineColor = "#D61125";
						}

						//라인그리기[S]
						polyline_ = new Tmapv2.Polyline({
							path: sectionPoint,
							strokeColor: lineColor,
							strokeWeight: 6,
							map: map
						});
						//라인그리기[E]
						resultdrawArr.push(polyline_);
					}
				} else { //0부터 시작하는 경우

					var trafficObject = "";
					var tInfo = [];

					for (var z = 0; z < traffic.length; z++) {
						trafficObject = {
							"startIndex": traffic[z][0],
							"endIndex": traffic[z][1],
							"trafficIndex": traffic[z][2],
						};
						tInfo.push(trafficObject)
					}

					for (var x = 0; x < tInfo.length; x++) {
						var sectionPoint = []; //구간선언

						for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
							sectionPoint.push(arrPoint[y]);
						}

						if (tInfo[x].trafficIndex == 0) {
							lineColor = "#06050D";
						} else if (tInfo[x].trafficIndex == 1) {
							lineColor = "#61AB25";
						} else if (tInfo[x].trafficIndex == 2) {
							lineColor = "#FFFF00";
						} else if (tInfo[x].trafficIndex == 3) {
							lineColor = "#E87506";
						} else if (tInfo[x].trafficIndex == 4) {
							lineColor = "#D61125";
						}

						//라인그리기[S]
						polyline_ = new Tmapv2.Polyline({
							path: sectionPoint,
							strokeColor: lineColor,
							strokeWeight: 6,
							map: map
						});
						//라인그리기[E]
						resultdrawArr.push(polyline_);
					}
				}
			}
		} else {

		}
	} else {
		polyline_ = new Tmapv2.Polyline({
			path: arrPoint,
			strokeColor: "#1D1CE5",
			strokeWeight: 6,
			map: map
		});
		resultdrawArr.push(polyline_);
	}

}

//초기화 기능
function resettingMap() {
	//기존마커는 삭제
	marker_s.setMap(null);
	marker_e.setMap(null);
	if (resultMarkerArr.length > 0) {
		for (var i = 0; i < resultMarkerArr.length; i++) {
			resultMarkerArr[i].setMap(null);
		}
	}

	if (resultdrawArr.length > 0) {
		for (var i = 0; i < resultdrawArr.length; i++) {
			resultdrawArr[i].setMap(null);
		}
	}

	chktraffic = [];
	drawInfoArr = [];
	resultMarkerArr = [];
	resultdrawArr = [];
}


//위는 지도 api관련 js
//다음 api
function searchAddr() {
	const btnSelect = $("#btn_select");
	const hiddenBtnSelect = $("#hidden_btn_select");
	new daum.Postcode({
		oncomplete: function (data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
			console.log(data);
			$("#postcode").val(data.zonecode);
			$("#address").val(data.roadAddress);
			$("#fullAddr").val(data.roadAddress);
			$("#detailAddress").focus();
			btnSelect.click();
			hiddenBtnSelect.click();
		}
	}).open();
}
//밑은 그냥 클릭이벤트 js
const selectCar = $(".selectCar");
const selectFoot = $(".selectFoot");

selectCar.on("click", function () {
	selectCar.css("background-color","black");
	selectCar.css("color","white");

	selectFoot.css("background-color","white");
	selectFoot.css("color","black");

	$(".car-content").css("display", "block");
	$(".foot-content").css("display", "none");

});


selectFoot.on("click", function () {
	selectCar.css("background-color","white");
	selectCar.css("color","rgb(51,51,51)");

	selectFoot.css("background-color","rgb(51,51,51)");
	selectFoot.css("color","white");

	$(".foot-content").css("display", "block");
	$(".car-content").css("display", "none");

});

selectCar.click();