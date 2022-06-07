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

<style>
btn {
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
		<form action="/modifyProc.po" id="writeForm" method="post">
			<div class="row">
				<div class="col">
					<h2>게시글 작성 </h2>
					<input style="display:none"; id="seq_post" name="seq_post" value=${dto.seq_post }>
					<hr/>
				</div>
			</div>
			<div class="row">
				<div class="col-10">
					<input type="text" class="form-control" id="title" name="p_title"
						placeholder="제목을 입력해 주세요." value=${dto.p_title}/>
				</div>
				<div class="col-2">
				<button type="button" id="btnBack" class="btn btn-secondary">
						취소</button>
					<button type="submit" id="submit" class="btn btn-warning">
						수정</button>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col">
					<div id="summernote" name="summernote">${dto.p_content}</div>
				</div>
			</div>
			<input style="display:none;" type="text" id="content" name="p_content" >
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
	
	$("#btnBack").on("click",function(){
		location.href="detailPost.po?seq_post="+${dto.seq_post };
	})
	</script>
</body>
</html>




