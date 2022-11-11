<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/qnaDetail.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div class="qnaDetail-wrap">
        <div class="qna-title-wrap">
            <div class="qna-title">
                <h1>${qna.qnaTitle }</h1>
            </div>

            <div class="name-date-status">
                <div>
                    <span>${qna.qnaWriter }</span>
                    <span>${qna.qnaDate }</span>
                </div>
                
                <c:choose>
                	<c:when test="${qna.commentStatus == 0 }">
						<div>답변대기</div>
					</c:when>
					
					<c:otherwise>
						<div style="color:white; background-color:#0dcaf0; ">답변완료</div>
					</c:otherwise>
                </c:choose>
                
            </div>
        </div>
        
        <div class="qna-content">
            ${qna.qnaContent }
        </div>
        
        <c:if test="${not empty qna.fileList }">
        	<div style="border-top: 1px solid gray; border-bottom: 1px solid gray; margin-top: 20px; padding-top: 10px;">
        		<c:forEach items="${qna.fileList }" var="qf">
        			<p>
        				<a href="/qnaFileDown.do?qnaFileNo=${qf.qnaFileNo }">${qf.filename }</a>
        			</p>
        		</c:forEach>
        	</div>
        </c:if>
		<c:if test="${sessionScope.m.memberClass == 1 && qna.commentStatus == 0 }">
	        <div class="answer-btn">
	            <button type="button" class="btn btn-secondary" onclick="openAnswer()">답변하기(관리자)</button>
	            <button type="button" class="btn btn-outline-secondary" id="qnaList" onclick="listGo();">목록으로</button>
	        </div>
        </c:if>
		
		<c:choose>
			<c:when test="${qna.commentStatus == 0 }">
				<div class="answer-wrap" style="display: none;">
			        <form action="/insertComment.do" method="post">
			            	<input type="hidden" name="qnaNo" value="${qna.qnaNo }">
			                <div class="answer-info-wrap">
			                    <div>
			                    	${sessionScope.m.memberId }
			                    	<input type="hidden" name="qnaCommentWriter" value="${sessionScope.m.memberId }">
			                    </div>
			                    <div>2022-10-24</div>
			                </div>
			
			                <div class="form-floating" style="margin-top: 10px;">
			                    <textarea class="form-control" placeholder="Leave a comment here" name="qnaComment" id="floatingTextarea2" style="height: 100px;  resize: none"></textarea>
			                    <label for="floatingTextarea2">Comments</label>
			                </div>
							
							
				                <div class="answer-control-btn">
				                    <button type="button" id="commentReg1" class="btn btn-outline-secondary" onclick="commentReg()">등록</button>
				                </div>
		
			        </form>
		        </div>
			</c:when>
			
			<c:when test="${sessionScope.m.memberClass != 1 }">
				<div class="answer-wrap">
						<div class="answer-info-wrap">
							<div>
								${qna.qnaCommentWriter} 
							</div>
							<div>${qna.commnetDate }</div>
						</div>
						
						<c:if test="${sessionScope.m.memberId != qna.qnaCommentWriter }">
							<div class="form-floating" style="margin-top: 10px;">
								<textarea class="form-control" placeholder="Leave a comment here"
									name="qnaComment" id="floatingTextarea2" style="height: 100px; resize: none" readonly>${qna.qnaComment }</textarea>
								<label for="floatingTextarea2">Comments</label>
							</div>
						</c:if>
	
						<c:if test="${sessionScope.m.memberId == qna.qnaCommentWriter }">
							<div class="answer-control-btn">
								<button type="button" class="btn btn-primary" style="background-color:#6c757d; border-color: #6c757d;" onclick="updateBtn(${qna.qnaNo})">수정</button>
								<button type="button" class="btn btn-outline-danger">삭제</button>
							</div>
						</c:if>
						
					</div>
			</c:when>
			
			<c:otherwise>
				<form action="/updateComment.do" method="post">
					<input type="hidden" name="qnaNo" value="${qna.qnaNo }">
					<div class="answer-wrap">
						<div class="answer-info-wrap">
							<div>
								${qna.qnaCommentWriter} 
							</div>
							
							<div>${qna.commnetDate }</div>
						</div>
	
						<div class="form-floating" style="margin-top: 10px;">
							<textarea class="form-control" placeholder="Leave a comment here"
								name="qnaComment" id="floatingTextarea2" style="height: 100px; resize: none">${qna.qnaComment }</textarea>
							<label for="floatingTextarea2">Comments</label>
						</div>
	
						<c:if test="${sessionScope.m.memberId == qna.qnaCommentWriter }">
							<div class="answer-control-btn">
								<button type="submit" class="btn btn-primary" style="background-color:#6c757d; border-color: #6c757d;">수정</button>
								<button type="button" class="btn btn-outline-danger" onclick="deleteComment(${qna.qnaNo});">삭제</button>
							</div>
						</c:if>
						
					</div>
				</form>
				
			</c:otherwise>
		</c:choose>
		
		
		<c:if test="${sessionScope.m.memberId == qna.qnaWriter1 and not empty sessionScope.m}">
			<div class="user-control-btn">
	            <a href="/updateQnaFrm.do?qnaNo=${qna.qnaNo }">수정</a>
	            <a href="/deleteQna.do?qnaNo=${qna.qnaNo }">삭제</a>
	            
        	</div>
		</c:if>
		
		<c:if test="${empty sessionScope.m or not empty sessionScope.m }">
			<div class="user-control-btn">
	            <a href="/qnalist.do?reqPage=1">목록으로</a>
        	</div>
		</c:if>
		
        
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
    	
    	function deleteComment(qnaNo){
    		location.href="/deleteComment.do?qnaNo=" + qnaNo;
    	}
    
    	function listGo(){
    		location.href="/qnalist.do?reqPage=1";
    	}
    
        function commentReg(){
        	
            
            if($("#floatingTextarea2").val() == ""){
                $("#commentReg1").attr("type", "button");
            }else{
                $("#commentReg1").attr("type", "submit");
            }
        }

        function openAnswer(){
            $(".answer-wrap").show();
        }
        
    </script>
</body>
</html>