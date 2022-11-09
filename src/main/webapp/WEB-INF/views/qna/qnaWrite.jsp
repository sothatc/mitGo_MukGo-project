<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/qnaWrite.css">
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
	#secretStatus{
		accent-color: #ffc107;
	}
	.notice-tbl tr>th{
		width:200px;
	}
	
	.fileDiv{
		width: 400px;
		margin: 0 auto;
		text-align: left;
		position: relative;
	}
	
	.delMan{
		position: absolute;
		right: 0px;
	}
	
	.form-control{
		background-color: white;
	}
	
</style>
</head>
<body>
	<script src="/resources/summernote/summernote-lite.js"></script>
      <script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
      <link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
     
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   	
	<div class="notice-write-wrap">
        <div class="notice-write-title">
            <h1>문의하기</h1>
        </div>

        <div class="require-sign">
            <span>*필수입력</span>
        </div>

        <div class="notice-write-frm">
            <form action="/insertQna.do" method="post" enctype="multipart/form-data">
            	
                <table class="notice-tbl">
                    <tr style="height: 70px; border-bottom: 1px solid rgba(224, 224, 224, 0.7);">
                        <th>*제목</th>
                        <td style="width: 700px;">
                            <input class="w3-input w3-border w3-round-large" name="qnaTitle" type="text" style="width: 630px; margin: 0 auto;">
                        </td>
                    </tr>

                    <tr style="height: 70px; border-bottom: 1px solid rgba(224, 224, 224, 0.7);">
                        <th>*작성자</th>
                        <td style="width: 700px;">
                        <input type="hidden" name="qnaWriter" value="${sessionScope.m.memberId }">
                            ${sessionScope.m.memberName }
                        </td>
                    </tr>

                    <tr style="height: 70px; border-bottom: 1px solid rgba(224, 224, 224, 0.7);">
                        <th>*분류</th>
                        <td>
                            <select class="form-select" name="qnaTheme" aria-label="Default select example" style="width: 300px; text-align: center; margin: 0 auto;">
                                <option value="예약문의">예약문의</option>
                                <option value="마켓문의">마켓문의</option>
                                <option value="기타문의">기타문의</option>
                            </select>
                        </td>
                    </tr>

                    <tr style="height: 70px; border-bottom: 1px solid rgba(224, 224, 224, 0.7);">
                        <th>비밀글</th>
                        <td>
                            <input type="checkbox" name="secretStatus" id="secretStatus">
                        </td>
                    </tr>

                    <tr style="height: 70px; border-bottom: 1px solid rgba(224, 224, 224, 0.7);">
                        <th>첨부파일</th>
                        <td style="width: 700px;">
                            <label for="file">
                                <div class="btn-upload">파일 업로드하기</div>
                            </label>
                            <input type="file" name="qnaFile" id="file" multiple>
                        </td>
                    </tr>
                    
                    <tr style="height: 70px; border-bottom: 1px solid rgba(224, 224, 224, 0.7); display: none;" class="fileListTr">
                    	<th>야마모토</th>
                    	<td>
                    		
                    	</td>
                    </tr>

                    <tr style="height: 400px;">
                        <th style="vertical-align: top; padding-top: 30px;">*내용</th>
                        <td style="text-align: left;">
                            <div class="form-floating" style="padding-top: 30px; padding-bottom: 30px">
                                <textarea class="form-control" name="qnaContent" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 340px"></textarea>
                                
                            </div>
                        </td>
                    </tr>
                </table>

                <div class="terms-of-use" style="border-bottom: 1px solid lightgray; padding-top: 20px; padding-bottom: 5px;">
                    <div class="terms-title">
                        <h3>이용약관</h3>
                    </div>
                    <ul>
                        <li style="color: red;">
                            개인의 신상정보(주민번호, 여권번호, 연락처 등)는 가급적 기재를 삼가해 주시기 바랍니다.
                        </li>

                        <li>
                            다음에 해당되는 게시물들에 대해서는 게시판 등록을 금하며, 사전통지 없이 게시물을 수정 또는 삭제할 수 있습니다.
                            <li>
                                사생활침해, 명예훼손, 인신공격의 경우
                            </li>

                            <li>
                                미풍양속저해 및 음란사진이나 음란자료를 담고 있는 경우
                            </li>

                            <li>
                                확인되지 않거나 근거없는 내용일 경우
                            </li>

                            <li>
                                저작권에 위배되는 경우
                            </li>

                            <li>
                                광고 게시물은 어떠한 경우에서든 게시물 삭제 및 서비스정지 처리됩니다.
                            </li>
                        </li>
                    </ul>
                </div>

                <div class="notice-write-btn">
                    <button type="button" class="btn btn-outline-secondary" onclick="goNoticeList()">취소</button>
                    <button type="button" class="btn btn-secondary" id="noticeWriteBtn" onclick="noticeWrite()">작성하기</button>
                </div>
            </form>
        </div>
    </div>

    <script>
    	$(document).ready(function(){
    		$("[name=qnaContent]").summernote({
        		height: 400,
        		lang : "ko-KR",
        		callbacks: {
        			onImageUpload : function(files){
        				uploadImage(files[0], this);
        			}
        		}
        	});
    	});
    	
    	
    	function uploadImage(files, editor){
    		
    		const form = new FormData();
    		form.append("file", files);
    		$.ajax({
    			url : "/uploadImgQna.do",
    			type : "post",
    			data : form,
    			processData : false,
    			contentType : false,
    			success : function(data){
    				$(editor).summernote("insertImage", data);
    				console.log(data);
    			}
    		})
    	}
    	
    	const fileGo = new Array();
    	
    	
    	$("#file").on("change", function(){
    		const files = $("#file")[0].files;
    		
    		if(files.length > 5){
    			alert("파일은 최대 5개까지 올릴 수 있습니다.");
    		}else{
    			$(".fileListTr").slideDown();
    			for(let i = 0; i < files.length; i++){
    				fileGo.push(files[i]);
    				const div = $("<div class='fileDiv'>");
    				if(fileGo.length > 5){
    					alert("파일은 최대 5개까지 가능합니다.");
    					fileGo.pop();
    					break;
    				}
    				
    				div.append("<span class='fileSpan'>" + files[i].name + "</span><span class='delMan' onclick='delFile(this)'>x</span>");
    				$(".fileListTr>td").append(div);
        			console.log(fileGo.length);
    			}
    		}
    	});
    	
    	function delFile(obj){
    		console.log("으악!");
    		const delFileMan = $(obj).prev().text();
    		
    		for(let i = 0; i < fileGo.length; i++){
    			if(fileGo[i].name == delFileMan){
    				fileGo.splice(i, 1);
    				break;
    			}
    		}
    		
    		if(fileGo.length == 0){
    			$(".fileListTr").slideUp();
    		}
    		
    		$(obj).parent().remove();
    		console.log(fileGo.length);
    	}
    	
        
        function goNoticeList(){
            location.href="noticeList.html";
        }

        function noticeWrite(){

            if($("[name=secretStatus]").prop("checked")){
                $("[name=secretStatus]").attr("value", 1);
                console.log($("[name=secretStatus]").val());
            }else{
                $("[name=secretStatus]").attr("value", 0);
                console.log($("[name=secretStatus]").val());
            }

            if($("#noticeTitle").val() == ""){
                alert("제목을 입력하세요.")
                $("#noticeWriteBtn").attr("type", "button");
            }else if($("#floatingTextarea2").val() == ""){
                alert("내용을 입력하세요.");
                $("#noticeWriteBtn").attr("type", "button");
            }else{
                $("#noticeWriteBtn").attr("type", "submit");
            }
        }
    </script>
</body>
</html>