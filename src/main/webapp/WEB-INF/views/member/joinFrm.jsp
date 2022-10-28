<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/css/joinFrm.css">
	
</head>
<body>

    <div class="header"></div>
    <div class="contents">
        <div class="membership-form">
            <div class="form-write">
                <h4>회원정보</h4>
                <form action="#" method="post">
                    <ul>
                        <li>
                            <span class="tit">이름</span>
                            <div class="cnt">
                                <div class="input01">
                                    <label class="label" for="memberName">한글로 2~5자리 이내로 입력해주세요.</label>
                                    <input type="text" id="memberName" name="memberName">
                                </div>
                                <p class="text-note"></p>
                            </div>
                        </li>
                        <li>
                            <span class="tit">아이디</span>
                            <div class="cnt">
                                <div class="input01" id="input01">
                                    <label class="label" for="memberId">4~20자리 이내로 입력해주세요.</label>
                                    <input type="text" id="memberId" name="memberId">
                                </div>
                                <p class="text-note"></p>
                                <button type="button" id="idChkBtn">중복체크</button>
                            </div>
                        </li>
                        <li>
                            <span class="tit">비밀번호</span>
                            <div class="cnt">
                                <div class="input01">
                                    <label class="label" for="memberPw">대/소문자와 숫자를 포함한 최소 8자리를 입력해주세요.</label>
                                    <input type="text" id="memberPw" name="memberPw">
                                </div>
                                <p class="text-note"></p>
                            </div>
                        </li>
                        <li>
                            <span class="tit">비밀번호 확인</span>
                            <div class="cnt">
                                <div class="input01">
                                    <label class="label" for="memberPw2">비밀번호를 한 번 더 입력해주세요.</label>
                                    <input type="text" id="memberPw2" name="memberPw2">
                                </div>
                                <p class="text-note"></p>
                            </div>
                        </li>
                        <li>
                            <span class="tit">휴대폰 인증</span>
                            <div class="cnt">
                                <div class="input02">
                                    <div class="box01">
                                        <div class="selBox01">
                                            <select id="selectPhone" name="frontNum">
                                                <option value="010">010</option>
                                                <option value="017">017</option>
                                                <option value="011">011</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="box02">
                                    	<form action="/memberPhoneCheck2.do">
                                        <label class="label" for="memberPhone">전화번호를 입력해주세요.</label>
                                        <input type="number" id="memberPhone" name="memberPhone" value="${phone2 }">
	                                    <span id="result">${memberPhone }</span>
	                                    <button type="submit" class="phoneChkSendBtn">인증번호 발송</button>
	                                    </form>
                                    </div>
                                    <div class="box03">
                                        <label class="label" for="certifyNum">인증번호를 입력해주세요.</label>
                                        <input type="text" id="certifyNum" name="certifyNum">
                                    </div>
                                    <button class="phoneChkBtn">확인</button>
                                    <p class="text-note"></p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="agreeChkBox-wrap">
                <div class="agreeChkBox">
                    <div class="chkBox">
                        <div class="chk-box1">
                            <input type="checkbox" id="allChk" name="allChk">
                            <label for="allChk">전체동의</label>
                        </div>
                        <hr>
                        <div class="chk-box2">
                            <div style="display: inline-block;">
                                <input type="checkbox" id="allow1" name="allow1">
                                <label for="allow1">[필수] 이용약관 동의</label>
                            </div>
                            <a href="#" class="allowContent" style="display: inline-block;">[내용보기]</a>
                        </div>
                        <div class="chk-box2">
                            <div style="display: inline-block;">
                                <input type="checkbox" id="allow1" name="allow1">
                                <label for="allow1">[필수] 개인 정보 수집 및 이용에 동의</label>
                            </div>
                            <a href="#" class="allowContent" style="display: inline-block;">[내용보기]</a>
                        </div>
                        <div class="chk-box2">
                            <div style="display: inline-block;">
                                <input type="checkbox" id="allow1" name="allow1">
                                <label for="allow1">[필수] 만 14세 이상</label>
                            </div>
                            <a href="#" class="allowContent" style="display: inline-block;">[내용보기]</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="joinBtn">
                <input type="submit" id="joinBtn" value="회원가입">
            </div>
        </form>
    </div>
	
	
	<script>
		<%--
		번호 테스트용
		$(".phoneChkSendBtn").on("click",function(){
			const phone1 = $("[name=frontNum]").val();
			var phone2 = $("[name=memberPhone]").val();
			const result = $("#result");
			$.ajax({
				url : "/memberPhoneCheck2.do",
				type : "POST",
				data : {phone2 : phone2},
				success : function(data) {
					result.text(data);
					console.log("성공");
				},
				error : function() {
					console.log("실패");
				}
			});
		});
		--%>
	
		<%--
		$(".phoneChkSendBtn").click(function(){
			alert("인증번호가 발송되었습니다.");
			var phone1 = $("[name=frontNum]").val();
			var phone2 = $("[name=memberPhone]").val();
			var phone = phone1+phone2;
			$.ajax({
				type : "POST",
				url : "/memberPhoneCheck.do",
				data : {phone : phone, phone2 : phone2},
				success : function(data) {
					alert("성공");
				}
			});
		});
		--%>
		
		$(".phoneChkBtn").on("click",function(){
			console.log(${numStr});
		});
		
		$("#joinBtn").on("click",function(event){
			//이름 유효성 검사
			const nameReg = /^[가-힣]{2,5}$/;
			const name = $("#memberName");
			nameValue = name.val();
			const nameComment = name.parent().next();
			if(nameReg.test(nameValue)){
				nameComment.text("");
			}else {
				nameComment.text("* 한글로 2~5자리 이내로 입력해주세요.");
				nameComment.css("color","red");
				event.preventDefault();
			}
			//아아디 유효성검사
			const idReg = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
			const id = $("#memberId");
			idValue = id.val();
			const idComment = id.parent().next();
			if(idReg.test(idValue)){
				idComment.text("");
				
			}else {
				idComment.text("* 4~20자리 이내로 입력해주세요.");
				idComment.css("color","red");
				event.preventDefault();
			}
			//비밀번호 유효성 검사
			const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
			const pw = $("#memberPw");
			pwValue = pw.val();
			const pwComment = pw.parent().next();
			if(pwReg.test(pwValue)){
				pwComment.text("");
			}else {
				pwComment.text("* 대/소문자와 숫자를 포함한 최소 8자리를 입력해주세요.");
				pwComment.css("color","red");
				event.preventDefault();
			}
			// 비밀번호 확인 검사
			const pwVal = pw.val();
			const pwChk = $("#memberPw2");
			const pwChkVal = pwChk.val();
			const pwChkComment = pwChk.parent().next();
			if(pwChkVal == pwVal) {
				
			}else {
				pwChkComment.text("* 비밀번호가 일치하지 않습니다.");
				pwChkComment.css("color","red");
				event.preventDefault();
			}
			
		});
		
		
		
		
		
			
		
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
		$(".phoneChkSendBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
		})
		$(".phoneChkSendBtn").on("mouseleave",function(){
			$(this).css("background-color","");
		})
        $(".phoneChkBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
		})
		$(".phoneChkBtn").on("mouseleave",function(){
			$(this).css("background-color","");
		})
		$("#idChkBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
		})
		$("#idChkBtn").on("mouseleave",function(){
			$(this).css("background-color","");
		})
		const joinBtn = $(".joinBtn").children();
		$("#joinBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
		})
		$("#joinBtn").on("mouseleave",function(){
			joinBtn.css("background-color","");
		})
		
		
		
		
		
	</script>
	<script src="/resources/js/join.js"/>
</body>
</html>