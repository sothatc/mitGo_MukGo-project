<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/myBookmarkList.css">

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
.noMsg {
		width: 800px;
		margin: 0 auto;
		text-align: center;
		font-size: 35px;
		padding-bottom: 50px;
		border-bottom: 1px solid gray;
		margin-bottom: 100px;
	}
	
	.warningMark {
		width: 800px;
		margin: 0 auto;
		text-align: center;
		border-top: 1px solid gray;
		margin-top: 30px;
		padding-top: 50px;
	}
	
	.noMsg1 {
		width: 800px;
		margin: 0 auto;
		text-align: center;
		font-size: 35px;
		padding-bottom: 50px;
		border-bottom: 1px solid gray;
		margin-bottom: 100px;
	}
	
	.warningMark1 {
		width: 800px;
		margin: 0 auto;
		text-align: center;
		border-top: 1px solid gray;
		margin-top: 30px;
		padding-top: 50px;
	}
	
	.paging>span {
		display: inline-block;
		width: 30px;
		text-decoration: none;
		font-size: 20px;
	}
	
	.numberDeco {
		background-color: gray;
		color: white;
		border-radius: 100%;
	}
	
	.pageNo{
		font-size: 20px;
		background-color: gray;
		color: white;
		width: 30px;
		border-radius: 100%;
		line-height: 34px;
	}
	
	.category{
		width: 1000px;
		margin: 0 auto;
		text-align: center;
		margin-top: 50px;
		margin-bottom: 50px;
		font-size: 50px;
	}
	
	.category>a{
		display: inline-block;	
		text-decoration: none;
		color : lightgray;
		font-weight: bold;
	}
	
	.category>a:first-child {
		margin-right: 30px;
	}
	
	.category>a:last-child{
		margin-left: 30px;
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="bookmarkList-wrap">
        <div class="bookmark-title">
            <h1>내 찜목록</h1>
        </div>
        
        <div class="category">
        	<a href="/selectAllStoreBookmark.do?reqPage=1" style="color: gold;">
        		맛집
        	</a>
        	
        	<a href="/myBookmarkList.do?bookMarkId=${sessionScope.m.memberId }&reqPage=1">
        		마켓
        	</a>
        </div>
        
        <c:choose>
        	<c:when test="${empty list }">
        		<div class="warningMark">
        				<span class="material-symbols-outlined" style="font-size: 70px;">
							error
						</span>
        			</div>
        			
        			<div class="noMsg">아직 찜목록이 없습니다.</div>
        	</c:when>
        	
        	<c:otherwise>
        		<div class="bookmark-content-list">
            <ul>
            	<c:forEach items="${list }" var="sbm">
            	
            		<c:choose>
            			<c:when test="${not empty sessionScope.m }">
            				<li class="list">
			                    <a href="/storeDetail.do?storeNo=${sbm.storeNo }&bookmarkId=${sessionScope.m.memberId}">
			                        <div class="bookmark-content">
			                            <div class="img-box">
			                                <img src="/resources/upload/store/${sbm.thumbNail }" alt="">
			                            </div>
			    
			                            <div class="bookmark-man">
			                                <ul>
			                                    <li>${sbm.storeName }</li>
			                                </ul>
			                            </div>
			                        </div>
			                    </a>
			                    <div class="delBtn">
			                        <button type="button" class="btn btn-danger" onclick="deleteBookmark(this,${sbm.bmNo})">삭제</button>
			                    </div>
			                </li>
            			</c:when>
            		</c:choose>
            	</c:forEach>
                
            </ul>
        </div>
        	

        <div class="warningMark1" style="display: none;">
        	<span class="material-symbols-outlined" style="font-size: 70px;">
				error
			</span>
        </div>
        <div class="noMsg1" style="display: none;">아직 찜한 목록이 없습니다.</div>

        <div class="paging">
            <!-- <a href="#"><span class="material-symbols-outlined" style="font-size: 30px;">
                chevron_left
                </span>
            </a>
            <a href="#"><span>1</span></a>
            <a href="#"><span>2</span></a>
            <a href="#"><span>3</span></a>
            <a href="#"><span class="material-symbols-outlined"  style="font-size: 30px;">
                chevron_right
                </span></a>  -->
               ${pageNavi }
        </div>
        </c:otherwise>
        </c:choose>
    </div>
    
     
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <script type="text/javascript">
    	function deleteBookmark(obj, bmNo){
    		console.log("야임마!!");
    		if(confirm("삭제하시겠습니까?")){
    			$.ajax({
    				url : "/deleteStoreBookMarkNo.do",
    				type : "post",
    				data : {bmNo : bmNo},
    				success : function(data){
    					console.log(data);
    					$(obj).parent().parent().remove();
    					console.log($(".list").length);
    					if($(".list").length == 0){
    						$(".bookmark-content-list").hide();
    						$(".warningMark1").css("display", "block");
    						$(".noMsg1").css("display", "block");
    						$(".noMsg1").show();
    						console.log($(".noMsg1").text());
    						$(".paging").hide();
    						
    					}
    				}
    			})
    		}else{
    			console.log($(obj).text());
    		}
    		
    	}
    </script>
</body>
</html>




















