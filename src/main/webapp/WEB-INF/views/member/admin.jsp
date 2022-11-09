<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>

<link rel="icon" type="image/x-icon" href="favicon.ico">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/header/style.css">
<link rel="stylesheet" href="/resources/css/member/admin.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<div class="content-wrap" style="height: 900px;">
    <h2>관리자</h2>
    <aside id="aside" class="sidebar">
        <div class="sidebar-1">
            <ul class="category">
                <li>
                    <div><a href="#" style="color:black;">내정보수정</a></div>
                    <div><a href="#" style="color:black;">회원관리</a></div>
                    <div><a href="#" style="color:black;">로그아웃</a></div>
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
            <h4>회원관리</h4>

                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" href="#" style="color:black;">전체</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" style="color:black;">승인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" style="color:black;">미승인</a>
                    </li>
                </ul>

            <table class="table" style="text-align: center; vertical-align: middle;">
                <tr>
                    <th>no</th>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>휴대폰번호</th>
                    <th>마켓사용여부</th>
                    <th>가입일</th>
                    <th>승인관리</th>
                    <th>처리</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>홍길동</td>
                    <td>gdhong</td>
                    <td>010-1234-1234</td>
                    <td>매장이용</td>
                    <td>2022-11-01</td>
                    <td>
                        <select class="selectbox">
                            <option value="승인" class="accept">승인</option>
                            <option value="미승인" class="accept">미승인</option>
                        </select>
                    </td>
                    <td><button class="saveBtn">확정</button></td>
                </tr>

            </table>
        </div>
        
    </article>
</div>

</body>
</html>