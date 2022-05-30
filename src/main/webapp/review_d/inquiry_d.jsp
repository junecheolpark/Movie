<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <title>Document</title>

    <style>
        header,
        footer {
            background-color: black;
        }

        a {
            text-decoration: none;
        }

        .contents {
            height: 500px;
        }

        #navLogo {
            width: 90%;
            height: 90%;
        }

        #cartIcon {
            width: 30px;
            height: 30px;
        }

        #myPageIcon {
            width: 30px;
            height: 30px;
        }

        #cart {
            display: none;
        }

        #myPage {
            display: none;
        }

        /* Icon */
        #calendarIcon {
            width: 30px;
            height: 30px;
        }

        #humanIcon {
            width: 30px;
            height: 30px;
        }

        #kakaoIcon {
            width: 30px;
            height: 30px;
        }

        #twitterIcon {
            width: 30px;
            height: 30px;
        }

        #instagramIcon {
            width: 30px;
            height: 30px;
        }

        #facebookIcon {
            width: 30px;
            height: 30px;
        }

        .snsIcon1 {
            float: left;
            margin-top: 10px;
            margin-right: 5px;
        }

        .snsIcon2 {
            float: left;
            margin-top: 10px;
            margin-right: 5px;
        }

        .snsIcon3 {
            float: left;
            margin-top: 10px;
            margin-right: 5px;
        }

        .snsIcon4 {
            float: left;
            margin-top: 10px;
        }

        textarea {
            resize: none;
        }

        a {
            text-decoration: none;
            font-weight: bold;
            color: black;
        }

        body {
            background-color: rgb(213, 226, 228);
        }

        /* -----------------------------------------------------------*/
        /* 왼쪽 영화 이미지 */

        .movie_box {
            background-color: white;
            /* height:calc(100vh - 400px); */
            height: 600px;
            border-radius: 10px;
        }

        .m_genre {
            font-size: 12px;
        }

        .movie_img {
            height: 85%;
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
        /* 평점, 리뷰등록 */

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

        .star-rating :checked~label {
            color: rgb(0, 0, 0);
        }

        .star-rating label:hover,
        .star-rating label:hover~label {
            color: #fc0;
        }

        /* -----------------------------------------------------------*/
        /* 리플 박스 */
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

        .reply-star-rating input {
            display: none;
        }

        .reply-star-rating label {
            color: #ccc;
        }










        /* -----------------------------------------------------------*/
        /* Footer */
        .nav-link {
            color: gray;
            text-decoration: none;
        }

        .nav-link:hover {
            color: white;
        }

        @media (max-width: 1000px) {
            #navLogo {
                display: none;
            }

            #myPageIcon {
                display: none;
            }

            #cartIcon {
                display: none;
            }

            #cart {
                display: block;
            }

            #myPage {
                display: block;
            }

            #menu {
                display: none;
            }
        }

        @media (min-width: 1000px) {
            #navibar {
                display: none;
            }
        }
    </style>
</head>

<body>

    <!-- Header -->
    <header class="mb-3 border-bottom">
        <div class="container">
            <nav id="navibar" class="navbar navbar-expand-lg navbar-dark" aria-label="Main navigation">
                <div class="container-fluid">
                    <!-- toggle button -->
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <!-- 메뉴 -->
                    <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                        <ul class="navbar-nav mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="#">영화</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">리뷰</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">자유게시판</a>
                            </li>
                        </ul>

                        <ul class="navbar-nav mb-2 mb-lg-0 me-2">
                            <li class="nav-item">
                                <a class="nav-link" href="#">로그인</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">회원가입</a>
                            </li>
                        </ul>


                        <a href="" class="d-flex align-items-center mb-2 mb-lg-0 me-3">
                            <p class="text-light" id="cart">찜한 영화</p>
                        </a>
                        <a href="" class="d-flex align-items-center mb-2 mb-lg-0 me-3">
                            <p class="text-light" id="myPage">마이페이지</p>
                        </a>

                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>

                    </div>
                </div>
            </nav>

            <nav id="menu" class="navbar navbar-expand-lg w-100 navbar-dark" aria-label="Main navigation">
                <div class="row w-100 align-items-center">
                    <div class="col-5 d-flex justify-content-center">
                        <ul class="navbar-nav mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="#">영화</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">리뷰</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">자유게시판</a>
                            </li>
                        </ul>

                    </div>

                    <!-- logo -->
                    <div class="col-2">
                        <a href="/" class="d-flex align-items-center justify-content-start mb-2 mb-lg-0">
                            <img id="navLogo" src="images/logo3.png">
                        </a>
                    </div>

                    <div class="col-5">
                        <div class="row">
                            <div class="col-5">
                                <ul class="navbar-nav mb-2 mb-lg-0 me-2">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">로그인</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">회원가입</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="col-2">
                                <a href="" class="align-items-center ">
                                    <img class="img-fluid" id="cartIcon" src="images\찜.png">
                                    <!-- <p class="text-light" id="cart">찜한 영화</p> -->
                                </a>
                                <a href="" class="align-items-center">
                                    <img class="img-fluid" id="myPageIcon" src="images\마이페이지.png">
                                    <!-- <p class="text-light" id="myPage">마이페이지</p> -->
                                </a>
                            </div>
                            <div class="col-5">
                                <form class="d-flex">
                                    <input class="form-control me-2" type="search" placeholder="Search"
                                        aria-label="Search">
                                    <button class="btn btn-outline-success" type="submit">Search</button>
                                </form>
                            </div>

                        </div>




                    </div>

                </div>
            </nav>
        </div>
        </nav>

        </div>
    </header>

    <!-- Contents -->




        <div class="container">
            <div class="row pt-4">
                <!-- 왼쪽 영화이미지 -->
                <div class="col-3 p-2 movie_box">
                    <div class="col movie_img">
                        <img src="images/movie.jpg" width="100%" height="100%">
                    </div>
                    <div class="col ">
                        <p class="m_genre mb-1 mt-1">장르: 액션</p>
                        <p class="m_name my-1">범죄도시(the roundup)</p>
                        <p class="m_genre mb-1 mt-1">개봉: 2022 감독: 이상용</p>
                    </div>
                </div>

                <!-- 코멘트,댓글 -->
                <div class="col-9">
                    <!-- 영화 코멘트 -->
                    <div class="col-10 p-2 mt-3 movie_coment">
                        <textarea id="" class="form-control content-movie" name="m_coment">영화 소개</textarea>
                    </div>


                </div>

            </div>
        </div>
        <!-- ---------------------------------------------------------------------------------------------------------------------- -->
        <!-- 좋아요, 댓글창 -->
        <form id="movie_comment_write" action="/write.re" method="post">
            <div class="container">
                <div class="row pt-4">
                    <!-- 좋아요 -->
                    <div class="row col">
                        <div class="col">
                        </div>
                        <div class="col-lg-5 col-md-10 text-center like_round">
                            <span>
                                <img src="images/heart.png">
                                458</span>
                        </div>
                    </div>


                    <!-- 코멘트,댓글 -->
                    <div class="col-9 movie_comment_box">
                        <div class="row container r_grade_box mb-1">
                            <!-- 별점 -->
                            <div class="col-6 r_grade">
                                평균 <label for="star" class="star">&#9733;</label> 3.0(00명) 별점주기

                                <span class="star-rating" id="">
                                    <input type="radio" class="inputStar" id="5-stars" name="rating" value="5" />
                                    <label for="5-stars" class="star">&#9733;</label>
                                    <input type="radio" class="inputStar" id="4-stars" name="rating" value="4" />
                                    <label for="4-stars" class="star">&#9733;</label>
                                    <input type="radio" class="inputStar" id="3-stars" name="rating" value="3" />
                                    <label for="3-stars" class="star">&#9733;</label>
                                    <input type="radio" class="inputStar" id="2-stars" name="rating" value="2" />
                                    <label for="2-stars" class="star">&#9733;</label>
                                    <input type="radio" class="inputStar" id="1-star" name="rating" value="1" />
                                    <label for="1-star" class="star">&#9733;</label>
                                </span>
                            </div>
                            <div class="col-5 pe-5 text-end">
                                <a href="#">&#9786공감순</a>
                                <a href="#">&#9734높은평점순</a>
                                <a href="#">&#9734낮은평점순</a>
                                <a href="#">&#9737최신순</a>
                            </div>
                        </div>
                        <!-- 댓글 입력창 -->
                        <div class="row align-items-center comment_box">
                            <div class="col-10">
                                <textarea id="" class="form-control" name="r_content"
                                    placeholder="댓글을 입력해주세요."></textarea>
                            </div>
                            <div class="col-2">
                                <button type="submit" class="btn btnWrite" id="btnWrite">리뷰 등록</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </form>
        <!-- ---------------------------------------------------------------------------------------------------------------------- -->
        <!-- 좋아요, 댓글창 -->
        <div class="container">
            <div class="row pt-4">
                <div class="col text-end">
                </div>

                <!-- 코멘트,댓글 -->
                <div class="col-9 reply_box">
                    <!-- 댓글 출력 -->
                    <div class="row">
                        <div class="col-2 text">
                            <!-- 프로필 -->
                            <div class="Profile text-center mt-2">
                                프로필
                            </div>
                        </div>
                        <div class="col-10">
                            <div class="row mb-1">
                                <div class="col-6 ms-2">
                                    닉네임
                                </div>
                                <div class="col-4 text-end r_grade">
                                    <span class="reply-star-rating">
                                        <!-- 갯수만큼 script에서 스타일주기 -->
                                        <input type="radio" class="5" id="5-r_stars" name="rating" value="5" />
                                        <label for="5-r_stars" id="star5">&#9733;</label>
                                        <input type="radio" class="4" id="4-r_stars" name="rating" value="4" />
                                        <label for="4-r_stars" id="star4">&#9733;</label>
                                        <input type="radio" class="3" id="3-r_stars" name="rating" value="3" />
                                        <label for="3-r_stars" id="star3">&#9733;</label>
                                        <input type="radio" class="2" id="2-r_stars" name="rating" value="2" />
                                        <label for="2-r_stars" id="star2">&#9733;</label>
                                        <input type="radio" class="1" id="1-r_star" name="rating" value="1" />
                                        <label for="1-r_star" id="star1">&#9733;</label>
                                    </span>
                                </div>
                                <div class="col-1 mt-1 text-end r_report">
                                    <a href="#">
                                        <img src="images/report.png" height="80%">
                                    </a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-10">
                                    <textarea id="" class="form-control content-reply" name="r_coment"
                                        placeholder="댓글내용"></textarea>
                                </div>
                                <!-- 수정,삭제버튼 -->
                                <div class="col-2 ps-4">
                                    <div class="dropdown">
                                        <button class="btn btnModify" type="button" id="" data-bs-toggle="dropdown"
                                            aria-expanded="true">
                                            <img src="images/modify.png" width="55%;">
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                            <li><button class="dropdown-item">수정</button></li>
                                            <li><button class="dropdown-item">삭제</button></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-1">
                                <div class="col-lg-7 col-md-5 ms-2">
                                    날짜
                                </div>
                                <div class="col-lg-2 col-md-3 m-1 like_round">
                                    <a href="#">
                                        <img src="images/like.png">
                                    </a>
                                    123
                                </div>
                                <div class="col-lg-2 col-md-3 m-1 like_round">
                                    <a href="#">
                                        <img src="images/hate.png" height="70%">
                                    </a>
                                    123
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ---------------------------------------------------------------------------------------------------------------------- -->


        <!-- 빈창 -->
        <div class="container">
            <div class="row ">
                <div class="col">
                </div>
                <!-- 코멘트,댓글 -->
                <div class="col-9 my-3 reply_box" style="height:15px;">
                </div>
            </div>
        </div>


        <!-- Footer -->
        <footer class="py-5 mt-3 text-light">
            <div class="container">
                <div class="row">
                    <div class="col-2">
                        <h5>장르</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0">코믹</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0">액션</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0">멜로</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0">SF</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0">호러</a></li>
                        </ul>
                    </div>

                    <div class="col-2">
                        <h5>계정</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0">로그인</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0">회원가입</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0">마이페이지</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0">아이디 찾기</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0">비밀번호 찾기</a></li>
                        </ul>
                    </div>

                    <div class="col-2">
                        <h5>기타</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0">리뷰</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0">자유게시판</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0">찜 목록</a></li>
                        </ul>
                    </div>

                    <div class="col-4 offset-1">
                        <form>
                            <h5>영화 리뷰 플랫폼 - 영화 추천이</h5>
                            <p>지금 영화를 리뷰하고,<br>
                                내 취향에 딱 맞는 영화를 추천받아 보세요!</p>
                            <div class="d-flex w-100 gap-2">
                                <label for="newsletter1" class="visually-hidden">Email address</label>
                                <input id="newsletter1" type="text" class="form-control" placeholder="Email address">
                                <button class="btn btn-primary" type="button">영화 추천받기</button>
                            </div>
                        </form>

                        <div class="snsBox">
                            <div class="snsIcon1">
                                <a href="https://www.kakaocorp.com/" class="d-flex align-items-center mb-2 mb-lg-0">
                                    <img id="kakaoIcon" src="images/kakaotalk.png">
                                </a>
                            </div>
                            <div class="snsIcon2">
                                <a href="https://twitter.com/" class="d-flex align-items-center mb-2 mb-lg-0">
                                    <img id="twitterIcon" src="images/twitter.png">
                                </a>
                            </div>
                            <div class="snsIcon3">
                                <a href="https://www.instagram.com/" class="d-flex align-items-center mb-2 mb-lg-0">
                                    <img id="instagramIcon" src="images/instagram.png">
                                </a>
                            </div>
                            <div class="snsIcon4">
                                <a href="https://www.facebook.com/" class="d-flex align-items-center mb-2 mb-lg-0">
                                    <img id="facebookIcon" src="images/facebook.png">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-center py-4 my-4 border-top">
                    <p>&copy; 영화 리뷰 플랫폼, 영화 추천이 All rights reserved.</p>
                </div>
            </div>

        </footer>

        <script>
            // val값에 따른 평점 변화
            $(".inputStar").on("click", function () {
                let rs = $(this).val();
                console.log(rs);
                if (rs == 1) {
                    $("#star1").css({ "color": "black" });
                } else if (rs == 2) {
                    $("#star1",).css({ "color": "black" });
                    $("#star2",).css({ "color": "black" });d
                } else if (rs == 3) {
                    $("#star1",).css({ "color": "black" });
                    $("#star2",).css({ "color": "black" });
                    $("#star3",).css({ "color": "black" });
                } else if (rs == 4) {
                    $("#star1",).css({ "color": "black" });
                    $("#star2",).css({ "color": "black" });
                    $("#star3",).css({ "color": "black" });
                    $("#star4",).css({ "color": "black" });
                } else if (rs == 5) {
                    $("#star1",).css({ "color": "black" });
                    $("#star2",).css({ "color": "black" });
                    $("#star3",).css({ "color": "black" });
                    $("#star4",).css({ "color": "black" });
                    $("#star5",).css({ "color": "black" });
                }
            })



        </script>
    </body>

</html>