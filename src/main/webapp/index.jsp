<%--
  Created by IntelliJ IDEA.
  User: jangseoksu
  Date: 2022/06/08
  Time: 9:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<<<<<<< HEAD
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        body {
            height: 4000px;
            min-width: 640px;
        }

        * {
            box-sizing: border-box;
        }

        header {
            width: 100%;
            height: 3.6%;
            background-color: black;
        }

        footer {
            width: 100%;
            height: 9%;
            background-color: black;
        }

        #navLogo {
            width: 150px;
            height: 100px;
        }

        #logoImg {
            width: 100%;
            height: 100%;
        }

        /* Icon */
        #cartIcon {
            width: 30px;
            height: 30px;
        }

        #myPageIcon {
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

        /* Icon end */

        /* Footer */
        .nav-link {
            color: gray;
            text-decoration: none;
        }

        .nav-link:hover {
            color: white;
        }

        /* header 반응형 */
        @media ( max-width: 767px) {
            #navLogo {
                display: none;
            }

            #myPageIcon {
                display: none;
            }

            #cartIcon {
                display: none;
            }

            #menu {
                display: none;
            }
        }

        @media (min-width: 768px) {
            #navibar {
                display: none;
            }
        }

        /* header 반응형 끝 */

        /* -----------------------------------------------------------*/
        textarea {
            resize: none;
        }

        a {
            text-decoration: none;
            font-weight: bold;
            color: black;
        }

        body {
            background-color: white
        }

        .content {
            height: 1000px;
        }

        /* header 반응형 */
        @media ( max-width: 767px) {
            #navLogo {
                display: none;
            }

            #myPageIcon {
                display: none;
            }

            #cartIcon {
                display: none;
            }

            #menu {
                display: none;
            }
        }

        @media (min-width: 768px) {
            #navibar {
                display: none;
            }
        }

        >>> >>> > b992369

        (
        수정

        )

        /*  content */


        /* -----------------------------------------------------------*/

        /* clear:both를 통해 플롯 초기화해야 레이아웃 안깨짐
                https://kuzuro.blogspot.com/2018/08/blog-post_18.html 참고 */
        /* 반응형 시작 */
        @media screen and (max-width: 1200px) {
            aside#aside {
                width: 25%;
            }

            div.body-wishList {
                width: 75%;
            }
        }

        @media screen and (max-width: 1024px) {
            aside#aside {
                display: none;
            }

            div.body-wishList {
                width: 100%;
            }

            aside#asideSM {
                display: block;
                width: 100%;
            }
        }

        @media screen and (min-width: 1024px) {
            aside#asideSM {
                display: none;
            }
        }

        @media screen and (max-width: 768px) {
            aside#asideSM div#profileBox {
                display: none;
                width: 50%
            }

            aside#asideSM div#profileBtnBox {
                display: none;
            }

            /* aside#asideSM div#profileBtnBoxSM {
                display: block;
            } */
            div.body-wishList {
                width: 100%;
                float: none;
            }
        }

        @media screen and (min-width: 768px) {
            aside#asideSM div#profileBtnBoxSM {
                display: none;
            }
        }

        /* 반응형 끝 */
    </style>

=======
    <title>Title</title>
>>>>>>> d8e44652d811e8a4cc019045155656c9bc1fc66e
</head>
<body>
<<<<<<< HEAD
<header class="mb-3 border-bottom">
    <div class="container">
        <!-- 접혔을 때 nav -->
        <nav id="navibar" class="navbar navbar-expand-md navbar-dark" aria-label="Main navigation">
            <div class="container-fluid">
                <!-- toggle button -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNavDropdown"
                        aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- 메뉴 -->
                <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/listLookup.movie?curPage=1">영화</a></li>
                        <li class="nav-item"><a class="nav-link" href="/toReviewList.re?curPage=1">리뷰</a></li>
                        <li class="nav-item"><a class="nav-link" href="/post.po?curPage=1">자유게시판</a></li>
                        <li class="nav-item"><a class="nav-link" href="/Member/login.jsp">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="/Member/signup.jsp">회원가입</a></li>
                        <li class="nav-item"><a class="nav-link" href="/wishlist.wish">찜한 영화</a></li>
                        <li class="nav-item"><a class="nav-link" href="/Mypage/mypageIndex.jsp">마이페이지</a></li>
                    </ul>

                    <form class="searchForm d-flex" action="/search.movie">
                        <input class="searchInput form-control me-2" type="search" placeholder="영화 검색.."
                               aria-label="Search" name='val'>
                        <input type="hidden" name='curPage' value="1">
                        <input type="hidden" name='s_type' value="movieNm">
                        <button class="searchBtn btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>

        <!-- 펼쳐졌을 때 nav -->
        <nav id="menu" class="navbar navbar-expand-md w-100 navbar-dark" aria-label="Main navigation">
            <div class="row w-100 align-items-center">
                <div class="col-5 d-flex justify-content-center">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link mx-2" href="/listLookup.movie?curPage=1">영화</a></li>
                        <li class="nav-item"><a class="nav-link mx-2" href="/toReviewList.re?curPage=1">리뷰</a></li>
                        <li class="nav-item"><a class="nav-link mx-2" href="/post.po?curPage=1">자유게시판</a></li>
                    </ul>
                </div>

                <!-- logo -->
                <div class="col-2">
                    <a href="/home" id="navLogo" class="mb-2 mb-lg-0">
                        <img id="logoImg" src="/images/logo3.png">
                    </a>
                </div>

                <div class="col-5">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-auto">
                            <ul class="navbar-nav mb-2 mb-lg-0 me-2">
                                <li class="nav-item">
                                    <a class="nav-link" href="/Member/login.jsp">로그인</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/Member/signup.jsp">회원가입</a>
                                </li>

                            </ul>
                        </div>

                        <div class="col-auto">
                            <a href="/wishlist.wish" class="">
                                <img class="img-fluid" id="cartIcon" src="/images/찜.png">
                            </a>
                            <a href="/Mypage/mypageIndex.jsp" class="">
                                <img class="img-fluid" id="myPageIcon" src="/images/마이페이지.png">
                            </a>
                        </div>

                        <div class="col-1">
                            <button id="searchBtn" class="btn" type="button" data-bs-toggle="modal"
                                    data-bs-target="#searchModal">
                                <img src="/images/searchIcon.png">
                            </button>
                        </div>

                        <div class="modal fade" id="searchModal" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title m-auto">영화 찾기</h5>
                                        <button type="button" class="btn-close m-0" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="searchForm" class="searchForm" action="/search.movie">
                                            <div class="row justify-content-center">
                                                <div class="col-11">
                                                    <input class="searchInput form-control me-2" type="search"
                                                           placeholder="영화 검색.." aria-label="Search" name='val'>
                                                    <p class="text-black-50 text-center mt-3">찾으시는 영화가 있으신가요? 검색어를
                                                        입력해보세요!</p>
                                                    <input type="hidden" name='curPage' value="1">
                                                    <input type="hidden" name='s_type' value="movieNm">
                                                </div>
                                            </div>
                                            <div class="row justify-content-end">
                                                <div class="col-3">
                                                    <button class="searchBtn btn btn-outline-success" type="submit">
                                                        Search
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </nav>
    </div>
</header>
<div class="container">
    <!-- Contents -->

    <div class="content">
        <div id="movieDiv">
            <div class="movieLi row">
                <c:if test="${not empty arrayList}">
                    <c:forEach items="${arrayList}" var="movieDTO">
                        <div class="movie col-6 col-lg-4">
                            <div class="movieImgDiv">
                                <img src="<c:url value="/images/NoImg.webp"/>">
                            </div>
                            <div class="movieNameDiv">
								<span class="movieName"> <a
                                        href="/detailView.re?movieCd=${movieDTO.movieCd}">${movieDTO.movieNm}</a>
								</span>
                                <c:if test="${not empty movieDTO.directors}">
                                    <span class="directors">${movieDTO.directors}</span>
                                </c:if>
                                <c:if test="${empty movieDTO.directors}">
                                    <span class="directors">등록된 감독이 없습니다</span>
                                </c:if>
                            </div>
                            <div class="categoryDiv">
                                <span class="movieCategory">${movieDTO.genreAlt}</span>
                            </div>
                            <div class="avgPointDiv">
                                <span class="avgPointImg"> </span>
                                <c:forEach items="${points}" var="i">
                                    <c:if test="${i.key eq movieDTO.movieCd}">
										<span class="movieAvgPoint" data-value="${i.value['avg']}"> <fmt:formatNumber
                                                value="${i.value['avg']}"
                                                type="pattern" pattern="0.00"/> (${i.value['count']})
										</span>
                                    </c:if>
                                </c:forEach>

                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty arrayList}">
                    <div class="col-12">조회 결과가 없습니다.</div>
                </c:if>
            </div>
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
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=코미디"
                                                 class="nav-link p-0">코미디</a></li>
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=액션"
                                                 class="nav-link p-0">액션</a></li>
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=멜로"
                                                 class="nav-link p-0">멜로</a></li>
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=SF"
                                                 class="nav-link p-0">SF</a></li>
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=호러"
                                                 class="nav-link p-0">호러</a></li>
                </ul>
            </div>

            <div class="col-2">
                <h5>계정</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="/Member/login.jsp" class="nav-link p-0">로그인</a></li>
                    <li class="nav-item mb-2"><a href="/signup.mem" class="nav-link p-0">회원가입</a></li>
                    <li class="nav-item mb-2"><a href="/Mypage/mypageIndex.jsp"
                                                 class="nav-link p-0">마이페이지</a></li>
                    <li class="nav-item mb-2"><a href="/Member/findId.jsp" class="nav-link p-0">아이디 찾기</a>
                    </li>
                    <li class="nav-item mb-2"><a href="/Member/findPw.jsp" class="nav-link p-0">비밀번호 찾기</a>
                    </li>
                </ul>
            </div>

            <div class="col-2">
                <h5>기타</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="/toReviewList.re?curPage=1"
                                                 class="nav-link p-0">리뷰</a></li>
                    <li class="nav-item mb-2"><a href="/post.po?curPage=1" class="nav-link p-0">자유게시판</a></li>
                    <li class="nav-item mb-2"><a href="/wishlist.wish" class="nav-link p-0">찜 목록</a></li>
                </ul>
            </div>

            <div class="col-4 offset-1">
                <form>
                    <h5>영화 리뷰 플랫폼 - 영화 추천이</h5>
                    <p>
                        지금 영화를 리뷰하고,<br> 내 취향에 딱 맞는 영화를 추천받아 보세요!
                    </p>
                    <div class="d-flex w-100 gap-2">
                        <label for="newsletter1" class="visually-hidden">Email address</label> <input
                            id="newsletter1" type="text"
                            class="form-control" placeholder="Email address">
                        <button class="btn btn-primary" type="button">영화 추천받기</button>
                    </div>
                </form>

                <div class="snsBox">
                    <div class="snsIcon1">
                        <a href="https://www.kakaocorp.com/" class="d-flex align-items-center mb-2 mb-lg-0">
                            <img id="kakaoIcon"
                                 src="images/kakaotalk.png">
                        </a>
                    </div>
                    <div class="snsIcon2">
                        <a href="https://twitter.com/" class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="twitterIcon"
                                src="images/twitter.png">
                        </a>
                    </div>
                    <div class="snsIcon3">
                        <a href="https://www.instagram.com/" class="d-flex align-items-center mb-2 mb-lg-0">
                            <img id="instagramIcon"
                                 src="images/instagram.png">
                        </a>
                    </div>
                    <div class="snsIcon4">
                        <a href="https://www.facebook.com/" class="d-flex align-items-center mb-2 mb-lg-0">
                            <img id="facebookIcon"
                                 src="images/facebook.png">
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
    const searchForm = $(".searchForm");
    searchForm.on("submit", function (event) {
        if ($(this).children(".searchInput").val() === "") {
            event.preventDefault();
            alert("검색어를 입력하세요");
        }
    });

    $.each($(".movie .movieAvgPoint"), function () {
        let points = $(this).attr('data-value');
        points = Math.round(points);

        for (let i = 0; i < points; i++) {
            $(this).siblings('.avgPointImg')[0].append('★');
        }

        for (let i = 0; i < 5 - points; i++) {
            $(this).siblings('.avgPointImg')[0].append('☆');
        }
    })
</script>
=======
<jsp:forward page="/toHome.home"/>
>>>>>>> d8e44652d811e8a4cc019045155656c9bc1fc66e
</body>
</html>
