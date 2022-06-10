<%--
  Created by IntelliJ IDEA.
  User: jangseoksu
  Date: 2022/06/02
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        body {
            min-height: 4000px;
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

        .contentDiv {
            height: 84%;
            margin-left: 5%;
            margin-right: 5%;
        }

        footer {
            width: 100%;
            height: 9%;
            background-color: black;
        }


        /* header */
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
            color: gray !important;
            text-decoration: none;
        }

        .nav-link:hover {
            color: white !important;
        }

        /* header 반응형 */
        @media ( max-width: 768px) {
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

        @media ( min-width: 768px) {
            #navibar {
                display: none;
            }
        }

        /* header 반응형 끝 */

        /* footer 반응형 시작 */
        @media ( max-width: 768px) {
            #bigFoot {
                display: none;
            }
        }

        @media ( min-width: 768px) {
            #smallFoot {
                display: none;
            }
        }

        /* footer 반응형 끝 */


        /*  content */

        /* -----------------------------------------------------------*/

        .contentDiv a {
            color: black !important;
            text-decoration: none;
        }

        .content1 {
            height: 20%;
        }

        .contentTitle {
            padding: 10px;
            height: 60px;
            display: flex;
            align-items: center;
            background-color: #503396;
            border-radius: 10px;
            margin-bottom: 45px;
        }

        .contentTitle span {
            font-size: 1.2em;
            font-weight: bold;
            color: white;
        }

        .content2 {
            height: 12%;
            width: 100%;
            margin-bottom: 50px;
            max-width: 1200px;
        }

        .movieDiv {
            width: 100%;
            height: 100%;
            display: flex !important;
            gap: 10px;
            align-items: center;
            padding: 10px;
        }

        .slick-list {
            height: 100%;
        }

        .slick-track {
            height: 100%;
        }


        .movie {
            height: 90% !important;
            margin: 20px;
            border: 1px solid #b4b7ba;
            border-radius: 10px;
        }

        .movie .imgContainer {
            height: 60%;
            padding: 7px;
        }

        .imgContainer img {
            height: 100%;
            width: 100%;
            border-radius: 10px;
        }

        .product {
            padding: 7px;
            height: 40%;
        }

        .product .category span {
            color: silver;
            font-size: 0.7em;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .product .title span {
            font-weight: bold;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            font-size: 1.1em;
        }

        .avgPoint {
            display: flex;
            gap: 5px;
        }

        .avgPoint span {
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            color: silver;
            font-size: 0.7em;
        }

        .content3 {
            height: 8%;
            margin-bottom: 50px;
            max-width: 1200px;
        }

        .reviewDiv {
            display: flex !important;
            align-items: center !important;
            height: 90%;
            gap: 10px;
        }

        .review {
            height: 100%;
            min-height: 110px;
            padding: 12px;
            border: 1px solid silver;
            border-radius: 12px;
            width: 98%;
        }

        .review_reviewer {
            height: 20%;
            display: flex;
            align-items: center;
            gap: 5px;
            margin-bottom: 10px;
            border-bottom: 1px solid silver;
        }

        .review_reviewer .review_id {
            font-size: 1.2em;
        }

        .review_reviewer .avgPoint {
            font-size: 0.9em;
        }

        .review_content {
            height: 50%;
            margin-bottom: 10px;
        }

        .review_content span {
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .review_movie {
            height: 20%;
            font-size: 0.8em;
            color: silver;
        }

        .content4 {
            height: 12%;
            margin-bottom: 50px;
            max-width: 1200px;
        }

        .topicLi {
            padding: 20px;
            height: 100%;
        }

        .topic {
            height: 20%;
            margin-bottom: 20px;
            border: 1px solid #b4b7ba;
            border-radius: 10px;
        }

        .topicTitle {
            font-size: 1.1em;
            border-bottom: solid 1px #b4b7ba;
        }

        .topicStatus {
            display: flex;
            justify-content: space-between;
            color: silver;
            font-size: 0.8em;
            margin-bottom: 2px;
        }

        .btnContainer {
            margin-top: 30px;
            display: flex;
            justify-content: center;
        }

        .btnContainer button {
            border: none;
            background-color: white;
        }

        .btnContainer button:hover {
            color: #503396;
        }

        button[class^='slick'] {
            border-radius: 20px;
            background-color: #b4b7ba;
            height: 40px;
            color: white;
            border: none;
        }

        .content5 {
            margin-bottom: 50px;
            max-width: 1200px;
            height: 20%;
        }

        .video {
            width: 100%;
            max-width: 1100px;
            margin: 20px auto;
            border-radius: 10px;
            background-color: rgb(2, 0, 2);
            padding: 30px;
            box-sizing: border-box;
        }

        .video-container {
            position: relative;
            width: 100%;
            height: auto;
            padding-top: 50%;
        }

        iframe {
            z-index: 1;
            top: 0;
            left: 0;
            position: absolute;
            width: 100%;
            height: 100%;
        }
        .notFound {
            border: 1px solid silver;
        }
    </style>
    <link
            rel="stylesheet"
            type="text/css"
            href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous">
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<body>
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
                        <c:choose>
                            <c:when test="${empty loginSession}">
                                <li class="nav-item"><a class="nav-link" href="/toLogin.mem">로그인</a></li>
                                <li class="nav-item"><a class="nav-link" href="/toSignUp.mem">회원가입</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item"><a class="nav-link" href="/wishlist.wish">찜한 영화</a></li>
                                <li class="nav-item"><a class="nav-link" href="/Mypage/mypageIndex.jsp">마이페이지</a></li>
                            </c:otherwise>
                        </c:choose>


                    </ul>

                    <form class="searchForm d-flex" method="get" action="/search.movie">
                        <input class="searchInput form-control me-2" type="search" placeholder="영화 검색.."
                               aria-label="Search" name='val'> <input
                            type="hidden" name='curPage' value="1"> <input type="hidden" name='s_type' value="movieNm">
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
                    <a href="/toHome.home" id="navLogo" class="mb-2 mb-lg-0">
                        <img id="logoImg" src="/images/logo3.png">

                    </a>
                </div>

                <div class="col-5">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-auto">
                            <ul class="navbar-nav mb-2 mb-lg-0 me-2">
                                <c:if test="${empty loginSession}">
                                    <li class="nav-item"><a class="nav-link" href="/toLogin.mem">로그인</a></li>
                                    <li class="nav-item"><a class="nav-link" href="/toSignUp.mem">회원가입</a></li>
                                </c:if>
                            </ul>
                        </div>

                        <div class="col-auto">
                            <c:if test="${not empty loginSession}">
                                <a href="/wishlist.wish" class=""> <img class="img-fluid" id="cartIcon"
                                                                        src="/images/찜.png">
                                </a>
                                <a href="/Mypage/mypageIndex.jsp" class=""> <img class="img-fluid" id="myPageIcon"
                                                                                 src="/images/마이페이지.png">
                                </a>
                            </c:if>
                        </div>

                        <div class="col-1">
                            <button id="searchBtn" class="btn" type="button" data-bs-toggle="modal"
                                    data-bs-target="#searchModal">
                                <img src="/images/searchIcon.png">
                            </button>
                        </div>
                        <form class="searchForm d-flex" method="get" action="/search.movie">
                            <div class="modal fade" id="searchModal" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title m-auto">영화 찾기</h5>
                                            <button type="button" class="btn-close m-0" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="searchForm" class="searchForm">
                                                <div class="row justify-content-center">
                                                    <div class="col-11">
                                                        <input class="searchInput form-control me-2" type="search"
                                                               placeholder="영화 검색.." aria-label="Search" name='val'>
                                                        <p class="text-black-50 text-center mt-3">찾으시는 영화가 있으신가요? 검색어를
                                                            입력해보세요!</p>
                                                        <input type="hidden" name='curPage' value="1"> <input
                                                            type="hidden" name='s_type' value="movieNm">
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
                        </form>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</header>

<!-- Contents -->
<div class="contentDiv row justify-content-center m-0">
    <div class="content1 col-11">
        <div id="carouselExampleIndicators" class="carousel slide w-60"
             data-bs-ride="true">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="0" class="active" aria-current="true"
                        aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner video">
                <div class="carousel-item active video-container">
                    <iframe width="560" height="315"
                            src="https://www.youtube.com/embed/mI9oyFMUlfg?autoplay=1"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen></iframe>
                </div>
                <div class="carousel-item video-container">
                    <iframe width="560" height="315"
                            src="https://www.youtube.com/embed/aw9j_23nORs"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen></iframe>
                </div>
                <div class="carousel-item video-container">
                    <iframe width="560" height="315"
                            src="https://www.youtube.com/embed/DpVAb7Bi5UQ"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>
    <div class="content2 col-11">
        <div class="contentTitle">
            <span>최신 영화</span>
        </div>
        <div class="movieDiv slider">
            <c:forEach items="${hashMap1}" var="movie">
                <c:forEach var="i" begin="0" end="9" step="1">
                    <c:if test="${i eq movie.key}">
                        <a
                                href="/detailView.re?movieCd=${movie.value['movieDTO'].movieCd}">
                            <div class="movie slider_item">
                                <div class="imgContainer">
                                    <img src="/images/NoImg.webp" alt="">
                                </div>
                                <div class="product">
                                    <div class="category">
                                        <span>${movie.value['movieDTO'].genreAlt}</span>
                                    </div>
                                    <div class="title">
                                        <span>${movie.value['movieDTO'].movieNm}</span>
                                    </div>
                                    <div class="avgPoint" data-value='${movie.value["avg"]}'>
                                        <span class="star"></span> <span><fmt:formatNumber
                                            value="${movie.value['avg']}" type="pattern" pattern="0.00"/>
												(${movie.value['count']})</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:if>
                </c:forEach>
            </c:forEach>
        </div>
        <div class="btnContainer">
            <button id='toRecentMovie'>최신 영화 더 보기</button>
        </div>
    </div>
    <div class="content3 col-11">
        <div class="contentTitle">
            <span>최신 리뷰</span>
        </div>
        <c:if test="${empty hashMap2}">
            <div class="notFound">
                <span>등록된 게시글이 없습니다.</span>
            </div>
        </c:if>
        <c:if test="${not empty hashMap2}">
            <div class="reviewDiv slider">
                <c:forEach items="${hashMap2}" var="review">
                    <c:forEach begin="0" end="9" step="1" var="i">
                        <c:if test="${i eq review.key}">
                            <a
                                    href="/detailView.re?movieCd=${review.value['movieDTO'].movieCd}">
                                <div class="review slider_item">
                                    <div class="review_reviewer">
                                        <div class="reviewer_id">
                                                ${review.value['reviewDTO'].user_nickname}</div>
                                        <div class="avgPoint" data-value='${review.value["avg"]}'>
                                            <span class="star"></span>
                                        </div>
                                    </div>
                                    <div class="review_content">
                                        <span>${review.value['reviewDTO'].r_content}</span>
                                    </div>
                                    <div class="review_movie">
										<span>${review.value['movieDTO'].movieNm},
                                                ${review.value['movieDTO'].directors}</span>
                                    </div>
                                </div>
                            </a>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </div>
        </c:if>
        <div class="btnContainer">
            <button id='toRecentReview'>최신 리뷰 더 보기</button>
        </div>

    </div>
    <div class="content4 col-11">
        <div class="contentTitle">
            <span>추천 영화</span>
        </div>
        <div class="movieDiv slider">
            <c:forEach items="${hashMap3}" var="movie">
                <c:forEach var="i" begin="0" end="9" step="1">
                    <c:if test="${i eq movie.key}">
                        <a
                                href="/detailView.re?movieCd=${movie.value['movieDTO'].movieCd}">
                            <div class="movie slider_item">
                                <div class="imgContainer">
                                    <img src="/images/NoImg.webp" alt="">
                                </div>
                                <div class="product">
                                    <div class="category">
                                        <span>${movie.value['movieDTO'].genreAlt}</span>
                                    </div>
                                    <div class="title">
                                        <span>${movie.value['movieDTO'].movieNm}</span>
                                    </div>
                                    <div class="avgPoint" data-value='${movie.value["avg"]}'>
                                        <span class="star"></span> <span><fmt:formatNumber
                                            value="${movie.value['avg']}" type="pattern" pattern="0.00"/>
												(${movie.value['count']})</span>

                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:if>
                </c:forEach>
            </c:forEach>
        </div>
    </div>


    <div class="content5 col-11">
        <div class="contentTitle">
            <span>최신 토픽</span>
        </div>
        <div class="topicLi row justify-content-around">
            <c:if test="${empty hashMap4}">
                <div class="notFound">
                    <span>등록된 게시글이 없습니다.</span>
                </div>
            </c:if>
            <c:forEach items="${hashMap4}" var="topic">
                <c:forEach begin="0" end="9" step="1" var="i">
                    <c:if test="${i eq topic.key}">
                        <div class="topic col-11 col-lg-5">
                            <div class="topicTitle"><a href="/detailPost.po?seq_post=${topic.value['postDTO'].seq_post}">${topic.value['postDTO'].p_title}</a>
                            </div>
                            <div class="topicStatus">
									<span>UP ${topic.value['like']} DOWN
										${topic.value['hate']} COMMENT ${topic.value['comment']} VIEW
                                            ${topic.value['postDTO'].p_view_count}</span> <span>글쓴이</span>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:forEach>
        </div>
        <div class="btnContainer">
            <button id='toRecentTopic'>최신 토픽 더 보기</button>
        </div>
    </div>
</div>
<footer class="py-5 text-light">
    <div class="container">
        <div class="row" id="bigFoot">
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

            <c:choose>
                <c:when test="${not empty loginSession}">
                    <div class="col-2">
                        <h5>계정</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="/myPage.mem" class="nav-link p-0">마이페이지</a></li>
                            <li class="nav-item mb-2"><a href="/wishlist.wish" class="nav-link p-0">찜 목록</a></li>
                            <c:if test="${loginSession.grade == 'admin'}">
                                <li class="nav-item mb-2"><a href="/lookupMem.admin?curPage=1" class="nav-link p-0">관리자 페이지</a></li>
                            </c:if>

                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="col-2">
                        <h5>계정</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="/toLogin.mem" class="nav-link p-0">로그인</a></li>
                            <li class="nav-item mb-2"><a href="/signup.mem" class="nav-link p-0">회원가입</a></li>
                            <li class="nav-item mb-2"><a href="/toFindId.mem" class="nav-link p-0">아이디 찾기</a></li>
                            <li class="nav-item mb-2"><a href="/toFindPw.mem" class="nav-link p-0">비밀번호 찾기</a></li>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="col-2">
                <h5>기타</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="/toReviewList.re?curPage=1" class="nav-link p-0">리뷰</a></li>
                    <li class="nav-item mb-2"><a href="/post.po?curPage=1" class="nav-link p-0">자유게시판</a></li>
                </ul>
            </div>

            <div class="col-4 offset-1">
                <form>
                    <h5>영화 리뷰 플랫폼 - 영화 추천이</h5>
                    <p>
                        지금 영화를 리뷰하고,<br> 내 취향에 딱 맞는 영화를 추천받아 보세요!
                    </p>
                    <div class="d-flex w-100 gap-2">
                        <label for="newsletter1" class="visually-hidden">Email
                            address</label> <input id="newsletter1" type="text" class="form-control"
                                                   placeholder="Email address">
                        <button class="btn btn-primary" type="button">영화 추천받기</button>
                    </div>
                </form>

                <div class="snsBox">
                    <div class="snsIcon1">
                        <a href="https://www.kakaocorp.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="kakaoIcon" src="/images/kakaotalk.png">
                        </a>
                    </div>
                    <div class="snsIcon2">
                        <a href="https://twitter.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="twitterIcon" src="/images/twitter.png">
                        </a>
                    </div>
                    <div class="snsIcon3">
                        <a href="https://www.instagram.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="instagramIcon" src="/images/instagram.png">
                        </a>
                    </div>
                    <div class="snsIcon4">
                        <a href="https://www.facebook.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="facebookIcon" src="/images/facebook.png">
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center" id="smallFoot">
            <div class="col-4">
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

            <c:choose>
                <c:when test="${not empty loginSession}">
                    <div class="col-4">
                        <h5>계정</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="/myPage.mem" class="nav-link p-0">마이페이지</a></li>
                            <li class="nav-item mb-2"><a href="/wishlist.wish" class="nav-link p-0">찜 목록</a></li>
                            <c:if test="${loginSession.grade == 'admin'}">
                                <li class="nav-item mb-2"><a href="/lookupMem.admin?curPage=1" class="nav-link p-0">관리자 페이지</a></li>
                            </c:if>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="col-4">
                        <h5>계정</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="/toLogin.mem" class="nav-link p-0">로그인</a></li>
                            <li class="nav-item mb-2"><a href="/signup.mem" class="nav-link p-0">회원가입</a></li>
                            <li class="nav-item mb-2"><a href="/toFindId.mem" class="nav-link p-0">아이디 찾기</a></li>
                            <li class="nav-item mb-2"><a href="/toFindPw.mem" class="nav-link p-0">비밀번호 찾기</a></li>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="col-4">
                <h5>기타</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="/toReviewList.re?curPage=1" class="nav-link p-0">리뷰</a></li>
                    <li class="nav-item mb-2"><a href="/post.po?curPage=1" class="nav-link p-0">자유게시판</a></li>
                </ul>
            </div>

            <div class="col-12 mt-4">
                <form>
                    <h5>영화 리뷰 플랫폼 - 영화 추천이</h5>
                    <p>
                        지금 영화를 리뷰하고,<br> 내 취향에 딱 맞는 영화를 추천받아 보세요!
                    </p>
                    <div class="d-flex w-100 gap-2">
                        <label for="newsletter1" class="visually-hidden">Email
                            address</label> <input id="newsletter1" type="text" class="form-control"
                                                   placeholder="Email address">
                        <button class="btn btn-primary" type="button">영화 추천받기</button>
                    </div>
                </form>

                <div class="snsBox">
                    <div class="snsIcon1">
                        <a href="https://www.kakaocorp.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="kakaoIcon" src="/images/kakaotalk.png">
                        </a>
                    </div>
                    <div class="snsIcon2">
                        <a href="https://twitter.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="twitterIcon" src="/images/twitter.png">
                        </a>
                    </div>
                    <div class="snsIcon3">
                        <a href="https://www.instagram.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="instagramIcon" src="/images/instagram.png">
                        </a>
                    </div>
                    <div class="snsIcon4">
                        <a href="https://www.facebook.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="facebookIcon" src="/images/facebook.png">
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

    $.each($(".avgPoint"), function () {
        let points = $(this).attr('data-value');
        console.log(points)
        points = Math.round(points);
        console.log(points);

        for (let i = 0; i < points; i++) {
            $(this).find('.star').append('★');
        }

        for (let i = 0; i < 5 - points; i++) {
            $(this).find('.star').append('☆');
        }
    });

    $("#toRecentMovie").on("click", () => {
        location.href = '/listLookup.movie?curPage=1';
    })
    $('#toRecentReview').on("click", () => {
        location.href = '/toReviewList.re?curPage=1';
    })
    $('#toRecentTopic').on("click", () => {
        location.href = '/post.po?curPage=1';
    })

    $(document).ready(function () {
        $('.movieDiv').slick({
            infinite: true,
            slidesToShow: 6,
            slidesToScroll: 1,
            prevArrow: "<button type='button' class='slick-prev'><</button>",
            nextArrow: "<button type='button' class='slick-next'>></button>",
            responsive: [
                { // -> 반응형 옵션
                    breakpoint: 1600,
                    settings: {
                        slidesToShow: 5,
                        slidesToScroll: 1,
                        infinite: true
                    }
                },
                { // -> 반응형 옵션
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 1,
                        infinite: true
                    }
                }, { // -> 반응형 옵션
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 1,
                        infinite: true
                    }
                }

            ]
        });
        $('.reviewDiv').slick({
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            prevArrow: "<button type='button' class='slick-prev'><</button>",
            nextArrow: "<button type='button' class='slick-next'>></button>",
            responsive: [
                { // -> 반응형 옵션
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 1,
                        infinite: true
                    }
                }, { // -> 반응형 옵션
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                        infinite: true
                    }
                }

            ]
        });
    });
</script>
</body>
</html>
