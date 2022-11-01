<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/faqlist.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
	.noMsg{
		width : 800px;
		margin : 0 auto;
		text-align: center;
		font-size: 35px;
	}
	
	.warningMark{
		width: 800px;
		margin: 0 auto;
		text-align: center;
		
	}
	
	.paging>span{
		display: inline-block;
	    width: 30px;
	    text-decoration: none;
	    font-size: 20px;
	}
</style>
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

            <a href="/"><img src="image/이미지/믿고먹고로고.png" alt=""></a>
        </div>
    </div>

    <div class="faq-wrap">
        <div class="faq-title">
            <h1>자주하는 질문</h1>
        </div>

        <div class="faq-search">
            <form action="/selectSearchFaq.do" method="post">
                <select class="form-select form-select-lg mb-3" name="type" aria-label=".form-select-lg example" style="width: 150px; font-size: 18px; height: 60px; text-align: center;">
                    <option value="titleContent">제목 + 내용</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>

                <input class="w3-input w3-border w3-round-large" type="text" name="keyword" style="width: 500px; height: 60px; margin-left: 10px;">
                <button class="w3-button w3-round-large" style="width: 80px; height: 60px; background-color: rgb(33, 33, 33); color: white;margin-left: 10px;">
                    <span class="material-symbols-outlined">
                    search
                    </span></button>
            </form>
        </div>

        <div class="faq-category">
            <ul>
                <li>
                    <a href="/selectAllFaq.do?reqPage=1" <c:if test="${theme != '예약문의' and theme != '마켓문의' and theme != '기타문의' }">style="color: black;"</c:if>>전체</a>
                </li>
                <li>
                    <a href="/selectThemeFaq.do?faqTheme=예약문의&reqPage=1" <c:if test="${theme == '예약문의' }">style="color: black;"</c:if>>예약문의</a>
                </li>
                <li>
                    <a href="/selectThemeFaq.do?faqTheme=마켓문의&reqPage=1" <c:if test="${theme == '마켓문의' }">style="color: black;"</c:if>>마켓문의</a>
                </li>
                <li>
                    <a href="/selectThemeFaq.do?faqTheme=기타문의&reqPage=1" <c:if test="${theme == '기타문의' }">style="color: black;"</c:if>>기타문의</a>
                </li>
            </ul>
        </div>

        <div class="faq-list">
        	<c:choose>
        		<c:when test="${empty list }">
        			<div class="warningMark">
        				<span class="material-symbols-outlined" style="font-size: 70px;">
							error
						</span>
        			</div>
        			
        			<div class="noMsg">${msg }</div>
        		</c:when>
        		
        		<c:otherwise>
        			<c:forEach items="${list }" var="f">
        			<div class="faq-one">
                <ul class="faq-ul">
                    <li style="font-size: 30px;">
                        Q
                    </li>
                    <li style="font-size: 25px; font-weight: bold;">
                        ${f.faqTheme }
                    </li>
                    <li style="font-size: 20px;">
                        ${f.faqTitle }
                    </li>
                    <li>
                        <span class="material-symbols-outlined" style="font-size: 50px; line-height: 120px; transition-duration: 0.5s;">
                            expand_more
                            </span>
                    </li>
                </ul>

                <div class="faq-answer">
                    <div class="answer-wrap">
                        <span class="answer-mark">A</span>
                        <div class="answer" style="margin-top: 15px;">
                           ${fn:replace(f.faqContent, newLine, "<br>") }
                        </div>
                    </div>

                    <div class="answer-btn">
                        <a href="/updateFaqFrm.do?faqNo=${f.faqNo }">수정</a>
                        <a href="/deleteFaq.do?faqNo=${f.faqNo }">삭제</a>
                    </div>

                </div>
            </div>
			</c:forEach>
            
        		</c:otherwise>
        	</c:choose>
            
        </div>

    </div>
	
    <div class="faq-write-btn">
        <a href="/goFaqFrm.do">글쓰기</a>
    </div>

    <div class="paging">
       <!--  <a href="#"><span class="material-symbols-outlined" style="font-size: 30px;">
            chevron_left
            </span>
        </a>
        <a href="#"><span>1</span></a>
        <a href="#"><span>2</span></a>
        <a href="#"><span>3</span></a>
        <a href="#"><span class="material-symbols-outlined"  style="font-size: 30px;">
            chevron_right
            </span></a> -->
       ${pageNavi }
       
    </div>

    <script>
        $(".faq-ul").on("click", function(event){
            const index = $(".faq-ul").index(this);
            $(".faq-answer").eq(index).slideToggle();
            $(".faq-one .material-symbols-outlined").eq(index).toggleClass("active");
            event.stopPropagation();
        });

        
    </script>
</body>
</html>