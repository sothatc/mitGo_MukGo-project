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
								<c:choose>
									<c:when test="${sessionScope.o.ownerLevel == 1}">
										<div><a href="/updateStoreFrm.do">업체 정보 수정</a></div>
										<div><a href="/addMenuFrm.do">메뉴 추가</a></div>
										<div><a href="/menuFrm.do">메뉴 관리</a></div>
										<div><a href="#">예약관리</a></div>
									</c:when>
									<c:otherwise>
										<div><a href="/updateStoreFrm.do">업체 정보 수정</a></div>
										<div><a href="/addMenuFrm.do">메뉴 추가</a></div>
										<div><a href="/menuFrm.do">메뉴 관리</a></div>
										<div><a href="/reserveManage.do">예약관리</a></div>
										<div><a href="#">마켓관리</a></div>
									</c:otherwise>
								</c:choose>
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
		        <form action="/updateOwner.do" method="post">
		        <input type="hidden" name="ownerNo" value="${sessionScope.o.ownerNo }">
		        <div class="membership-form">
		            <div class="form-write">
		                <h4>사업자 정보 수정</h4>
		                    <ul>
								<li>
		                            <span class="tit">이름</span>
		                            <div class="cnt">
		                                <div class="input01">
		                                    <input type="text" id="memberName" name="memberName" value="${sessionScope.o.ownerName }" disabled>
		                                </div>
		                            </div>
                       			</li>
								<li>
								<span class="tit">아이디</span>
								<div class="cnt">
									<div class="input01" id="input01">
										<input type="text" id="memberId" name="memberId" value="${sessionScope.o.ownerId }" disabled>
									</div>
								</div>
                        		</li>
		                        <li>
		                            <span class="tit">비밀번호</span>
		                            <div class="cnt">
		                                <div class="input01">
		                                    <label class="label" for="ownerPw">대/소문자와 숫자를 포함한 최소 8자리를 입력해주세요.(특수문자x)</label>
		                                    <input type="password" id="ownerPw" name="ownerPw" style="outline: none;">
		                                </div>
		                                <p class="text-note"></p>
		                            </div>
		                        </li>
		                        <li>
		                            <span class="tit">비밀번호 확인</span>
		                            <div class="cnt">
		                                <div class="input01">
		                                    <label class="label" for="ownerPw2">비밀번호를 한 번 더 입력해주세요.</label>
		                                    <input type="password" id="ownerPw2" name="ownerPw2" style="outline: none;">
		                                </div>
		                                <p class="text-note"></p>
		                            </div>
		                        </li>
								<li>
									<span class="tit">휴대폰</span>
									<div class="cnt">
										<div class="input02">
											<input type="text" id="memberPhone1" name="memberPhone1" value="${sessionScope.o.ownerPhone }" disabled>
										</div>
									</div>
								</li>
		                        <li>
		                        	<span class="tit">마켓사용여부</span>
		                        	<div class="cnt">
		                        		<div class="selBox01">
		                        		<input type="hidden" class="myLevel">
			                                <select id="selectMarket" name="ownerLevel">
			                                    <option value="${sessionScope.o.ownerLevel }" selected="selected"></option>
			                                    <option value="1">매장이용</option>
			                                    <option value="2">매장 및 마켓이용</option>
			                                </select>
			                            </div>
		                        	</div>
		                        </li>
		                        <li>
		                            <span class="tit">가입일</span>
		                            <div class="cnt">
		                                <div class="input01">
		                                    <input type="text" id="memberName" name="memberName" value="${sessionScope.o.ownerEnrollDate }" disabled>
		                                </div>
		                            </div>
                       			</li>
		                    </ul>
		                </div>
		            </div>
		            <div class="joinBtn">
		                <input type="submit" id="updateBtn" value="정보수정">
		            </div>
		        </form>
		    </div>
			
		</article>
	</div>
	 
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$("input").on("focus",function(){
		    const label = $(this).prev();
		    label.css("display","none");
		});
		$("input").on("blur",function(){
		    const label = $(this).prev();
		    if($(this).val() == ""){
			    label.css("display","");
		    }
		});
		
		
		var selLevel = $("[name=ownerLevel]").children().first();
		var selLevelVal = selLevel.val();
		if(selLevelVal == 1) {
			selLevel.text("매장이용");			
		}else if(selLevelVal == 2) {
			selLevel.text("매장 및 마켓 이용");
		}
		
		
		/*유효성 검사*/
		$("#updateBtn").on("click", function(){
			//비밀번호 유효성 검사
			const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
			const pw = $("#ownerPw");
			pwValue = pw.val();
			const pwComment = pw.parent().next();
			if(pwReg.test(pwValue)){
				pwComment.text("");
			}else {
				pwComment.text("* 대/소문자와 숫자를 포함한 최소 8자리를 입력해주세요.(특수문자x)");
				pwComment.css("color","red");
				event.preventDefault();
			}
			// 비밀번호 확인 검사
			const pwVal = pw.val();
			const pwChk = $("#ownerPw2");
			const pwChkVal = pwChk.val();
			const pwChkComment = pwChk.parent().next();
			if(pwChkVal == pwVal) {
				
			}else {
				pwChkComment.text("* 비밀번호가 일치하지 않습니다.");
				pwChkComment.css("color","red");
				event.preventDefault();
			}
		});
		
		$("#updateBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			$(this).css("color","#ffc107");
		})
		$("#updateBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
	<!-- 
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
	 -->

	</script>
</body>
</html>