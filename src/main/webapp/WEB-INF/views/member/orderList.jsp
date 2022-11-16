<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" href="/resources/css/member/owner.css">
	<link rel="stylesheet" href="/resources/css/member/member.css">
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<div class="content-wrap">
		<jsp:include page="/WEB-INF/views/common/memberHeader.jsp" />
		<article id="content" class="content">
			<div class="page-content">
				<div class="reserve-wrap">
					<div id="menuList">
						<div class="content-head">
							<h2>주문 내역</h2>
						</div>
						<table class="table" style="text-align: center; vertical-align: middle;">
							<tr>
								<th class="th" scope="col">주문번호</th>
								<th class="th" scope="col">주문자 ID</th>
								<th class="th" scope="col">주문 상품</th>
								<th class="th" scope="col">주문 개수</th>
								<th class="th" scope="col">주문 가격</th>
								<th class="th" scope="col">주문 날짜</th>
								<th class="th" scope="col">주문상태</th>
								<th class="th" scope="col"></th>
							</tr>
							<c:forEach items="${list }" var="orList">
								<tr>
									<input type="hidden" class="nullChk" value="${orList.orderNo }">
									<td scope="row">${orList.orderNo }</td>
									<td scope="row">${orList.memberId }</td>
									<td scope="row">${orList.pName }</td>
									<td scope="row">${orList.orderQuan }</td>
									<td scope="row">${orList.pPrice }</td>
									<td scope="row">${orList.orderDate }</td>
									<td scope="row">${orList.orderStatus }</td>
									<td scope="row">
										<button type="button">취소</button>
									</td>
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
		if($(".nullChk").val() == null) {
			alert("주문 내역이 존재하지 않습니다.");
		}
	</script>
</body>
</html>