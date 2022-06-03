<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	예비 인덱스
	<button id="btnPost" type="button">게시판</button>
	<script>
		$("#btnPost").on("click",function(){
			location.href="/post.po?curPage=1";
		})
	</script>
</body>
</html>