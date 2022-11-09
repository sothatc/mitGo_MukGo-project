<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/qnaList.css">
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
	.misMsg{
		width: 1000px;
		border-top: 1px solid gray;
		border-bottom : 1px solid gray;
		margin: 0 auto;
		text-align: center;
		padding-top:30px;
		padding-bottom: 30px;
		font-size: 30px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="qna-list-wrap">
        <div class="qna-title">
            <h1>QnA</h1>
        </div>

        <div class="qna-search">
            <form action="#" method="post">
                <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" style="width: 150px; font-size: 18px; height: 60px; text-align: center;">
                    <option value="1">제목 + 내용</option>
                    <option value="2">제목</option>
                    <option value="3">내용</option>
                </select>

                <input class="w3-input w3-border w3-round-large" type="text" style="width: 500px; height: 60px; margin-left: 10px;">
                <button class="w3-button w3-round-large" style="width: 80px; height: 60px; background-color: rgb(33, 33, 33); color: white;margin-left: 10px;">
                    <span class="material-symbols-outlined">
                    search
                    </span></button>
            </form>
        </div>

        <div class="qna-list">
        
        	<c:choose>
	        	<c:when test="${empty list }">
	        		
	        		<div class="misMsg">
	        		<div class="warningMark">
        				<span class="material-symbols-outlined" style="font-size: 80px;">
							error
						</span>
        			</div>
	        			${msg }	
	        		</div>
	        		
	        	</c:when>
	        	
	        	<c:otherwise>
	        		<c:forEach items="${list }" var="q">
	        			<table class="qna-tbl">
			                <tr>
			                    <th>${q.qnaWriter }</th>
			                    <td>
			                        <div style="display: flex; justify-content: center;">
			                        	<c:if test="${q.secretStatus == 1 }">
			                        		<span class="material-symbols-outlined">
			                                lock
			                                </span>
			                        	</c:if>

			                            <a href="#">${q.qnaTitle }</a>
			                        </div>
			                    </td>
			                    <td>
			                        <div style="display: flex; justify-content: center;">
			                            <span class="material-symbols-outlined">
			                                visibility
			                                </span>
			                                <span>${q.readCnt }</span>
			                        </div>
			                        
			                    </td>
			
			                    <td>
			                        <div style="display: flex; justify-content: center;">
			                            <span class="material-symbols-outlined">
			                                schedule
			                                </span>
			                            <span>${q.qnaDate }</span>
			                        </div>
			                    </td>
			
			                    <td>
			                    	<c:choose>
			                    		<c:when test="${q.commentStatus == 0 }">
			                    			<div>답변대기</div>
			                    		</c:when>
			                    		
			                    		<c:otherwise>
			                    			<div style="color:white; background-color:#0dcaf0; ">답변완료</div>
			                    		</c:otherwise>
			                    	</c:choose>
			                    	
			                        
			                    </td>
			                </tr>
		                </table>
	        		</c:forEach>
	        		
	        	</c:otherwise>
	        </c:choose>
            
        </div>
		
		<c:if test="${not empty sessionScope.m }">
			<div class="qna-btn">
	            <a href="/insertQnaFrm.do">글쓰기</a>
	            <a href="#">내 qna 보기</a>
	        </div>
		</c:if>

        <div class="paging">
            <a href="#"><span class="material-symbols-outlined" style="font-size: 30px;">
                chevron_left
                </span>
            </a>
            <a href="#"><span>1</span></a>
            <a href="#"><span>2</span></a>
            <a href="#"><span>3</span></a>
            <a href="#"><span class="material-symbols-outlined"  style="font-size: 30px;">
                chevron_right
                </span></a>
        </div>
    </div>
</body>
</html>