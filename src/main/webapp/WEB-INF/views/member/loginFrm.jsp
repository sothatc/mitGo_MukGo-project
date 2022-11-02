<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/css/loginFrm.css">
</head>
<body>
	<div class="header">ㅡㅡ</div>
    <div class="login-wrap">
        <div class="login-input">
            <div>로그인</div>
            <div>가입하신 아이디로 로그인 하세요.</div>
            
            <input type="radio" name="selLogin" id="normal" value="1">
            <label for="normal">일반회원</label>
            <input type="radio" name="selLogin" id="owner" value="2">
            <label for="owner">사업자</label>
            <input type="hidden" class="radio" name="radio">
  
            <form action="/login.do" method="post" id="normalLoginFrm">
                <div class="login">
                    <ul>
                        <li>         
                            <div class="input01">
                                <div>
                                    <label class="label" for="memberId">아이디</label>
                                    <input type="text" name="memberId" id="memberId">
                                </div>
                            </div>                
                        </li>
                        <li>
                            <div class="input01">
                                <label class="label" for="memberPw">비밀번호</label>
                                <input type="password" name="memberPw" id="memberPw">
                            </div>
                        </li>
                        <button class="login-btn" type="submit">로그인</button>
                    </ul>
                </div>
            </form>
            <form action="/ownerLogin.do" method="post" id="ownerLoginFrm">
                <div class="login">
                    <ul>
                        <li>         
                            <div class="input01">
                                <div>
                                    <label class="label" for="ownerId">아이디</label>
                                    <input type="text" name="ownerId" id="ownerId">
                                </div>
                            </div>                
                        </li>
                        <li>
                            <div class="input01">
                                <label class="label" for="ownerPw">비밀번호</label>
                                <input type="password" name="ownerPw" id="ownerPw">
                            </div>
                        </li>
                        <button class="login-btn" type="submit">로그인</button>
                    </ul>
                </div>
            </form>
        </div>
        <div class="member-box">
            <a href="#" class="e">아이디/비밀번호 찾기 |</a>
            <a href="/selectJoin.do">회원가입 하기</a>
        </div>
    </div> 

    <script>
        const input = $(".label").next();
        input.on("focus",function(){
		    const label = $(this).prev();
		    label.css("display","none");
		});
		input.on("blur",function(){
		    const label = $(this).prev();
		    if($(this).val() == ""){
			    label.css("display","");
		    }
		});
        $(".login-btn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
		});
		$(".login-btn").on("mouseleave",function(){
			$(this).css("background-color","");
		});
		
		/*일반, 사업자 로그인 구분*/
		$("#normal").click();
		$("#ownerLoginFrm").css("display","none");
		$("[name=selLogin]").on("click",function(){
			var selLogin = $("input[name=selLogin]:checked").val();
			console.log(selLogin);
			if(selLogin == 1) {
				$("#ownerLoginFrm").css("display","none");
				$("#normalLoginFrm").css("display","block");
			}else if(selLogin == 2){
				$("#normalLoginFrm").css("display","none");
				$("#ownerLoginFrm").css("display","block");
			}
		});
		
		
    </script>
</body>
</html>