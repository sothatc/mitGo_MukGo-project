<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/noticeDetail.css">
<link rel="stylesheet" href="/resources/css/header.css">
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<div class="login-join"><a href="#">로그인/회원가입</a></div>
    <div class="header-wrap">
        <div class="header-list1">
            <ul class="ul1">
                <li>맛집리스트</li>
                <li>상품리스트</li>
            </ul>

            <ul class="ul2">
                <li>공지사항</li>
                <li>고객센터</li>
            </ul>

            <a href="#"><img src="image/이미지/믿고먹고로고.png" alt=""></a>
        </div>
    </div> <!-- hashmap을 다시 가져오기 -->
	
	<c:choose>
		<c:when test="${empty n}">
			${msg }
		</c:when>
		
		<c:otherwise>
			<div class="noticeDetail-wrap">
        <div class="notice-title-wrap">
            <div class="notice-title">
                <h1>공지사항</h1>
            </div>

            <div class="notice-title" style="text-align: left;">
                <h1 style="margin-bottom: 0; margin-top: 50px;">${n.noticeTitle }</h1>
            </div>

            <div class="notice-enrollDate">
                <span style="margin-right: 20px;">${n.noticeDate }</span>    <span>조회수 : ${n.readCnt }</span>
            </div>
        </div>

        <div class="notice-detail-content" style="padding-top: 20px;">
            ${n.noticeContent }
        </div>
        
        <c:if test="${not empty n.fileList }">
        	<div class="notice-file" style="margin-top: 10px; border-top: 1px solid gray; border-bottom: 1px solid gray; padding-top: 10px;">
	        	<table style="width: 800px;">
	        		<tr>
	        			<th style="width: 100px; text-align: center;">
	        				첨부파일
	        			</th>
	        			<td>
	        				<c:forEach items="${n.fileList }" var="nf">
				        		<p style="text-align: left; padding-left: 20px;">
				        			<a href="/noticeFileDown.do?noticeFileNo=${nf.noticeFileNo }">${nf.filename }</a>
				        		</p>
				        	</c:forEach>
	        			</td>
	        		</tr>
	        	</table>
        	
        	</div>
        </c:if>

        <div class="notice-detail-btn">
        	<c:choose>
        		<c:when test="${not empty sessionScope.m and sessionScope.m.memberClass == 1}">
        			<button type="button" class="btn btn-secondary" style="margin-right: 10px;" onclick="updateNoticeFrm(${n.noticeNo});">수정</button>
            		<button type="button" class="btn btn-outline-secondary" style="margin-left: 10px;" onclick="deleteNotice(${n.noticeNo});">삭제</button>
        		</c:when>
        		
        		<c:otherwise>
        			<button type="button" class="btn btn-secondary" style="width: 200px;" onclick="goNoticeList()">목록으로</button>
        		</c:otherwise>
        	</c:choose>
            
        </div>
    </div>
		</c:otherwise>
	</c:choose>
	
    

    <script>
    	function deleteNotice(noticeNo){
    		location.href="/deleteNotice.do?noticeNo=" + noticeNo;
    	}
    
    	function updateNoticeFrm(noticeNo){
    		location.href="/updateNoticeFrm.do?noticeNo=" + noticeNo;
    	}
    
        function goNoticeList(){
            location.href="/selectNoticeList.do?reqPage=1";
        }
        
        
    </script>
</body>
</html>









