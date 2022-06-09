<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <style>


        /*LHbtn 좋아요 싫어요 버튼*/
        .LHbtn {
            background-color: none;
            border: none;
            margin: none;

        }

        #container {
            margin: auto;
            background-color: antiquewhite;
            width: 960px;
            padding-top: 70px;
            border-radius: 15px;
        }

        #content-box {
            text-align: left;
            padding: 20px;
        }

        .modal-content {
            text-align: left;
        }

        #content-box {


            background-color: rgb(255, 254, 248);
            min-height: 500px;
            width: 800px;
            margin: auto;

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
            min-height: 400px;
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

    </style>
</head>

<body>

<div id="container">

    <div id="content-box">
        <div class="row">
            <div class="col">
                <h4>제목 : ${dto.p_title}</h4>

            </div>
            <hr>
        </div>

        <div class="row">
            <div class="col-2">
                <span>닉네임:</span>${dto.user_nickname }</div>
            <div class="col-6"></div>
            <div class="col-4">${dto.p_date },<span>조회수:</span>${dto.p_view_count}</div>
            <hr>
        </div>
        <div class="row">
            <div class="col-8">
                <span>글번호:</span>${dto.seq_post }</div>
            <div class="col">
                <div class="row">
                    <div class="col-5 click">
                        <button class="LHbtn" id="p_likebefore" value=${dto.seq_post }>
                            <img src="resources/images/likebefore.png" alt="좋아요" id="like"/>


                        </button>
                        <button class="LHbtn" id="p_like" style="display: none;" value=${dto.seq_post }>
                            <img src="resources/images/like.png" alt="좋아요" id="like"/>

                        </button>
                        <span id="likeCount-box">${countLike }</span>
                    </div>
                    <div class="col-5 click">
                        <button class="LHbtn" id="p_hatebefore" value=${dto.seq_post }>
                            <img src="resources/images/hatebefore.png" alt="싫어요" id="hate"/>
                        </button>
                        <button class="LHbtn" id="p_hate" style="display: none;" value=${dto.seq_post }>
                            <img src="resources/images/hate.png" alt="싫어요" id="hate"/>
                        </button>
                        <span id="hateCount-box">${countHate }</span>
                    </div>

                </div>
                <script>
                    var arr = null;
                    /* 싫어요  */
                    $("#p_hatebefore").on(
                        "click",
                        function () {
                            $("#countHate").val(${countHate });
                            let seq_post = $("#p_hatebefore").val();
                            console.log(seq_post);
                            $.ajax({
                                url: "/phate.po?seq_post=" + seq_post,
                                type: "get",
                                success: function (data) {

                                    arr = data.split('|');
                                    console.log("arr[0] : " + arr[0] + " lCount :" + arr[1] + " hCount : " + arr[2]);


                                    if (arr[0] == 0 || arr[0] == -1) {
                                        console.log(data);
                                        alert("싫어요");
                                        $("#p_hatebefore").css(
                                            "display", "none");
                                        $("#p_hate").css("display",
                                            "block");
                                    } else if (arr[0] == 1) {
                                        console.log(arr[0]);
                                        alert("좋아요 취소 after 싫어요");

                                        $("#p_likebefore").css(
                                            "display", "block");
                                        $("#p_like").css("display",
                                            "none");
                                        $("#p_hatebefore").css(
                                            "display", "none");
                                        $("#p_hate").css("display",
                                            "block");
                                    } else if (arr[0] == 2) {
                                        console.log(data);
                                        alert("싫어요 취소");
                                        $("#p_hate").css("display",
                                            "none");
                                        $("#p_hatebefore").css(
                                            "display", "block")

                                    }
                                    $("#likeCount-box").text(arr[1]);
                                    $("#hateCount-box").text(arr[2]);

                                }, error: function (e) {
                                    console.log(e);
                                }
                            })

                        })

                    $("#p_hate").on(
                        "click",
                        function () {
                            $("#countHate").val(${countHate });
                            let seq_post = $("#p_hate").val();
                            console.log(seq_post);
                            $.ajax({
                                url: "/phate.po?seq_post=" + seq_post,
                                type: "get",
                                success: function (data) {

                                    arr = data.split('|');
                                    console.log("arr[0] : " + arr[0] + " lCount :" + arr[1] + " hCount : " + arr[2]);


                                    if (arr[0] == 0 || arr[0] == -1) {
                                        console.log(data);
                                        alert("싫어요");
                                        $("#p_hatebefore").css(
                                            "display", "none");
                                        $("#p_hate").css("display",
                                            "block");
                                    } else if (arr[0] == 1) {
                                        console.log(arr[0]);
                                        alert("좋아요 취소 after 싫어요");

                                        $("#p_likebefore").css(
                                            "display", "block");
                                        $("#p_like").css("display",
                                            "none");
                                        $("#p_hatebefore").css(
                                            "display", "none");
                                        $("#p_hate").css("display",
                                            "block");
                                    } else if (arr[0] == 2) {
                                        console.log(data);
                                        alert("싫어요 취소");
                                        $("#p_hate").css("display",
                                            "none");
                                        $("#p_hatebefore").css(
                                            "display", "block")

                                    }

                                    $("#likeCount-box").text(arr[1]);
                                    $("#hateCount-box").text(arr[2]);

                                },
                                error: function (e) {
                                    console.log(e);
                                }
                            })

                        })
                    /*좋아요  */
                    $("#p_likebefore").on(
                        "click",
                        function () {

                            let seq_post = $("#p_likebefore").val();

                            $.ajax({
                                url: "/pLike.po?seq_post=" + seq_post,
                                type: "get",
                                success: function (data) {
                                    console.log(data);

                                    arr = data.split('|');
                                    console.log("arr[0] : " + arr[0] + " lCount :" + arr[1] + " hCount : " + arr[2]);

                                    if (arr[0] == 0 || arr[0] == -1) {
                                        console.log(arr[0]);
                                        alert("좋아요");
                                        $("#p_likebefore").css(
                                            "display", "none");
                                        $("#p_like").css("display",
                                            "block");
                                    } else if (arr[0] == 1) {
                                        console.log(arr[0]);
                                        alert("좋아요 취소");
                                        $("#p_like").css("display",
                                            "none");
                                        $("#p_likebefore").css(
                                            "display", "block")
                                    } else if (arr[0] == 2) {
                                        console.log(arr[0]);
                                        alert("싫어요 취소 after 좋아요");
                                        $("#p_hatebefore").css(
                                            "display", "block");
                                        $("#p_hate").css("display",
                                            "none");
                                        $("#p_likebefore").css(
                                            "display", "none");
                                        $("#p_like").css("display",
                                            "block");
                                    }
                                    $("#likeCount-box").text(arr[1]);
                                    $("#hateCount-box").text(arr[2]);

                                },
                                error: function (e) {
                                    console.log(e);
                                }
                            })
                            console.log(${countLike });
                            $("#countLike").val(${countLike });
                        })
                    $("#p_like").on(
                        "click",
                        function () {
                            let seq_post = $("#p_like").val();


                            $.ajax({
                                url: "/pLike.po?seq_post=" + seq_post,
                                type: "get",
                                success: function (data) {

                                    arr = data.split('|');
                                    console.log("arr[0] : " + arr[0] + " lCount :" + arr[1] + " hCount : " + arr[2]);

                                    if (arr[0] == 0 || arr[0] == -1) {
                                        console.log(data);
                                        alert("좋아요");
                                        $("#p_likebefore").css(
                                            "display", "block");
                                        $("#p_like").css("display",
                                            "none");
                                    } else if (arr[0] == 1) {
                                        console.log(data);
                                        alert("좋아요 취소");
                                        $("#p_like").css("display",
                                            "none");
                                        $("#p_likebefore").css(
                                            "display", "block")
                                    } else if (arr[0] == 2) {
                                        console.log(data);
                                        alert("싫어요 취소 after 좋아요");

                                        $("#p_hatebefore").css(
                                            "display", "block");
                                        $("#p_hate").css("display",
                                            "none");
                                        $("#p_likebefore").css(
                                            "display", "none");
                                        $("#p_like").css("display",
                                            "block");
                                    }
                                    $("#likeCount-box").text(arr[1]);
                                    $("#hateCount-box").text(arr[2]);

                                },
                                error: function (e) {
                                    console.log(e);
                                }
                            })
                            console.log(${countLike });
                            $("#countLike").val(${countLike });
                        })
                </script>
            </div>
            <hr>
        </div>
        <div class="row">
            <div class="col" id="content">
                <strong>내용:</strong>${dto.p_content }</div>

        </div>
        <hr>

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
                                function () { // 수정 페이지 요청
                                    location.href = "/modify.po?seq_post=${dto.seq_post}";
                                });
                        $("#btnDelete")
                            .on(
                                "click",
                                function () { // 삭제 요청
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
    <br/> <br/> <br/>

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
    <br/> <br/>
    <div class="comment-box">
        <div class="row body-review p-3">
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
                                                        <input id="seqReport"
                                                               value=${post_comment.seq_post_comment
                                                                       }
                                                                       style="display: none;">
                                                    </button>
                                                    <div class="modal fade" id="exampleModal" tabindex="-1"
                                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <form id="reportForm">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">
                                                                            Report</h5>
                                                                        <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">


                                                                        <div class="mb-3">
                                                                            <label for="message-text"
                                                                                   class="col-form-label">Message:</label>
                                                                            <textarea class="form-control"
                                                                                      id="message-text"
                                                                                      name="rp_content"> </textarea>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-bs-dismiss="modal">Close
                                                                        </button>
                                                                        <button id="sendMessage" type="button"
                                                                                class="btn btn-primary">Send message
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row body-post_comment body-review">
                                                <div class="col-10">
													<textarea style="resize:none;" id=""
                                                              class="form-control content-reply ps-2"
                                                              name="comment_content" placeholder="댓글내용"
                                                              readonly>${post_comment.comment_content}</textarea>
                                                </div>

                                                <!-- 수정,삭제버튼 -->
                                                <c:choose>
                                                    <c:when test="${loginSession.getUser_id() eq post_comment.getUser_id() }">
                                                        <div class="col-2 ps-3">

                                                            <div class="col" id="divWrite">
                                                                <button type=submit
                                                                        class="btn mt-2 btnSave complete-reply"
                                                                        id="btnSave"
                                                                        value="${post_comment.seq_post_comment}">등록
                                                                </button>
                                                            </div>

                                                            <div class="dropdown" id="modify_box">

                                                                <button type="button" class="btn btnModify" id=""
                                                                        data-bs-toggle="dropdown" aria-expanded="true">
                                                                    <img src="resources/images/modify.png" width="50%;">
                                                                </button>
                                                                <ul class="dropdown-menu"
                                                                    aria-labelledby="dropdownMenuButton1">
                                                                    <button
                                                                            class="dropdown-item modify-post_comment modify-review"
                                                                            value="${post_comment.seq_post_comment}">수정
                                                                    </button>
                                                                    <button
                                                                            class="dropdown-item delete-post_comment delete-review"
                                                                            value="${post_comment.seq_post_comment}">삭제
                                                                    </button>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="col-2 ps-3">
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
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
    /* $("#p_likebefore").on("click",function(e){
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
		}) */

    //모달 입력후 메세지 보냈을경우
    $("#sendMessage").on(
        "click",
        function (e) {

            let seq_post = "${dto.seq_post}";
            let seq_post_comment = $("#seqReport").val()
            //  $("#message").val($("#message-text").val());
            if ($("#message-text").val() === "") {
                alert("메세지를 제대로 입력하지 않았습니다.");
                return;
            }

            let rp_content = $("#message-text").val();
            let data = $("#reportForm").serialize();

            console.log(rp_content);
            console.log(data);
            $.ajax({
                url: "/report.co",
                type: "post",
                data: {
                    seq_post: seq_post,
                    seq_post_comment: seq_post_comment,

                    rp_content: rp_content
                },
                success: function () {
                    $("#exampleModal").modal('hide');

                },
                error: function (e) {
                    console.log(e);
                }
            })

        });

    $(".btn-report").on(
        "click",
        function () {
            /*모달 스크립트  */
            var exampleModal = document.getElementById("exampleModal");
            exampleModal.addEventListener("show.bs.modal",
                function (event) {
                    // Button that triggered the modal
                    var button = event.relatedTarget;
                    // Extract info from data-bs-* attributes
                    var recipient = button
                        .getAttribute("data-bs-whatever");
                    // If necessary, you could initiate an AJAX request here
                    // and then do the updating in a callback.
                    //
                    // Update the modal's content.
                    var modalTitle = exampleModal
                        .querySelector(".modal-title");
                    var modalBodyInput = exampleModal
                        .querySelector(".modal-body input");

                    modalTitle.textContent = "Report";
                })
        });
    // 댓글 수정 버튼에게 이벤트 부여
    $(".body-review").on(
        "click",
        ".modify-review",
        function (e) {
            console.log(e.target);
            $(e.target).parent().parent("#modify_box").css(
                "display", "none"); // 수정삭제 버튼 감추기
            $(e.target).parent().parent().prev("#divWrite").css(
                "display", "block"); // 취소완료 버튼 보이기
            // 댓글 수정가능하게끔 readonly 속성 풀어주기
            $(e.target).parent().parent().parent().prev().children(
                "textarea").attr("readonly", false);
            // textarea 포커스
            $(e.target).parent().parent().parent().prev().children(
                "textarea").focus();
        });

    // 수정 버튼 눌렀을때
    $(".body-review").on(
        "click",
        ".btnSave",
        function (e) {
            //let movieCd = "${movie.movieCd}";
            //let movieCd = "${review.movieCd}";
            //console.log("movieCd:", movieCd);
            let seq_review = $(e.target).val();
            console.log("seq_review :", seq_review)
            let comment_content = $(e.target).parent().parent().prev()
                .children("textarea").val();
            console.log("comment_content: ", comment_content);
            let seq_post = "${dto.seq_post}";
            if (comment_content === "") {
                alert("리뷰를 입력해 주세요!");
                return;
            }

            $.ajax({
                url: "/modifyProc.co",
                type: "post",
                data: {
                    seq_post_comment: seq_review,
                    comment_content: comment_content,
                    seq_post: seq_post
                },
                success: function (rs) {
                    console.log(rs);
                    if (rs === "fail") {
                        alert("댓글 수정에 실패했습니다.");
                    } else {
                        alert("댓글 수정에 성공!");
                        refreshMemList();
                    }
                },
                error: function (e) {
                    console.log(e);
                }
            })
        });


    $(".body-review").on("click", ".delete-review", function (e) {
        //let movieCd = "${movie.movieCd}";
        //let movieCd = "${review.movieCd}";
        //console.log("movieCd:", movieCd);
        let seq_review = $(e.target).val();
        console.log("seq_review :", seq_review)
        let seq_post = "${dto.seq_post}";
        $.ajax({
            url: "/deleteProc.co",
            type: "post",
            data: {
                seq_post_comment: seq_review,
                seq_post: seq_post
            },
            success: function (rs) {
                console.log(rs);
                if (rs === "fail") {
                    alert("댓글 수정에 실패했습니다.");
                } else {
                    alert("댓글 삭제 성공!");
                    refreshMemList();
                }
            },
            error: function (e) {
                console.log(e);
            }
        })
    });

    // 댓글 등록
    $("#btnSubmitReply").on("click", function () {
        if ($("#inputReply").val() === "") { // 댓글 입력창이 비어있다면
            alert("입력된 댓글이 없습니다.");
            return;
        }

        // ajax를 이용해서 form 전송
        let data = $("#formReply").serialize(); //전송할 수 있는 데이터로 변환
        console.log(data);
        $("#inputReply").val("");

        $.ajax({
            url: "/insert.co",
            type: "post",
            data: data
            // 만약 서버에서 응답해주는 값이 일반 text일 수도 있고
            // json 형식일 수도 있다면 dataType을 명시하지 않는다.
            ,
            success: function (rs) {
                console.log(rs);
                if (rs === "fail") { // 댓글등록에 실패했거나
                    alert("댓글 등록에 실패했습니다.");
                } else { // json형식의 데이터가 넘어오거나(댓글리스트)
                    refreshMemList();
                }
            },
            error: function (e) {
                console.log(e);
            }
        })

    })

    function refreshMemList() {
        location.reload();
    }

    $(document).ready(function () {
        $("#summernote").summernote();
    });

    $('#summernote').summernote(
        {

            height: 400, // 에디터 높이
            minHeight: null, // 최소 높이
            maxHeight: null, // 최대 높이
            fontNames: ['맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New',],
            fontNamesIgnoreCheck: ['맑은고딕'],
            focus: true, // 에디터 로딩후 포커스를 맞출지 여부
            lang: "ko-KR", // 한글 설정
            resize: false,
            placeholder: '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
            callbacks: {
                onImageUpload: function (files, editor, welEditable) {
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
            success: function (img_name) {
                $(el).summernote('editor.insertImage', img_name);

            }
        });
    }


    $("#submit").on("click", function () {
        console.log($('#summernote').summernote('code'));
        $("#content").val($('#summernote').summernote('code'));

    })

    $("#btnBack").on("click", function () {
        location.href = "detailPost.po?seq_post=" +${dto.seq_post };
    })
</script>
</body>
</html>




