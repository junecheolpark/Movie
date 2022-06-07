<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======
<% request.setCharacterEncoding("UTF-8");%> 
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
>>>>>>> 200b674de53675da09a90a49e0f7e676d4c55105
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<<<<<<< HEAD
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- Latest compiled and minified CSS -->
<!-- <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css"
      integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
      crossorigin="anonymous"
    /> -->

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css"
	integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ"
	crossorigin="anonymous" />

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
=======
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

>>>>>>> 200b674de53675da09a90a49e0f7e676d4c55105
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
<<<<<<< HEAD
=======

>>>>>>> 200b674de53675da09a90a49e0f7e676d4c55105
</style>
</head>
<body>
	<div class="container">
<<<<<<< HEAD
		<form action="/" method="post" enctype="multipart/form-data">
=======
		<form action="/writeProc.po" id="writeForm" method="post">
>>>>>>> 200b674de53675da09a90a49e0f7e676d4c55105
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
<<<<<<< HEAD
						등록</button>
=======
						제출</button>
>>>>>>> 200b674de53675da09a90a49e0f7e676d4c55105
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col">
<<<<<<< HEAD
					<div id="summernote" name="summernote">안녕하세요</div>
				</div>
			</div>
		</form>
	</div>
	<script>
		$("#summernote").summernote({
			placeholder : "내용을 작성하세요",
			height : 550,
			maxHeight : 800,
			disableResizeEditor : true,
		});
=======
					<div id="summernote" name="summernote"></div>
				</div>
			</div>
			<input style="" type="text" id="content" name="content">
		</form>
	</div>

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
				        },
				        onPaste: function (e) {
							var clipboardData = e.originalEvent.clipboardData;
							if (clipboardData && clipboardData.items && clipboardData.items.length) {
								var item = clipboardData.items[0];
								if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
									e.preventDefault();
								}
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
        	url: '/SummerNoteImageFile.po',
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
>>>>>>> 200b674de53675da09a90a49e0f7e676d4c55105
	</script>
</body>
</html>




