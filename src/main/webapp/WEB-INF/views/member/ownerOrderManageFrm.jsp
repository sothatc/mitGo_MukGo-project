<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" href="/resources/css/member/owner.css">
	<div class="content-wrap">
		<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp" />
		<article id="content" class="content">
			<div class="page-content" style="display: flex;">
				<div class="content-wrap">
					<div id="orderManageList">
						<div class="content-head">
							<h2>주문 관리</h2>
						</div>
		            	<form action="/searchOrder.do?reqPage=1" method="post">
							<select name="type" style="width:100px; height:32px;">
								<option value="orderNo">주문번호</option>
								<option value="id">아이디</option>
							</select>
							<input type="text" name="keyword" style="height:32px;">
							<input type="submit" value="조회" style="background-color: rgb(51,51,51); color:white; width:40px;">
		            	</form>
						<table class="table" style="text-align: center; vertical-align: middle; margin-top:20px;">
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">아이디</th>
								<th scope="col">상품명</th>
								<th scope="col">주문일자</th>
								<th scope="col">수량</th>
								<th scope="col">주문금액</th>
								<th scope="col">주문상태</th>								
							</tr>
							<tr>
								<td>추후에</td>
								<td>넣을</td>
								<td>값</td>
								<td>추후에</td>
								<td>넣을</td>
								<td>값</td>
								<td>~~</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</article>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>