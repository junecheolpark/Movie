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
<button id="test">test</button>
<button id="test2">test2</button>

</body>
<script>
    $("#btnPost").on("click", function () {
        location.href = "/post.po?curPage=1";
    })
    $("#test").on("click", function () {
        location.href = "/listLookup.movie?curPage=1";
    })
    $("#test2").on("click", function () {
        location.href = "/test.movie";
    })
</script>
</html>