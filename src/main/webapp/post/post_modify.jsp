<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<style>
#content-box {
	background-color: rgb(255, 254, 248);
	height: 500px;
	width: 800px;
	margin: auto;
	margin-top: 50px;
	border-radius: 15px;
}

#input-box {
	width: 800px;
	margin: auto;
}

#comment_post {
	margin: auto;
	width: 600px;
	height: 80px;
	border-radius: 10px;
	resize: none;
}

.comment-box {
	margin: auto;
	margin: 20px
}

#submit {
	width: 70px;
	height: 70px;
	border-radius: 10px;
}

#content {
	height: 400px;
}

.comment-text {
	height: 60px;
}

#profile {
	width: 80px;
	height: 80px;
}

#text {
	height: 40px;
}

#hate {
	width: 25px;
	height: 25px;
}

#like {
	width: 30px;
	height: 30px;
}

#report {
	width: 40px;
	height: 30px;
}

div {
	border: 1px solid black;
}

.click {
	background-color: rgb(211, 209, 209);
	border-radius: 20px;
	margin: 4px;
}

#user-box {
	text-align: center;
	width: 150px;
	margin: auto;
}

/* 댓글 스타일  */




</style>
</head>

<body>

	<div id="container">

		<div id="content-box">
			<div class="row">
				<div class="col">
				<input name="title" class="form-control" id="title" value="${dto.p_title}"/>
					

				</div>
			</div>

			<div class="row">
				<div class="col-2">${dto.user_nickname }</div>
				<div class="col-7"></div>
				<div class="col-3">${dto.p_date },${dto.p_view_count}</div>
			</div>
			<div class="row">
				<div class="col-8">${dto.seq_post }</div>
				<div class="col">
					<div class="row">
						<div class="col-5 click">
							<button id="p_likebefore"><img src="resources/images/likebefore.png" alt="좋아요" id="like" /></button>
							<button id="p_like" style="display:none;"><img src="resources/images/like.png" alt="좋아요" id="like" /></button>
							
						</div>
						<div class="col-5 click">
						<button id="p_hatebefore"><img src="resources/images/hate.png" alt="싫어요" id="hate" /></button>
							<button id="p_hate" style="display:none;"><img src="resources/images/hate.png" alt="싫어요" id="hate" /></button>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col" id="content">
					<textarea style="height:95%; border-radius:15px" class="form-control" value=${dto.p_content}></textarea>
				
				</div>
			</div>


			<!-- 수정 버튼영역 -->
			<div id="user-box">
				<div class="row">
					<c:if test="${loginSession.user_id eq dto.user_id}">
						<div class="col-6">
							<button type="button" class="btn btn-warning" id="btnModify">수정</button>
						</div>
						<div class="col-6">
							<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
						</div>

						<script>
							$("#btnModify")
									.on(
											"click",
											function() { // 수정 페이지 요청
												location.href = "/modify.po?seq_post=${dto.seq_post}";
											});
							$("#btnDelete")
									.on(
											"click",
											function() { // 삭제 요청
												let answer = confirm("지금 삭제하시면 복구가 불가합니다. 정말 삭제하시겠습니까?");
												console.log(answer);
												if (answer) {
													location.href = "/deleteProc.co?seq_post=${dto.seq_post}";
												}
											})
						</script>
					</c:if>
				</div>
			</div>

		</div>
		<!-- 게시글영역 끝 -->
		<br /> <br /> <br />
	<script>
		$("#btnComplete").on("click", function() {
			// 만약 제목을 입력하지 않았다면 title "제목없음" 이라는 타이틀 값을 넣어줌.
			if ($("#title").val() === "") {
				$("#title").val("제목없음");
			}
			// 내용이 비어있으면 내용을 입력하세요.
			if ($("#content").val() === "") {
				alert("내용을 입력하세요.");
				$("#content").focus();
				return;
			}
			$("#modifyForm").submit();
		})
	</script>
</body>
</html>