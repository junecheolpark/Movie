<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- 제이쿼리 코드 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <!-- 부트스트랩 코드 -->
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
<title>리뷰 상세페이지</title>
<style>
        textarea {
            resize: none;
        }

        /* -----------------------------------------------------------*/
        /* 왼쪽 영화 이미지 */
        body {
            background-color: rgb(246, 243, 241);
        }

        .movie_box {
            background-color: white;
            height: 400px;
            border-radius: 10px;
        }

        .movie_img {
            height: 80%;
            background-color: #ccc;
            border-radius: 10px;
        }

        /* -----------------------------------------------------------*/
        /* 영화 코멘트 */
        .movie_coment {
            background-color: white;
            border-radius: 10px;

        }

        .content-movie {
            height: 200px;
            border: none;
        }

        /* -----------------------------------------------------------*/
        .r_grade_box {
            font-size: 10px;
        }

        /* -----------------------------------------------------------*/
        /* 리플 박스 */
        .reply_box {
            background-color: white;
            border-radius: 10px;
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
            background-color: rgb(217, 217, 217);
            height: 30px;
            border-radius: 15px;
        }

        /* -----------------------------------------------------------*/
        /* 별점 */
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

        .star-rating :checked~label {
            color: rgb(0, 0, 0);
        }

        .star-rating label:hover,
        .star-rating label:hover~label {
            color: #fc0;
        }
    </style>
</head>
<body>
<div class="container">
        <div class="row pt-4">
            <!-- 왼쪽 영화이미지 -->
            <div class="col-3 p-2 movie_box">
                <div class="col movie_img">
                    영화이미지
                </div>
                <div class="col">
                    <p>장르</p>
                    <p>제목</p>
                </div>
            </div>

            <!-- 코멘트,댓글 -->
            <div class="col-9">
                <!-- 영화 코멘트 -->
                <div class="col p-2 mt-3 movie_coment">
                    <textarea id="" class="form-control content-movie" name="m_coment">영화 소개</textarea>
                </div>


            </div>

        </div>
    </div>
<!-- ---------------------------------------------------------------------------------------------------------------------- -->
    <!-- 좋아요, 댓글창 -->
    <div class="container">
        <div class="row pt-4">
            <!-- 좋아요 -->
            <div class="row col">
                <div class="col">
                </div>
                <div class="col-5 text-center like_round">
                    <span>하트 458</span>
                </div>
            </div>

            <!-- 코멘트,댓글 -->
            <div class="col-9 movie_comment_box">
                <div class="row container r_grade_box mb-1">
                    <!-- 별점 -->
                    <div class="col-6 r_grade">
                        평균 <label for="star" class="star">&#9733;</label> 3.0(00명) 별점주기

                        <span class="star-rating">
                            <input type="radio" id="5-stars" name="rating" value="5" />
                            <label for="5-stars" class="star">&#9733;</label>
                            <input type="radio" id="4-stars" name="rating" value="4" />
                            <label for="4-stars" class="star">&#9733;</label>
                            <input type="radio" id="3-stars" name="rating" value="3" />
                            <label for="3-stars" class="star">&#9733;</label>
                            <input type="radio" id="2-stars" name="rating" value="2" />
                            <label for="2-stars" class="star">&#9733;</label>
                            <input type="radio" id="1-star" name="rating" value="1" />
                            <label for="1-star" class="star">&#9733;</label>
                        </span>
                    </div>
                    <div class="col-4 text-end">
                        공감순 높은평점순 낮은평점순 최신순
                    </div>
                </div>
                <!-- 댓글 입력창 -->
                <div class="row align-items-center comment_box">
                    <div class="col-10">
                        <textarea id="" class="form-control" name="r_write" placeholder="댓글을 입력해주세요."></textarea>
                    </div>
                    <div class="col-2">
                        <button type="button" class="btn btn-info " id="btnSave">리뷰 등록</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
<!-- ---------------------------------------------------------------------------------------------------------------------- -->
    <!-- 좋아요, 댓글창 -->
    <div class="container">
        <div class="row pt-4">
            <div class="col text-end">
            </div>

            <!-- 코멘트,댓글 -->
            <div class="col-9  reply_box">
                <!-- 댓글 출력 -->
                <div class="row">
                    <div class="col-2 text">
                        <div class="Profile text-center">
                            프로필
                        </div>
                    </div>
                    <div class="col-10">
                        <div class="row mb-1">
                            <div class="col-6 ms-2">
                                닉네임
                            </div>
                            <div class="col-3 r_grade">
                                <span class="star-rating">
                                    <!-- for문 돌려서 갯수만큼 받기 -->
                                    <label for="5-stars" class="star">&#9733;</label>
                                    <label for="4-stars" class="star">&#9733;</label>
                                    <label for="3-stars" class="star">&#9733;</label>
                                    <label for="2-stars" class="star">&#9733;</label>
                                    <label for="1-star" class="star">&#9733;</label>
                                </span>
                            </div>
                            <div class="col-2 mt-1 text-end r_report">
                                신고
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-10">
                                <textarea id="" class="form-control content-reply" name="r_coment" placeholder="댓글내용"></textarea>
                            </div>
                            <div class="col-2">

                            </div>
                        </div>
                        <div class="row mt-1">
                            <div class="col-7 ms-2">
                                날짜
                            </div>
                            <div class="col-2 m-1 like_round">
                                img 123
                            </div>
                            <div class="col-2 m-1 like_round">
                                img 123
                            </div>
                        </div>
                    </div>
                </div>


            </div>

        </div>
    </div>
</body>
</html>