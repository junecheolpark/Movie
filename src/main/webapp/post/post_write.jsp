<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%> 
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote-lite.css">	

	
<style>
#submit {
	border-radius: 13px;
	width: 70px;
	height: 40px;
}

.container {
	margin: auto;
	margin-top: 30px;
}

</style>
</head>
<body>
	<div class="container">
		<form action="/writeProc.po" id="writeForm" method="post">
			<div class="row">
				<div class="col">
					<h2>게시글 작성</h2>
					<hr />
				</div>
			</div>
			<div class="row">
				<div class="col-10">
					<input type="text" class="form-control" id="title" name="title"
						placeholder="제목을 입력해 주세요." />
				</div>
				<div class="col-2">
					<button type="submit" id="submit" class="btn btn-primary">
						제출</button>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col">
					<div id="summernote" name="summernote"></div>
				</div>
			</div>
			<input style="" type="text" id="content" name="content">
		</form>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>
	<script>
		$(document).ready(function() {
			$("#summernote").summernote();
		});
		
		$('#summernote').summernote(
				{
					
					height : 400, // 에디터 높이
					minHeight : null, // 최소 높이
					maxHeight : null, // 최대 높이
					fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
					fontNamesIgnoreCheck : [ '맑은고딕' ],
					focus : true, // 에디터 로딩후 포커스를 맞출지 여부
					lang : "ko-KR", // 한글 설정
					resize: false ,
					placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
					callbacks: {
						onImageUpload: function(files, editor, welEditable) {
				            for (var i = files.length - 1; i >= 0; i--) {
				            	sendFile(files[i], this);
				            }
				        }
					}
			})
		function sendFile(file, el) {
		var form_data = new FormData();
      	form_data.append('file', file);
      	$.ajax({
        	data: form_data,
        	type: "POST",
        	url: './profileImage.mpf',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(img_name) {
          		$(el).summernote('editor.insertImage', img_name);
        	}
      	});
    }


		
	$("#submit").on("click",function(){
		
	console.log($('#summernote').summernote('code'));
		$("#content").val($('#summernote').summernote('code'));
		
	})
	</script>
</body>
</html>




