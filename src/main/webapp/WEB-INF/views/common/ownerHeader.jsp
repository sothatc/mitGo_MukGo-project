<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2>사업자 마이페이지</h2>
<aside id="aside" class="sidebar">
	<div class="sidebar-1">
		<ul class="category">
			<li>
				<div>
					<a href="/ownerMypage.do">내 정보 수정</a>
				</div>
				<c:choose>
					<c:when test="${empty s }">
						<div>
							<a href="/addStoreFrm.do">업체 등록</a>
						</div>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${sessionScope.o.ownerLevel == 1}">
								<div>
									<a href="/updateStoreFrm.do">업체 정보 수정</a>
								</div>
								<div>
									<a href="/addMenuFrm.do">메뉴 추가</a>
								</div>
								<div>
									<a href="/menuFrm.do">메뉴 관리</a>
								</div>
								<div>
									<a href="/reserveManage.do?reqPage=1">예약관리</a>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<a href="/updateStoreFrm.do">업체 정보 수정</a>
								</div>
								<div>
									<a href="/addMenuFrm.do">메뉴 추가</a>
								</div>
								<div>
									<a href="/menuFrm.do">메뉴 관리</a>
								</div>
								<div>
									<a href="/reserveManage.do?reqPage=1">예약관리</a>
								</div>
								<div>
									<a href="#">마켓관리</a>
								</div>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				<div>
					<a href="/ownerLogout.do">로그아웃</a>
				</div>
				<div>
					<a href="#">회원 탈퇴</a>
				</div>
			</li>
		</ul>
	</div>
	<div class="sidebar-2">
		<ul class="category">
			<li>
				<h4>공지사항</h4>
			</li>
		</ul>
	</div>
</aside>