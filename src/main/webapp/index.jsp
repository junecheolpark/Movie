<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

	<button id="btnPost" type="button">게시판</button>
	<script>
		$("#btnPost").on("click",function(){
			location.href="/post.po?curPage=1";
		})
	</script>

    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script
            src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
            crossorigin="anonymous"></script>
</head>
<body>
<button id="test">test</button>
<button id="test2">test2</button>

</body>
<script>
    $("#test").on("click", function (){
        location.href = "/listLookup.movie?curPage=1";
    })
    $("#test2").on("click", function (){
        location.href = "/test.movie";
    })
</script>
</html>