<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" href="/resources/css/member/owner.css">
	<link rel="stylesheet" href="/resources/css/member/member.css">
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<div class="content-wrap">
		<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp" />
		<article id="content" class="content">
			<div class="page-content">
				<div class="reserve-wrap">
					<div id="menuList">
						<div class="content-head">
							<h2>예약 관리</h2>
						</div>
						<form action="/searchReserve.do" method="post">
							<div class="searchWrap-reserve">
								<div class="search-area">
									<span class="searchName">이름</span>
									<input type="text" name="keyword">
									<input type="hidden" name="storeNo" value="${storeNo }">
									<input type="hidden" name="reqPage1" value="1">
									<input type="submit" class="searchBtn" value="조회">
									</button>
								</div>
							</div>
						</form>
						<table class="table" style="text-align: center; vertical-align: middle;">
							<tr>
								<th class="th" scope="col">예약 번호</th>
								<th class="th" scope="col">예약자 이름</th>
								<th class="th" scope="col">가게 이름</th>
								<th class="th" scope="col">예약 접수날짜</th>
								<th class="th" scope="col">예약일</th>
								<th class="th" scope="col">예약 시간</th>
								<th class="th" scope="col">인원수</th>
								<th class="th" scope="col">방문상태</th>
								<th class="th" scope="col"></th>
							</tr>
							
							<c:forEach items="${list }" var="rs">
								<tr>
									<td scope="row">${rs.reserveNo }</td>
									<td scope="row">${rs.reserverName }</td>
									<td scope="row">${rs.storeName }</td>
									<td scope="row">${rs.reserveDate }</td>
									<td scope="row">${rs.eatDate }</td>
									<td scope="row">${rs.eatTime }</td>
									<td scope="row">${rs.eatNum }</td>
									<form action="/updateReserve.do" method="post">
										<input type="hidden" name="reserveNo" value="${rs.reserveNo }">
										<td>
										<c:choose>
											<c:when test="${rs.visitStatus eq 1 }">
												<select name="visitStatus">
													<option value="1" selected>미방문</option>
													<option value="2">방문완료</option>
												</select>
											</c:when>
											<c:when test="${rs.visitStatus eq 2 }">
												<select name="visitStatus">
													<option value="1">미방문</option>
													<option value="2" selected>방문완료</option>
												</select>
											</c:when>
										</c:choose>
										</td>
										<td scope="row">
											<button class="updateRsBtn" type="submit">변경</button>
										</td>
									</form>
								</tr>
							</c:forEach>
						</table>

					</div>
				</div>
				<div class="page">${pageNavi }</div>
			</div>
		</article>
	</div>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(".searchBtn").on("mouseover", function() {
			$(this).css("background-color", "rgb(97, 76, 76)");
			$(this).css("border", "1px solid black");
			$(".searchBtn").css("color", "#ffc107");
		});
		$(".searchBtn").on("mouseleave", function() {
			$(this).css("background-color", "");
			$(".searchBtn").css("color", "");
		});
		
	</script>
</body>
</html>