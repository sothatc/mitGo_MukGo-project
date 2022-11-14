<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
.marketProduct {
	padding-left: 20px;
	width: 848px;
}

.marketProduct-wrap {
	width: 100%;
}

.marketProductTitle {
	margin-top: 50px;
}

hr {
	background: gainsboro;
	height: 1px;
	border: 0;
	margin-bottom: 50px;
}

#marketProductForm {
	margin: 0 auto;
}

#marketProductForm input {
	box-sizing: border-box;
	width: 100%;
	height: 30px;
	margin: 20px 0 20px 0;
	border: 0;
	border-bottom: 2px solid gainsboro;
}

#marketProductForm input:focus {
	outline: none;
	border-bottom: 2px solid #000;
}

.btnWrap {
	text-align: center;
	margin-bottom: 50px;
}

.btnWrap>button {
	display: inline-block;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
	user-select: none;
	border: 1px solid transparent;
	padding: 0.375rem 0.75rem;
	font-size: 0.9375rem;
	line-height: 1;
	border-radius: 0.1875rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	margin-right: 10px;
	height: 40px;
	width: 100%;
	margin-top: 30px;
	border: 1px solid rgb(51, 51, 51);
	background-color: rgb(51, 51, 51);
	color: #fff;
}

.btnWrap>button[type=submt] {
	border: 1px solid rgb(51, 51, 51);
	background-color: rgb(51, 51, 51);
	color: #fff;
}

.btnWrap>button[type=submit]:hover {
	cursor: pointer;
	background-color: #fff;
	color: rgb(51, 51, 51);
}

.inputPhoto {
	width: 100%;
	height: 50px;
	border: 1px dashed gray;
	background-color: transparent;
}

.inputPhoto:hover {
	cursor: pointer;
	background: rgb(51, 51, 51);
	color: #fff;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<link rel="stylesheet" href="/resources/css/member/owner.css">
	<div class="content-wrap">
		<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp" />
		<article id="content" class="content">
			<div class="marketProduct" style="display: flex;">
				<div class="marketProduct-wrap">
					<div class="marketProductTitle">
						<h1>상품 수정</h1>
					</div>
					<hr>
					<br>
					<form class="mb-3" id="marketProductForm" method="post" action="/updateMarketProduct.do" enctype="multipart/form-data">
						<div>
							<label for="inputName">상품 이름을 입력해주세요</label>
							<input type="text" id="inputName" name="pName" placeholder="예) 믿고먹고 상품" value="${ma.PName }" required oninvalid="this.setCustomValidity('상품명을 입력하세요')" oninput="this.setCustomValidity('')">
						</div>
						<div>
							<label for="inputCategory">카테고리를 선택해주세요</label>
							<br>
							<select class="form-control" id="inputCategory" name="pCategory" required oninvalid="this.setCustomValidity('카테고리를 선택하세요')" oninput="this.setCustomValidity('')">
								<option value="" hidden="" disabled="disabled" selected="selected">상품 카테고리를 선택하세요</option>
								<option value="10">밀키트</option>
								<option value="8">디저트</option>
								<option value="11">냉동식품</option>
								<option value="9">기타</option>
							</select>
						</div>
						<br>
						<div>
							<label for="inputPrice">가격을 입력해주세요</label>
							<input type="number" id="inputPrice" name="pPrice" value="${ma.PPrice }" placeholder="예) 1,000원 → 1000" required oninvalid="this.setCustomValidity('가격을 입력하세요')" oninput="this.setCustomValidity('')">
							<span class="comment" style="font-size: 12px; padding-left: 10px;"></span>
						</div>
						<div>
							<label for="inputName">알러지 정보를 입력해주세요</label>
							<input type="text" id="inputallergyInfo" name="allergyInfo" placeholder="본 제품은 돼지고기, 닭고기, 우유, 계란을 사용한 제품과 같은 제조시설에서 제조하고 있습니다." value="${ma.allergyInfo }" required oninvalid="this.setCustomValidity('알러지 정보를 입력하세요')" oninput="this.setCustomValidity('')">
						</div>
						<div>
							<label for="inputName">유통기한 정보를 입력해주세요</label>
							<input type="text" id="expiryDate" name="expiryDate" placeholder="수령일 포함 최소 3일 남은 제품을 보내드립니다." value="${ma.expiryDate }" required oninvalid="this.setCustomValidity('유통기한 정보를 입력하세요')" oninput="this.setCustomValidity('')">
						</div>
						<div>
							<label for="textarea">상품을 설명해주세요</label>
							<br>
							<textarea class="form-control" name="pContent" id="textarea" rows="4" required oninvalid="this.setCustomValidity('상세설명을 입력하세요')" oninput="this.setCustomValidity('')" style="margin: 10px 0;">${ma.PContent }</textarea>
						</div>
						<div>
							<input type="hidden" id="selectedCategory" value="${ma.PCategory }">
							<input type="hidden" name="pNo" value="${ma.PNo }">
							<input type="hidden" name="storeNo" value="${sessionScope.s.storeNo }">
							<input type="hidden" name="ownerNo" value="${sessionScope.o.ownerNo }">
							<input type="file" name="file" class="file-upload" id="file" style="display: none;" accept="image/gif, image/jpg, image/jpeg, image/png">
							<button class="inputPhoto" type="button" id="inputPhoto" onclick="updatePImg(this)">${ma.PImg }</button>
							<input type="hidden" id="thumbnail" name="pImg" value="${ma.PImg }">
						</div>
						<div class="btnWrap">
							<button type="submit" id="submitBtn" value="수정">수정</button>
						</div>
					</form>
				</div>
			</div>
		</article>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		function updatePImg(obj) {
			var file = $(obj).parent().find('.file-upload');
			file.trigger('click');
		}

		$('.file-upload').on('change', function() {
			if ($(this).val() == '') {
				$(this).parent().find('.inputPhoto').text('썸네일을 반드시 올려주세요.');
			} else {
				$(this).parent().find('.inputPhoto').text($(this).val().replace(/C:\\fakepath\\/i, ''));
			}
			const thumbnail = $("#thumbnail");
			thumbnail.val($(this).val().replace(/C:\\fakepath\\/i, ''));
		});

		$("#submitBtn").on('click', function(event) {
			const fileValue = $('.inputPhoto').text();
			if (fileValue == '썸네일 첨부하기') {
				event.preventDefault();
				alert("사진을 첨부해주세요.");
			}
		});

		$("[name=pContent]").summernote({
			height : 400,
			lang : "ko-KR",
			callbacks : {
				onImageUpload : function(files) {
					uploadImage(files[0], this);
				}
			}
		});

		function uploadImage(files, editor) {
			// <form>태그와 똑같은 기능을 하는 변수
			const form = new FormData();
			form.append("files", files);

			$.ajax({
				url : "/marketEditorUpload.do",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function(data) {
					$(editor).summernote("insertImage", data);
				}
			});
		}

		$(function() {
			const selectedCategory = $("#selectedCategory").val();
			$("#inputCategory").val(selectedCategory);
		});
	</script>
</body>
</html>