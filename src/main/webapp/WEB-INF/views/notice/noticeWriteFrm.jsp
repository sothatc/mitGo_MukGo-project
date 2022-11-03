<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/noticeWrite.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
	.fileList>div{
		width: 500px;
		margin: 0 auto;
		text-align: left;
		position: relative;
	}
	
	.deleteBtn{
		position: absolute;
		right: 20px;
	}
	
	.note-modal-content{
		height: 370px
	}
	
	.note-modal-footer{
		margin-top: 50px;
		margin-right: 15px;
	}
</style>
</head>
<body>
	<script src="/resources/summernote/summernote-lite.js"></script>
   	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
   	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
   	
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
    </div>

    <div class="notice-write-wrap">
        <div class="notice-write-title">
            <h1>공지사항 작성</h1>
        </div>

        <div class="require-sign">
            <span>*필수입력</span>
        </div>

        <div class="notice-write-frm">
            <form action="/insertNoticeWrite.do" id="noticeFrm" method="post" enctype="multipart/form-data">
                <table class="notice-tbl">
                    <tr style="height: 70px; border-bottom: 1px solid rgba(224, 224, 224, 0.7);">
                        <th>*제목</th>
                        <td style="width: 700px;">
                            <input class="w3-input w3-border w3-round-large" name="noticeTitle" type="text" style="width: 630px; margin: 0 auto;">
                        </td>
                    </tr>

                    <tr style="height: 70px; border-bottom: 1px solid rgba(224, 224, 224, 0.7);">
                        <th>*작성자</th>
                        <td style="width: 700px;">
                        <input type="hidden" name="noticeWriter" value="${sessionScope.m.memberId }">
                            ${sessionScope.m.memberName }
                        </td>
                    </tr>

                   <!--  <tr style="height: 70px; border-bottom: 1px solid rgba(224, 224, 224, 0.7);">
                        <th>*분류</th>
                        <td>
                            <select class="form-select" aria-label="Default select example" style="width: 300px; text-align: center; margin: 0 auto;">
                                <option value="예약문의">예약문의</option>
                                <option value="마켓문의">마켓문의</option>
                                <option value="기타문의">기타문의</option>
                            </select>
                        </td>
                    </tr>  -->
                    
                    <tr style="height: 70px; border-bottom: 1px solid rgba(224, 224, 224, 0.7);">
                        <th>첨부파일(최대 5개)</th>
                        <td style="width: 700px;">
                            <label for="file">
                                <div class="btn-upload">파일 업로드하기</div>
                            </label>
                            <input type="file" name="noticeFile" id="file" multiple>
                        </td>
                    </tr>
                    
                    <tr style="height: 70px; border-bottom: 1px solid rgba(224, 224, 224, 0.7); display: none;" class="fileListTr">
                    	<th>첨부파일목록</th>
                    	<td style="width: 700px;">
                    		<div class="fileList">
                    			
                    		</div>
                    	</td>
                    </tr>
                    
                    <tr style="height: 400px;">
                        <th style="vertical-align: top; padding-top: 30px;">*내용</th>
                        <td style="text-align: left;">
                            <div class="form-floating" style="padding-top: 30px; padding-bottom: 30px">
                                <textarea class="form-control" name="noticeContent" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 340px"></textarea>
                                
                            </div>
                        </td>
                    </tr>
                </table>

                <div class="notice-write-btn">
                    <button type="button" class="btn btn-outline-secondary" onclick="goNoticeList()">취소</button>
                    <button type="button" class="btn btn-secondary" id="noticeWriteBtn" onclick="noticeWrite()">작성하기</button>
                </div>
            </form>
        </div>
    </div>

    <script>
    	
    
    	const fileZone = $(".fileList");
    	const span = $("<span>");
    	
    	const filesGo = new Array();
    	
    	$("#file").on("change", function(){
    		
    		const fileList = $("#file")[0].files;
    		console.log(fileList);
    		
    		if(fileList.length > 5){
				alert("파일은 최대 5개까지만 가능합니다.");
			}else{
				
				for(let i = 0; i < fileList.length; i++){
	    			filesGo.push(fileList[i]);
	    			$(".fileListTr").slideDown();
	    			const fileDiv = $("<div>");
	    			if(filesGo.length > 5){
	    				alert("파일은 최대 5개까지만 가능합니다.");
	    				filesGo.pop();
	    				break;
	    			}
	    			fileDiv.append("<span class=''>" + fileList[i].name + "</span><span class='deleteBtn'>x</span><br>");
	    			fileZone.append(fileDiv);
	    		}
				
	    		$(".deleteBtn").attr("onclick", "deleteFile(this)");
	    		console.log(filesGo.length);
			}
    		
    		
    	});
    	
    	function deleteFile(obj){
    		const delFile = $(obj).prev().text();
    		
    		for(let i = 0; i < filesGo.length; i++){
    			if(filesGo[i].name == delFile){
    				filesGo.splice(i, 1);
    				break;
    			}
    		}
    		
    		if(filesGo.length == 0){
    			$(".fileListTr").slideUp();
    			
    		}
    		
    		$(obj).parent().remove();
    		
    		console.log(filesGo.length);
    		
    	}
    	
    	$("[name=noticeContent]").summernote({
    		height : 400,
    		lang : "ko-KR",
    		callbacks : {
    			onImageUpload : function(files){
    				uploadImage(files[0], this);
    			}
    		}
    	});
    	
    	function uploadImage(files, editor){
    		// <form>태그와 똑같은 기능을 하는 변수
    		const form = new FormData();
    		form.append("files", files);
    		
    		$.ajax({
    			url : "/noticeEditorUpload.do",
    			type : "post",
    			data : form,
    			processData : false,
    			contentType : false,
    			success : function(data){
    				$(editor).summernote("insertImage", data);
    				
    				console.log(data);
    			}
    		});
    	}
    
        function goNoticeList(){
            location.href="/selectNoticeList.do?reqPage=1";
        }

        function noticeWrite(){
            if($("[name=noticeTitle]").val() == ""){
                alert("제목을 입력하세요.")
            }else if($("#floatingTextarea2").val() == ""){
                alert("내용을 입력하세요.");
            }else{
                $("#noticeWriteBtn").attr("type", "submit");
            }
        }
        
    </script>
</body>
</html>