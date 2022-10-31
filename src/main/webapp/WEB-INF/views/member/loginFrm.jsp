<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <form action="/login.do" method="post">
                <div class="login">
                    <ul>
                        <li>         
                            <div class="input01">
                                <div>
                                    <label class="label">아이디</label>
                                    <input type="text" name="memberId">
                                </div>
                            </div>                
                        </li>
                        <li>
                            <div class="input01">
                                <label class="label">비밀번호</label>
                                <input type="password" name="memberPw">
                            </div>
                        </li>
                        <button class="login-btn" type="submit">로그인</button>
                    </ul>
                </div>
            </form>
        </div>
        <div class="member-box">
            <a href="#">아이디/비밀번호 찾기 |</a>
            <a href="#">회원가입 하기</a>
        </div>
    </div> 

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
        $(".login-btn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
		})
		$(".login-btn").on("mouseleave",function(){
			$(this).css("background-color","");
		})

    </script>
</body>
</html>