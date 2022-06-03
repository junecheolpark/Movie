<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<form action="/writeProc.po" id="writeForm" method="post"
			enctype="multipart/form-data">
			<div class="row">
				<div class="col">
					<button type="submit">제출</button>
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
					<button type="button" id="submit" class="btn btn-primary">
						등록</button>
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

	<script>
		$(document).ready(function() {
			$("#summernote").summernote();
		});
		
		$('#summernote').summernote(
				{
					
					height : 400, // 에디터 높이
					minHeight : null, // 최소 높이
					maxHeight : null, // 최대 높이
					focus : true, // 에디터 로딩후 포커스를 맞출지 여부
					lang : "ko-KR", // 한글 설정
					resize: false ,
					placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
				}
				)
				
	$("#submit").on("click",function(){
		$("#content").val($("#(summernote).code())"))
	})
	</script>
</body>
</html>




