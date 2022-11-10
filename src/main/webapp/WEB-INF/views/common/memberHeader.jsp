<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.etc {
	padding: 10px 1.25rem !important;
}
</style>
<h2>마이페이지</h2>
<aside id="aside" class="sidebar" style="padding-top: 0px;">
	<div class="sidebar-1">
		<ul class="category">
			<li>
				<div>
					<a href="#">장바구니</a>
				</div>
				<div>
					<a href="/reserveList.do">예약 내역</a>
				</div>
				<div>
					<a href="#">주문 내역</a>
				</div>
				<div>
					<a href="/mypage.do">내 정보 수정</a>
				</div>
				<div>
					<a href="/logout.do">로그아웃</a>
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