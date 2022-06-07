<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
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
#container {
	margin: auto;
	background-color: antiquewhite;
	width: 900px;
	
}

.modal-content{
text-align: left;}
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
/* 평점, 리뷰등록 */
#divWrite {
	display: none;
}

.form-control[readonly] {
	background-color: transparent;
}

#t_r_grade {
	display: none;
}

.r_grade_box {
	font-size: 12px;
}

.btnWrite {
	background-color: rgb(197, 192, 192);
}

/* 별점 Write */
.star-rating {
	/* border: solid 1px #ccc; */
	display: inline-flex;
	flex-direction: row-reverse;
	font-size: 1.2em;
	justify-content: space-around;
	padding: 0 .2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	color: #ccc;
	cursor: pointer;
}

.star-rating :checked ~label {
	color: rgb(0, 0, 0);
}

.star-rating label:hover, .star-rating label:hover ~label {
	color: #fc0;
}

/* -----------------------------------------------------------*/
/* 리플 박스 */
#btnLikeUp2 {
	display: none;
}

#btnHateUp2 {
	display: none;
}

.reply_box {
	background-color: white;
	border-radius: 10px;
}

.btnModify {
	border: none;
}

.Profile {
	margin: auto;
	background-color: rgb(165, 162, 162);
	width: 70px;
	height: 70px;
	border-radius: 35px;
}

.content-reply {
	border: none;
}

/* 좋아요 라운드 */
.like_round {
	background-color: rgb(197, 192, 192);
	height: 30px;
	border-radius: 15px;
}

/* 별점 reply */
#r_grade_star2 {
	display: none;
}

.reply-star-rating1 {
	/* border: solid 1px #ccc; */
	display: inline-flex;
	flex-direction: row-reverse;
	font-size: 1.1em;
	justify-content: space-around;
	padding: 0 em;
	text-align: center;
	width: em;
}

.reply-star-rating {
	/* border: solid 1px #ccc; */
	display: inline-flex;
	flex-direction: row-reverse;
	font-size: 1.1em;
	justify-content: space-around;
	padding: 0 em;
	text-align: center;
	width: em;
}

.reply-star-rating1 #r_star {
	color: #ccc;
}

.reply-star-rating input {
	display: none;
}

.reply-star-rating label {
	color: #ccc;
	cursor: pointer;
}

.reply-star-rating :checked ~label {
	color: rgb(0, 0, 0);
}

.reply-star-rating label:hover, .reply-star-rating label:hover ~label {
	color: #fc0;
}
</style>
</head>

<body>

	<div id="container">

		<div id="content-box">
			<div class="row">
				<div class="col">
					<h4>제목 : ${dto.p_title}</h4>

				</div>
			</div>

			<div class="row">
				<div class="col-2"><span>닉네임:</span>${dto.user_nickname }</div>
				<div class="col-6"></div>
				<div class="col-4">${dto.p_date },<span>조회수:</span>${dto.p_view_count}</div>
			</div>
			<div class="row">
				<div class="col-8"><span>글번호:</span>${dto.seq_post }</div>
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
				<div class="col" id="content"><strong>내용:</strong>${dto.p_content }</div>
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
													location.href = "/deleteProc.po?seq_post=${dto.seq_post}";
												}
											})
						</script>
					</c:if>
				</div>
			</div>

		</div>
		<!-- 게시글영역 끝 -->
		<br /> <br /> <br />

		<!-- 	댓글 출력 영역 -->
		<div id="input-box">
			<!-- 댓글 입력 영역 -->
			<form id="formReply" name="formReply">
				<div class="row footer-reply p-2 align-items-center">
					<div class="col d-none">
						<input type="text" value="${dto.seq_post}" name="seq_post">
					</div>
					<div class="col-10">
						<textarea id="inputReply" class="form-control"
							name="comment_content" placeholder="댓글을 입력해주세요."></textarea>
					</div>
					<div class="col-2">
						<button type="button" class="btn btn-success" id="btnSubmitReply">등록</button>
					</div>
				</div>
			</form>
			<!-- 댓글 입력 영역끝 -->
		</div>
		<br /> <br />
		<div class="comment-box">
			<div class="row body-reply p-3">
				<c:if test="${empty post_commentList}">
					<%--등록된 댓글이 없다면 --%>
					<div class="col-12">
						<p class="text-center">등록된 댓글이 없습니다.</p>
					</div>
				</c:if>

				<%--댓글이 있다면--%>

				<c:if test="${not empty post_commentList}">
					<c:forEach items="${post_commentList}" var="post_comment">
						<from id="like_comentForm" action="/modify.po" method="post">
						<div class="container">
							<div class="row pt-4">

								<!-- 코멘트,댓글 -->
								<div class="col reply_box">
									<!-- 댓글 출력 -->
									<div class="row">
										<div class="col-2 text">
											<!-- 프로필 -->
											<div class="Profile text-center mt-2">프로필</div>
										</div>

										<div class="col-10">
											<div class="row mb-1">
												<div class="col-10 ms-2">${post_comment.user_nickname}</div>
												<div class="col-1 mt-1 text-end r_report">
													<!--report 모달창  -->
													<button type="button" class="btn btn-report"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@getbootstrap"
														style="background-color: white; border: none;">
														<img src="resources/images/report.png" height="80%">
														<input id="seqReport" value=${post_comment.seq_post_comment} style="display:none;">
													</button>
													<div class="modal fade" id="exampleModal" tabindex="-1"
														aria-labelledby="exampleModalLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<form id="reportForm">
																	<div class="modal-header">
																		<h5 class="modal-title" id="exampleModalLabel">Report</h5>
																		<button type="button" class="btn-close"
																			data-bs-dismiss="modal" aria-label="Close"></button>
																	</div>
																	<div class="modal-body">

																		<div class="mb-3">
																			<label for="message-title" class="col-form-label">Title:</label>
																			<input type="text" class="form-control"
																				id="message-title" name="rp_title"/>
																		</div>
																		<div class="mb-3">
																			<label for="message-text" class="col-form-label">Message:</label>
																			<textarea class="form-control" id="message-text" name="rp_content"> </textarea>
																		</div>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary"
																			data-bs-dismiss="modal">Close</button>
																		<button id="sendMessage" type="button"
																			class="btn btn-primary">Send message</button>
																	</div>
																</form>
															</div>
														</div>
														<div></div>
													</div>
												</div>
											</div>

											<div class="row body-post_comment">
												<div class="col-10">
													<textarea id="" class="form-control content-reply ps-2"
														name="comment_content" placeholder="댓글내용" readonly>${post_comment.comment_content}</textarea>
												</div>

												<!-- 수정,삭제버튼 -->
												<div class="col-2 ps-3">

													<div class="col" id="divWrite">
														<button type=submit class="btn mt-2 btnSave" id="btnSave"
															value="${post_comment.seq_post_comment}">등록</button>
													</div>

													<div class="dropdown" id="modify_box">

														<button type="button" class="btn btnModify" id=""
															data-bs-toggle="dropdown" aria-expanded="true">
															<img src="resources/images/hate.png" width="50%;">
														</button>
														<ul class="dropdown-menu"
															aria-labelledby="dropdownMenuButton1">
															<li><button
																	class="dropdown-item modify-post_comment"
																	value="${post_comment.seq_post_comment}">수정</button></li>
															<li><button
																	class="dropdown-item delete-post_comment"
																	value="${post_comment.seq_post_comment}">삭제</button></li>
														</ul>
													</div>
												</div>
											</div>

											<div class="row mt-1 likeBox">
												<div class="col-lg-7 col-md-5 ms-2">${post_comment.comment_date}</div>

												<div class="row col-lg-2 col-md-3 m-1 like_round">
													<div class="col-4 m-0">
														<input type="image" id="btnLikeUp" class=""
															value="${post_comment.seq_post_comment}"
															src="resources/images/likebefore.png"> <input
															type="image" id="btnLikeUp2" class=""
															value="${post_comment.seq_post_comment}"
															src="resources/images/like.png">
													</div>
													<div class="col m-0">
														<span class="">123</span>
													</div>
												</div>
												<div class="row col-lg-2 col-md-3 m-1 like_round">
													<div class="col-4 m-0">
														<input type="image" id="btnHateUp" class="mt-1"
															value="${post_comment.seq_post_comment}"
															src="resources/images/hatebefore.png" height="65%">
														<input type="image" id="btnHateUp2" class="mt-1"
															value="${post_comment.seq_post_comment}"
															src="resources/images/hate.png" height="65%">
													</div>
													<div class="col m-0">
														<span class="">123</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</from>
					</c:forEach>
				</c:if>
			</div>
			<!-- 댓글 출력 영역 끝-->

		</div>
		<!-- 댓글 영역 끝 -->
		<!-- 하단 버튼 영역 -->
		<div class="container container-footer">
			<div class="row justify-content-center">
				<div class="col-2">
					<button type="button" class="btn btn-secondary" id="btnBack">뒤로가기</button>
				</div>
				
			</div>
		</div>
	</div>
	<script>
			//싫어요 좋아요버튼 post
			$("#p_likebefore").on("click",function(e){
				let seq_post = "${dto.seq_post}";
				$.ajax({
					url : "/pLike.po?seq_post="+ seq_post,
					type : "get",			
					success : function(data) {
							if(data==="true"){
								console.log("좋아요 성공")
							}else{
								console.log("좋아요 실패")
							}
					},
					error : function(e) {
						console.log(e);
					}
				})
			})

			//모달 입력후 메세지 보냈을경우
			$("#sendMessage").on("click",function(e) {
				
				let seq_post = "${dto.seq_post}";
						let seq_post_comment=$("#seqReport").val()
						//  $("#message").val($("#message-text").val());
						if ($("#message-title").val() === ""
								|| $("#message-text").val() === "") {
							alert("제목과 메세지를 제대로 입력하지 않았습니다.");
							return;
						}
					
						let rp_title =$("#message-title").val();
						let rp_content =$("#message-text").val();
						let data = $("#reportForm").serialize();
						console.log(rp_title);
						console.log(rp_content);
						console.log(data);
						$.ajax({
							url : "/report.co",
							type : "post",	
							data : {
								seq_post: seq_post,
								seq_post_comment : seq_post_comment,
								rp_title : rp_title,
								rp_content : rp_content
							},	
							success : function() {
								$("#exampleModal").modal('hide');
								
							},
							error : function(e) {
								console.log(e);
							}
						})

					});
		
		$(".btn-report").on("click", function() {
			/*모달 스크립트  */
			var exampleModal = document.getElementById("exampleModal");
			exampleModal.addEventListener("show.bs.modal", function(event) {
				// Button that triggered the modal
				var button = event.relatedTarget;
				// Extract info from data-bs-* attributes
				var recipient = button.getAttribute("data-bs-whatever");
				// If necessary, you could initiate an AJAX request here
				// and then do the updating in a callback.
				//
				// Update the modal's content.
				var modalTitle = exampleModal.querySelector(".modal-title");
				var modalBodyInput = exampleModal
						.querySelector(".modal-body input");

				modalTitle.textContent = "Report";
		})
		});
		// 댓글 수정 버튼에게 이벤트 부여
		$(".body-reply").on(
				"click",
				".modify-reply",
				function(e) {
					$(e.target).parent(".body-btnDefault-reply").css("display",
							"none"); // 수정삭제 버튼 감추기
					$(e.target).parent().next(".body-btnAfter-reply").css(
							"display", "block"); // 취소완료 버튼 보이기
					// 댓글 수정가능하게끔 readonly 속성 풀어주기 
					$(e.target).parent(".body-btnDefault-reply").prev()
							.children("textarea").attr("readonly", false);
					$(e.target).parent(".body-btnDefault-reply").prev()
							.children("textarea").focus();
				});

		// 댓글 수정 완료 버튼을 눌렀을때
		$(".body-reply").on(
				"click",
				".complete-reply",
				function(e) {
					// 수정한 내용 (textarea value)
					// 수정한 댓글의 seq (seq_reply)
					// 게시글의 seq (seq_board)
					let seq_reply = $(e.target).val();
					let seq_post = "${dto.seq_post}";
					// 부모의 형제(위쪽으로)요소 중 body-content-reply를 선택하는데 그 중 가장 첫번째 요소 선택
					let content = $(e.target).parent(".body-btnAfter-reply")
							.prevAll(".body-content-reply").first().children(
									"textarea").val();

					$.ajax({
						url : "/modifyProc.co",
						type : "post",
						data : {
							seq_post_comment : seq_post_comment,
							seq_post : seq_post,
							comment_content : comment_content
						},
						success : function(data) {
							console.log(data);
							if (data === "fail") {
								alert("댓글 수정에 실패했습니다.");
							} else {
								refreshMemList();
							}
						},
						error : function(e) {
							console.log(e);
						}
					})
				});

		// 댓글 취소 버튼에게 이벤트 부여
		$(".body-reply").on("click", ".cancel-reply", function(e) {
			let seq_post = "${dto.seq_post}";
			$.ajax({
				url : "/getPostComment.co?seq_post=" + seq_post,
				type : "get",
				success : function(data) {
					refreshMemList();
				},
				error : function(e) {
					console.log(e);
				}
			})

		});

		// 댓글 삭제 버튼에게 이벤트 부여
		$(".body-reply").on("click", ".delete-reply", function(e) {
			let answer = confirm("댓글을 정말 삭제하시겠습니까?");
			if (answer) {
				let seq_reply = $(e.target).val();

				$.ajax({
					url : "/deleteProc.co",
					type : "post",
					data : {
						seq_post_comment : seq_post_comment,
						seq_post : "${dto.seq_post}"
					},
					success : function(data) {
						console.log(data);

						if (data === "fail") {
							alert("댓글 삭제에 실패했습니다.");
						} else { // 댓글 삭제에 성공했다면 댓글 목록을 새롭게 다시 뿌려줌
							refreshMemList();
						}
					},
					error : function(e) {
						console.log(e);
					}

				})
			}
		});

		// 댓글 등록
		$("#btnSubmitReply").on("click", function() {
			if ($("#inputReply").val() === "") { // 댓글 입력창이 비어있다면
				alert("입력된 댓글이 없습니다.");
				return;
			}

			// ajax를 이용해서 form 전송
			let data = $("#formReply").serialize(); //전송할 수 있는 데이터로 변환
			console.log(data);
			$("#inputReply").val("");

			$.ajax({
				url : "/insert.co",
				type : "post",
				data : data
				// 만약 서버에서 응답해주는 값이 일반 text일 수도 있고
				// json 형식일 수도 있다면 dataType을 명시하지 않는다.
				,
				success : function(rs) {
					console.log(rs);
					if (rs === "fail") { // 댓글등록에 실패했거나
						alert("댓글 등록에 실패했습니다.");
					} else { // json형식의 데이터가 넘어오거나(댓글리스트)
						refreshMemList();
					}
				},
				error : function(e) {
					console.log(e);
				}
			})

		})

		function refreshMemList() {
			location.reload();
		}
		$("#btnBack").on("click", function() {
			location.href = "/post.po?curPage=1";
		});
	</script>



</body>
</html>
