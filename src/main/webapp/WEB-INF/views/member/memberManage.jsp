<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지</title>
</head>
<body>

<link rel="icon" type="image/x-icon" href="favicon.ico">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/header/style.css">
<link rel="stylesheet" href="/resources/css/member/admin.css">
<link rel="stylesheet" href="/resources/css//member/updateSuperAdmin.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<div class="content-wrap" style="height: 900px;">
    <h2>관리자</h2>
    <aside id="aside" class="sidebar">
        <div class="sidebar-1">
            <ul class="category">
                <li>
                    <div><a href="/memberManage.do" style="color:black;">회원관리</a></div>
                    <div><a href="/adminMemberManage.do" style="color:black;">업주관리</a></div>
                    <div><a href="/logout.do" style="color:black;">로그아웃</a></div>
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
		<div class="contents" style="padding:0;">
            <h4 style="margin: 0;">회원관리</h4>
            <!---------- 검색조건 ---------->
            <div class="searchWrap" style="width:800px; margin-top:10px; margin-bottom: 20px;">
            	<form action="/searchMember.do" method="post">
					<select name="type" style="width:100px; height:32px;">
						<option value="id">아이디</option>
						<option value="name">이름</option>
					</select>
					<input type="text" name="keyword" style="height:32px;">
					<input type="submit" value="검색" style="background-color: rgb(51,51,51); color:white; width:40px; border-radius: 5px;">
            	</form>
            </div>
            <!---------- 목록 테이블 --------->	
	            <table class="tablewrap" style="text-align: center; vertical-align: middle;">
	                <tr style="height: 50px; border-bottom: 2px solid black"">
	                    <th>회원번호</th>
	                    <th>이름</th>
	                    <th>아이디</th>
	                    <th>휴대폰번호</th>
	                    <th>가입일</th>
	                </tr>
	  				<c:forEach items="${list}" var="m">
					<tr style="height: 50px; border-bottom: 1px solid lightgray">
	                    <td>${m.memberNo}</td>
	                    <td>${m.memberName}</td>
	                    <td>${m.memberId}</td>
	                    <td>${m.memberPhone}</td>
	                    <td>${m.memEnrollDate}</td>
	                </tr>
	                </c:forEach>
	            </table>
	            
        </div>
    </article>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</body>
</html>