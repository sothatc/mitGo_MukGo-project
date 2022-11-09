<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 관리</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
.updateBtn {
	background-color: rgb(51, 51, 51) !important;
	color: #fff !important;
	padding: 0 10px 0 10px !important;
}

.deleteBtn {
	background-color: rgb(230, 83, 20) !important;
	color: #fff !important;
	padding: 0 10px 0 10px !important;
}

.updateBtn:hover {
	font-weight: 600;
}

.deleteBtn:hover {
	font-weight: 600;
	border: 1px solid rgb(230, 83, 20) !important;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" href="/resources/css/member/owner.css">
	<div class="content-wrap">
		<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp" />
		<article id="content" class="content">
			<div class="page-content" style="display: flex;">
				<div class="content-wrap">
					<div id="menuList">
						<div class="content-head">
							<h2>메뉴 관리</h2>
						</div>
						<table class="table" style="text-align: center; vertical-align: middle;">
							<tr>
								<th scope="col">메뉴사진</th>
								<th scope="col">메뉴명</th>
								<th scope="col">가격(&#8361;)</th>
								<th scope="col">수정</th>
								<th scope="col">삭제</th>
							</tr>
							<c:forEach items="${ list}" var="me">
								<tr>
									<td style="display: none">${me.menuNo }</td>
									<td>
										<img src="resources/upload/menu/${me.menuImg }" style="width: 50px; height: 50px;">
									</td>
									<td>${me.menuName }</td>
									<td>
										<fmt:formatNumber value="${me.menuPrice}" pattern="#,###" />
									</td>
									<td>
										<button type="button" class="btn updateBtn">수정</button>
									</td>
									<td>
										<button type="button" class="btn deleteBtn">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</article>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(".deleteBtn").on("click", function() {
			if (confirm("메뉴를 삭제하시겠습니까?")) {
				const menuNo = $(this).parent().parent().children().eq(0).text();
				$(location).attr('href', "/deleteMenu.do?menuNo=" + menuNo);
			}
		});

		$(".updateBtn").on("click", function() {
			const menuNo = $(this).parent().parent().children().eq(0).text();
			$(location).attr('href', "/updateMenuFrm.do?menuNo=" + menuNo);
		});
	</script>
</body>
</html>