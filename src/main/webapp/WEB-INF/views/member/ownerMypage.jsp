<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="/resources/css/member/owner.css">
<link rel="stylesheet" href="/resources/css//member/updateOwner.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<div class="content-wrap" style="height: 900px;">
		<h2>사업자 마이페이지</h2>
		<aside id="aside" class="sidebar">
			<div class="sidebar-1">
				<ul class="category">
					<li>
						<div><a href="#">내 정보 수정</a></div>
						<c:choose>
							<c:when test="${empty s }">
								<div><a href="/addStoreFrm.do">업체 등록</a></div>
							</c:when>
							<c:otherwise>
								<input type="hidden" value="${s }" class="storeInfo">
								<div><a href="/updateStoreFrm.do?storeNo=${s.storeNo }">업체 정보 수정</a></div>
								<div onclick="callFunction();" id="menuManage">메뉴 관리</div>
							</c:otherwise>
						</c:choose>
						<div><a href="/ownerLogout.do">로그아웃</a></div>
						<div><a href="#">회원 탈퇴</a></div>
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
		<article id="content" class="content">
			<div class="contents">
		        <form name="ownerCheckIdFrm" action="/ownerCheckId.do">
					<input type="hidden" name="ownerCheckId">
				</form>
		        <form action="/ownerJoin.do" method="post">
		        <div class="membership-form">
		            <div class="form-write">
		                <h4>사업자 정보</h4>
		                    <ul>
		                        <li>
		                            <span class="tit">비밀번호</span>
		                            <div class="cnt">
		                                <div class="input01">
		                                    <label class="label" for="ownerPw">대/소문자와 숫자를 포함한 최소 8자리를 입력해주세요.</label>
		                                    <input type="password" id="ownerPw" name="ownerPw">
		                                </div>
		                                <p class="text-note"></p>
		                            </div>
		                        </li>
		                        <li>
		                            <span class="tit">비밀번호 확인</span>
		                            <div class="cnt">
		                                <div class="input01">
		                                    <label class="label" for="ownerPw2">비밀번호를 한 번 더 입력해주세요.</label>
		                                    <input type="password" id="ownerPw2" name="ownerPw2">
		                                </div>
		                                <p class="text-note"></p>
		                            </div>
		                        </li>
		                        <li>
		                        	<span class="tit">마켓사용여부</span>
		                        	<div class="cnt">
		                        		<div class="selBox01">
			                                <select id="selectMarket" name="ownerLevel">
			                                    <option value="1">매장이용</option>
			                                    <option value="2">매장 및 마켓이용</option>
			                                </select>
			                            </div>
		                        	</div>
		                        </li>
		                    </ul>
		                </div>
		            </div>
		            <div class="joinBtn">
		                <input type="submit" id="joinBtn" value="정보수정">
		            </div>
		        </form>
		    </div>
			
		</article>
	</div>
	 
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<!-- 
	<script>
	function callFunction(){
		var storeInfo = $(".storeInfo").val();
		console.log(storeInfo);
		$.ajax({
			type : "POST",
			url : "/menuFrm.do",
			data : {s : storeInfo},
			success : function(data) {
                
			}
		});
	}

	</script>
	 -->
</body>
</html>