<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<link rel="stylesheet" href="/resources/css/store/storeList.css">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<!--헤더-->
	<div class="storeList-content-wrap">
	
		<form action="/searchStoreList.do?reqPage=1" method="post">
			<div class="storeList-searchinput">
				<input type="text" name="search">
				<button>검색</button>
			</div>
		</form>
		
		<div class="storeList-map">
			<div class="storeList-map-content">
				<div>강북</div>
				<div>강남</div>
				<div>
					<p>oo 지역 맛집 찾기</p>
				</div>
			</div>
		</div>
		<div class="storeList-tag">
			<div class="storeList-tag-content">
				<ul>
					<li>
						<a href="/storeList.do?reqPage=1">전체</a>
					</li>
					<li>
						<a href="/selectTag.do?category=1&reqPage=1"><img src="/resources/img/bibimpab.png">한식</a>
					</li>
					<li>
						<a href="/selectTag.do?category=2&reqPage=1"><img src="/resources/img/food.png">양식</a>
					</li>
					<li>
						<a href="/selectTag.do?category=3&reqPage=1"><img src="/resources/img/salmon.png">일식</a>
					</li>
					<li>
						<a href="/selectTag.do?category=4&reqPage=1"><img src="/resources/img/dimpling.png">중식</a>
					</li>
					<li>
						<a href="/selectTag.do?category=5&reqPage=1"><img src="/resources/img/tteokbokki.png">분식</a>
					</li>
					<li>
						<a href="/selectTag.do?category=6&reqPage=1"><img src="/resources/img/chicken.png">육류</a>
					</li>
					<li>
						<a href="/selectTag.do?category=7&reqPage=1"><img src="/resources/img/sea-food.png">씨푸드</a>
					</li>
					<li>
						<a href="/selectTag.do?category=8&reqPage=1"><img src="/resources/img/dessert.png">디저트</a>
					</li>
					<li>
						<a href="/selectTag.do?category=9&reqPage=1">기타</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="storeList-sort">
			<div class="storeList-sort-content">
				<ul>
					<li>최신순</li>
					<li>오래된순</li>
					<li>평점순</li>
				</ul>
			</div>
		</div>
		<div class="storeList-list">
			<div class="storeList-list-content">
				<c:forEach items="${list }" var="s">
					<div class="showList">
						<a href="/storeDetail.do?storeNo=${s.storeNo }">
							<div>
								<img src="resources/upload/store/${s.thumbNail }">
							</div>
							<div>
								<div style="display: none">${s.storeNo }</div>
								<div>가게이름 : ${s.storeName }</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="page">${pageNavi }</div>
	</div>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script src="/resources/js/store/storeList.js"></script>
</body>
</html>