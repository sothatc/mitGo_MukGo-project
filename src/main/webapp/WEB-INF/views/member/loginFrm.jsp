<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <form action="#" method="post">
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
                    </ul>
                    <input class="login-btn" type="submit" value="로그인">
                </div>
            </form>
        </div>
        <div class="member-box">
            <a href="#">아이디/비밀번호 찾기 |</a>
            <a href="#">회원가입 하기</a>
        </div>
    </div> 
</body>
</html>