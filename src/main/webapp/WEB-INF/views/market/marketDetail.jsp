<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>GOGO마켓 상세</title>
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
	<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
	<link rel="stylesheet" href="/resources/css/market/marketDetail.css">
	
	<div class="contentWrap">
         <div class="content-wrap1-1">
	            <span class="categorySpan" style="font-family:Gowun Dodum;">##</span>
	            <span class="storeNameSpan" style="font-family:Gowun Dodum;">${ma.PName}</span>
         </div>
         
         <div class="content-wrap1-2">
            <c:choose>
              <c:when test="${!empty sessionScope.m }">
                  <a class="material-symbols-rounded share pointer" id="share" href="javascript:shareMessage()">share</a>
                  <span class="material-symbols-rounded favorite pointer" id="favorite" style="display:none;">favorite</span>
                  <span class="material-symbols-outlined unfavorite pointer" id="unfavorite" style="float:right; margin-top:10px; margin-right:20px;">favorite</span>
               </c:when>
         	</c:choose>
         </div>
	</div> <!-- contentWrap 종료 -->

	<script>

	</script>
</body>
</html>