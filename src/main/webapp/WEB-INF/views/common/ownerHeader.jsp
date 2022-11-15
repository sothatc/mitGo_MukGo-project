<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.accordion-button {
	font-size: 20px !important;
}

.etc {
	padding: 10px 1.25rem !important;
}

.accordion-item {
	border: 0;
}

.accordion-div {
	padding: 3px 1.25rem !important;
	padding-left: 40px !important;
}

.on {
	display: block !important;
}
.list-wrap>.titleShow {
	font-size: 13px;
}
</style>
<h2>사업자 마이페이지</h2>
<aside id="aside" class="sidebar" style="padding-top: 0px;">
	<div class="sidebar-1">
		<ul class="category">
			<li>
				<c:choose>
					<c:when test="${sessionScope.o.ownerStatus == 2}">
						<c:choose>
							<c:when test="${empty s }">
								<div class="etc">
									<a href="/addStoreFrm.do">업체 등록</a>
								</div>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${sessionScope.o.ownerLevel == 1}">
										<div class="accordion-item">
											<h2 class="accordion-header" id="flush-headingOne">
												<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">업체</button>
											</h2>
											<div class="accordion-div">
												<a href="/updateStoreFrm.do">업체 정보 수정</a>
											</div>
											<div class="accordion-div">
												<a href="/addMenuFrm.do">메뉴 추가</a>
											</div>
											<div class="accordion-div">
												<a href="/menuFrm.do">메뉴 관리</a>
											</div>
											<div class="accordion-div">
												<a href="/reserveManage.do?reqPage=1">예약관리</a>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="accordion-item">
											<h2 class="accordion-header" id="flush-headingOne">
												<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">업체</button>
											</h2>
											<div class="accordion-div">
												<a href="/updateStoreFrm.do">업체 정보 수정</a>
											</div>
											<div class="accordion-div">
												<a href="/addMenuFrm.do">메뉴 추가</a>
											</div>
											<div class="accordion-div">
												<a href="/menuFrm.do">메뉴 관리</a>
											</div>
											<div class="accordion-div">
												<a href="/reserveManage.do?reqPage=1">예약관리</a>
											</div>
										</div>
										<div class="accordion-item">
											<h2 class="accordion-header" id="flush-headingOne">
												<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">마켓</button>
											</h2>
											<div class="accordion-div">
												<a href="/addMarketProductFrm.do">상품 추가</a>
											</div>
											<div class="accordion-div">
												<a href="/marketProductListFrm.do">상품 관리</a>
											</div>
											<div class="accordion-div">
												<a href="#">주문 관리</a>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<div class="etc">
							<a href="/updateOwnerFrm.do">내 정보 수정</a>
						</div>
						<div class="etc">
							<a href="/deleteOwner.do?ownerNo=${sessionScope.o.ownerNo }" class="delOwner">회원 탈퇴</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="etc">
							<a href="/updateOwnerFrm.do">내 정보 수정</a>
						</div>
						<div class="etc">
							<a href="/deleteOwner.do?ownerNo=${sessionScope.o.ownerNo }" class="delOwner">회원 탈퇴</a>
						</div>
					</c:otherwise>
				</c:choose>
			</li>
		</ul>
	</div>
	<div class="sidebar-2">
		<ul class="category">
			<li>
				<h4>공지사항</h4>
				<c:forEach items="${ncList }" var="n">
				<div class="list-wrap">
					<a href="/noticeDetail.do?noticeNo=${n.noticeNo }" class="titleShow">${n.noticeTitle }</a>
				</div>
				</c:forEach>
			</li>
		</ul>
	</div>
</aside>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(".accordion-button").click(function() {
		$(this).parent().nextAll().toggle();
	});
	
	$(".delOwner").on("click",function(e){
		if(confirm("탈퇴 하시겠습니까?") == true) {
			alert("탈퇴되었습니다.");
		}else {
			e.preventDefault();
			return;
		}
	});
</script>