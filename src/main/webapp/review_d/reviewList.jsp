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

        footer {
            width: 100%;
            height: 9%;
            background-color: black;
        }

        #navibar {
            background-color: black;
        }

        #container {
            height: 84%;
            margin-left: 5%;
            margin-right: 5%;
            display: flex;
            flex-direction: column;

        }

        a {
            text-decoration: none;
        }

        #titleDiv {
            height: 2%;
            width: 100%;
            align-items: center;
            background-color: black;
            color: white;
            display: flex;
            justify-content: space-between;
            padding: 10px;
            border-radius: 8px;
        }

        #title {
            font-size: 1.5em;
            font-weight: bold;
        }

        #reviewCount {
            font-size: 0.8em;
            color: silver;
        }

        #titleExplain {
            font-size: 0.8em;
            color: silver;
        }

        #selectionDiv1 {
            margin-top: 20px;
            height: 67px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 60px;
            border-radius: 8px;
            background-color: #503396;
            margin-bottom: 20px;
        }

        #selectionDiv1 button {
            background-color: #503396;
            color: white;
            border: none;
            font-size: 0.8em;
        }

        #selectionDiv1 button:hover {
            color: silver;
        }

        #reviewDiv {
            height: 90%;
        }

        .reviewLi {
            height: 100%;
        }

        .review {
            height: 19%;
            padding: 10px;
            margin: 10px;
            border: 1px solid silver;
            border-radius: 10px;
        }

        .movieDiv {
            display: flex;
            height: 50%;
            margin-bottom: 4px;
            border-bottom: silver 1px solid;
            padding: 7px;
            align-items: center;
        }

        .movieImgDiv {
            flex-basis: 30%;
            padding: 5px;
        }

        .movieDiv img {
            width: 90%;
            height: 90%;
            min-width: 140px;
            min-height: 200px;
        }

        .reviewDiv {
            height: 50%;
            padding: 10px;
        }

        .product {
            flex-basis: 60%;
            display: flex;
        }

        .productDiv1 {
            flex-basis: 70%;
            padding: 5px;
        }

        .productDiv2 {
            padding: 5px;
            flex-basis: 30%;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .product .productDiv1 .productTitle {
            max-width: 150px;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .product .productDiv1 .productCategory {
            font-size: 0.8em;
            color: silver;
        }

        .product .productDiv1 .productAvgPoint {
            font-size: 0.8em;
            color: silver;
        }

        .productDiv2 .directors {
            font-size: 0.8em;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .reviewTitle {
            height: 30%;
            display: flex;
        }

        .reviewTitleDiv1 {
            flex-basis: 70%;
        }

        .reviewTitleDiv2 {
            flex-basis: 30%;
        }

        .reviewPoint {
            color: silver;
            font-size: 0.8em;
        }

        .reviewWrittenDate {
            color: silver;
            font-size: 0.8em;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .reviewContentDiv {
            height: 70%;
        }

        .reviewContent {
            border: 1px solid silver;
            border-radius: 10px;
            height: 80%;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            padding: 5px;
            margin: 5px;
        }

        .reviewLike {
            height: 20%;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            padding: 5px;
            margin: 5px;
            font-size: 0.7em;
            color: silver;
            align-items: center;
        }

        .reviewLike button {
            height: 30px;
            border: none;
            background-color: white;
        }

        .reviewLike .likeBtn:hover {
            color: blue;
        }

        .reviewLike .hateBtn:hover {
            color: red;
        }

        @media screen and (max-width: 700px) {
            #selectionDiv1 {
                gap: 20px;
            }
        }

        @media screen and (max-width: 800px) {
            .movieDiv img {
                height: 108px;
                width: 76px;
            }
        }

        @media screen and (max-width: 992px) {
            .review {
                display: grid;
                grid-template-columns: repeat(10, 10%);
                grid-template-rows: repeat(10, 10%);
                height: 9%;
            }
            .movieImgDiv{
                display: none;
            }

            .movieDiv {
                grid-row: 1/11;
                grid-column: 1/3;
                height: 100%;
                border: none;
            }

            .reviewPoint {
                display: flex;
                gap: 5px;
            }

            .reviewDiv {
                grid-row: 1/11;
                grid-column: 5/11;
                height: 100%;
            }
        }

        /*
            .contents {
                height: 500px;
            } */

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
        @media ( max-width : 768px) {
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

        @media ( min-width : 768px) {
            #navibar {
                display: none;
            }
        }
        /* header 반응형 끝 */

        /* footer 반응형 시작 */
        @media ( max-width : 768px) {
            #bigFoot {
                display: none;
            }
        }

        @media ( min-width : 768px) {
            #smallFoot {
                display: none;
            }
        }

        /* footer 반응형 끝 */


        .pagination {
            margin: 20px;
        }
    </style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<body>
<header class="mb-3 border-bottom">
    <div class="container">
        <!-- 접혔을 때 nav -->
        <nav id="navibar" class="navbar navbar-expand-md navbar-dark" aria-label="Main navigation">
            <div class="container-fluid">
                <!-- toggle button -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
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
                                <li class="nav-item"><a class="nav-link" href="/myPage.mem">마이페이지</a></li>
                            </c:otherwise>
                        </c:choose>


                    </ul>

                    <form class="searchForm d-flex" method="get" action="/search.movie">
                        <input class="searchInput form-control me-2" type="search" placeholder="영화 검색.." aria-label="Search" name='val'> <input
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
                                <a href="/wishlist.wish" class=""> <img class="img-fluid" id="cartIcon" src="/images/찜.png">
                                </a>
                                <a href="/myPage.mem" class=""> <img class="img-fluid" id="myPageIcon" src="/images/마이페이지.png">
                                </a>
                            </c:if>
                        </div>

                        <div class="col-1">
                            <button id="searchBtn" class="btn" type="button" data-bs-toggle="modal" data-bs-target="#searchModal">
                                <img src="/images/searchIcon.png">
                            </button>
                        </div>
                        <form class="searchForm d-flex" method="get" action="/search.movie">
                            <div class="modal fade" id="searchModal" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title m-auto">영화 찾기</h5>
                                            <button type="button" class="btn-close m-0" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="searchForm" class="searchForm">
                                                <div class="row justify-content-center">
                                                    <div class="col-11">
                                                        <input class="searchInput form-control me-2" type="search" placeholder="영화 검색.." aria-label="Search" name='val'>
                                                        <p class="text-black-50 text-center mt-3">찾으시는 영화가 있으신가요? 검색어를 입력해보세요!</p>
                                                        <input type="hidden" name='curPage' value="1"> <input type="hidden" name='s_type' value="movieNm">
                                                    </div>
                                                </div>
                                                <div class="row justify-content-end">
                                                    <div class="col-3">
                                                        <button class="searchBtn btn btn-outline-success" type="submit">Search</button>
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

<div id="container">
    <div id="titleDiv">
        <div class="title">
				<span id='title'>
                    <c:if test="${empty s_type}">
                        전체 영화 리뷰
                    </c:if>
                    <c:if test="${s_type eq 'genreAlt'}">
                        ${val} 영화 리뷰
                    </c:if>
				</span><span id='reviewCount'>(${totalCnt})</span>
        </div>
        <div id="titleExplain">
            최근에 작성된 리뷰를 확인해보세요!<br/>의외로 재밌는 작품을 찾으실지도 모릅니다!
        </div>
    </div>
    <div id="selectionDiv1">
        <button type="button" class="selectByCategory" value="전체">전체</button>
        <button type="button" class="selectByCategory" value="코미디">코미디</button>
        <button type="button" class="selectByCategory" value="액션">액션</button>
        <button type="button" class="selectByCategory" value="멜로">멜로</button>
        <button type="button" class="selectByCategory" value="SF">SF</button>
        <button type="button" class="selectByCategory" value="호러">호러</button>
        <button type="button" class="selectByCategory" value="기타">기타</button>
    </div>
    <div id="reviewDiv">
        <div class="reviewLi row d-flex justify-content-center align-content-start">
            <c:if test="${not empty arrayList}">
                <c:forEach items="${arrayList}" var="reviewDTO">
                    <div class="review col-11 col-lg-5">
                        <div class="movieDiv">
                            <c:forEach items="${movies}" var="movie">
                                <c:if test="${reviewDTO.movieCd eq movie.key}">
                                    <div class="movieImgDiv">
                                        <a href="/detailView.re?movieCd=${reviewDTO.movieCd}"><img
                                                src="/images/NoImg.webp"></a>

                                    </div>
                                    <div class="product">
                                        <div class="productDiv1">
                                            <div class="productTitle">
                                                <a href="/detailView.re?movieCd=${reviewDTO.movieCd}">${movie.value['movieDTO'].movieNm}</a>
                                            </div>
                                            <div class="productCategory">${movie.value['movieDTO'].genreAlt}</div>
                                            <div class="productAvgPoint">
                                                <div class="avgPointStar"></div>
                                                <div class="avgPointNum" data-value='${movie.value}'>
                                                    <fmt:formatNumber value="${movie.value['avg']}" type="pattern"
                                                                      pattern="0.00"/>
                                                    (${movie.value['count']})
                                                </div>
                                            </div>
                                        </div>
                                        <div class="productDiv2">
                                            <span class="directors">${movie.value['movieDTO'].directors}</span>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="reviewDiv">
                            <div class="reviewTitle">
                                <div class="reviewTitleDiv1">
                                    <div class="reviewId">${reviewDTO.user_nickname}</div>
                                    <div class="reviewPoint">
                                        <div class="reviewPointStar"></div>
                                        <div class="reviewPointNum" data-value='${reviewDTO.r_grade}'>
                                            <fmt:formatNumber value="${reviewDTO.r_grade}" type="pattern"
                                                              pattern="0.00"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="reviewTitleDiv2">
                                    <div class="reviewWrittenDate">${reviewDTO.r_date}</div>
                                </div>
                            </div>
                            <div class="reviewContentDiv">
                                <div class="reviewContent">${reviewDTO.r_content}</div>
                                <div class="reviewLike">
                                    <c:forEach items="${likes}" var="like">
                                        <c:if test="${reviewDTO.seq_review eq like.key}">
                                            <input type="hidden" value="${like.value['status']}" class="likeStatus">
                                            <span class="likeSpan">${like.value['like']}</span>
                                            <button type='button' class='likeBtn' value="${reviewDTO.seq_review}">좋아요
                                            </button>
                                            <span class="hateSpan">${like.value['hate']}</span>
                                            <button type="button" class="hateBtn" value="${reviewDTO.seq_review}">싫어요
                                            </button>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty arrayList}">
                <div class="noResult d-flex justify-content-center">조회된 결과가 없습니다.</div>
            </c:if>
        </div>
    </div>
    <nav aria-label="PageNav">
        <ul class="pagination d-flex justify-content-center">
            <c:if test="${empty s_type}">
                <li class="page-item prevBtn"><a class="page-link"
                                                 href="/toReviewList.re?curPage=${hashMap.naviStart-1}"
                                                 data-value="${hashMap.naviStart-1}">Previous</a></li>
                <c:forEach var="pageNum" begin="${hashMap.naviStart}" end="${hashMap.naviEnd}" step="1">
                    <li class="page-item"><a class="page-link" href="/toReviewList.re?curPage=${pageNum}"
                                             data-value="${pageNum}">${pageNum}</a>
                    </li>
                </c:forEach>
                <li class="page-item nextBtn"><a class="page-link" href="/toReviewList.re?curPage=${hashMap.naviEnd+1}"
                                                 data-value="${hashMap.naviEnd+1}">Next</a></li>
            </c:if>
            <c:if test="${s_type eq 'genreAlt'}">
                <li class="page-item prevBtn"><a class="page-link"
                                                 href="/show.re?s_type=${s_type}&curPage=${hashMap.naviStart-1}&val=${val}"
                                                 data-value="${hashMap.naviStart-1}">Previous</a>
                </li>
                <c:forEach var="pageNum" begin="${hashMap.naviStart}" end="${hashMap.naviEnd}" step="1">
                    <li class="page-item"><a class="page-link"
                                             href="/show.re?s_type=${s_type}&curPage=${pageNum}&val=${val}"
                                             data-value="${pageNum}">${pageNum}</a></li>
                </c:forEach>
                <li class="page-item nextBtn"><a class="page-link"
                                                 href="/show.re?s_type=${s_type}&curPage=${hashMap.naviEnd+1}&val=${val}"
                                                 data-value="${hashMap.naviEnd+1}">Next</a></li>
            </c:if>
        </ul>
    </nav>
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
    $(".selectByCategory").on("click", function () {
        let val = $(this).val();
        if (val === '전체') {
            location.href = "/toReviewList.re?curPage=1";
        } else {
            location.href = "/show.re?s_type=genreAlt&curPage=1&val="
                + val;
        }
    });

    const searchForm = $(".searchForm");
    searchForm.on("submit", function (event) {
        if ($(this).find(".searchInput").val() === "") {
            event.preventDefault();
            alert("검색어를 입력하세요");
        }
    });

    let prevBtn = ${hashMap.prevBtn};
    if (!prevBtn) {
        $(".prevBtn").addClass("disabled");
    }

    let nextBtn = ${hashMap.nextBtn};
    if (!nextBtn) {
        $(".nextBtn").addClass("disabled");
    }

    $.each($(".productAvgPoint .avgPointNum"), function () {
        let val = $(this).attr("data-value");
        val = Math.round(val);

        for (let i = 0; i < val; i++) {
            $(this).siblings('.avgPointStar')[0].append('★');
        }

        for (let i = 0; i < 5 - val; i++) {
            $(this).siblings('.avgPointStar')[0].append('☆');
        }
    });

    $.each($(".reviewPoint .reviewPointNum"), function () {
        let val = $(this).attr("data-value");
        val = Math.round(val);

        for (let i = 0; i < val; i++) {
            $(this).siblings('.reviewPointStar')[0].append('★');
        }

        for (let i = 0; i < 5 - val; i++) {
            $(this).siblings('.reviewPointStar')[0].append('☆');
        }
    });

    $.each($(".likeStatus"), function () {
        let val = $(this).val();
        if (val === '1') {
            $(this).siblings(".likeBtn").addClass('active');
            $(this).siblings(".likeBtn").css("color", "blue");
        } else if (val === '2') {
            $(this).siblings(".hateBtn").addClass('active');
            $(this).siblings(".hateBtn").css("color", "red");
        }
    });

    $(".likeBtn").on("click", function (a) {
        let user_category = "${loginSession.user_category}";
        let user_id = "${loginSession.user_id}";
        let seq_review = $(this).val();
        let likeSpan = $(this).siblings(".likeSpan");
        let hateSapn = $(this).siblings(".hateSpan");

        if (user_id !== "") {
            if ($(this).hasClass('active')) {
                $(this).removeClass('active');
                $(this).css("color", "black");
                $(this).siblings(".likeStatus").val("0");
                let form = $("<form>")
                seq_review = $("<input>", {
                    type: 'hidden',
                    value: seq_review,
                    name: "seq_review"
                });
                form.append(seq_review);
                $("body").append(form);
                let data = form.serialize();

                $.ajax({
                    data: 'json',
                    url: '/likeCancle.reviewList.likeR',
                    data: data,
                    method: 'post',
                    success: function (data) {
                        data = JSON.parse(data);
                        likeSpan.html(data.like);
                        hateSapn.html(data.hate);
                    },
                    error: function (e) {
                        console.log(e);
                    }

                });
            } else {
                $(this).addClass('active');
                $(this).css('color', 'blue');
                $(this).siblings(".hateBtn").removeClass('active');
                $(this).siblings(".hateBtn").css('color', 'black');

                let form = $("<form>")
                seq_review = $("<input>", {
                    type: 'hidden',
                    value: seq_review,
                    name: "seq_review"
                });
                form.append(seq_review);
                $("body").append(form);
                let data = form.serialize();

                $.ajax({
                    data: 'json',
                    url: '/like.reviewList.likeR',
                    data: data,
                    method: 'post',
                    success: function (data) {
                        data = JSON.parse(data);
                        likeSpan.html(data.like);
                        hateSapn.html(data.hate);
                    },
                    error: function (e) {
                        console.log(e);
                    }

                });
            }
        } else {
            alert("회원에게만 제공되는 기능입니다.");
        }
    });

    $(".hateBtn").on("click", function (a) {
        let user_category = "${loginSession.user_category}";
        let user_id = "${loginSession.user_id}";
        let seq_review = $(this).val();
        let likeSpan = $(this).siblings(".likeSpan");
        let hateSapn = $(this).siblings(".hateSpan");

        if (user_id !== "") {
            if ($(this).hasClass('active')) {
                $(this).removeClass('active');
                $(this).css("color", "black");
                $(this).siblings(".likeStatus").val("0");
                let form = $("<form>")
                seq_review = $("<input>", {
                    type: 'hidden',
                    value: seq_review,
                    name: "seq_review"
                });
                form.append(seq_review);
                $("body").append(form);
                let data = form.serialize();

                $.ajax({
                    data: 'json',
                    url: '/hateCancle.reviewList.likeR',
                    data: data,
                    method: 'post',
                    success: function (data) {
                        data = JSON.parse(data);
                        likeSpan.html(data.like);
                        hateSapn.html(data.hate);
                    },
                    error: function (e) {
                        console.log(e);
                    }

                });
            } else {
                $(this).addClass('active');
                $(this).css('color', 'red');
                $(this).siblings(".likeBtn").removeClass('active');
                $(this).siblings(".likeBtn").css('color', 'black');

                let form = $("<form>")
                seq_review = $("<input>", {
                    type: 'hidden',
                    value: seq_review,
                    name: "seq_review"
                });
                form.append(seq_review);
                $("body").append(form);
                let data = form.serialize();

                $.ajax({
                    data: 'json',
                    url: '/hate.reviewList.likeR',
                    data: data,
                    method: 'post',
                    success: function (data) {
                        data = JSON.parse(data);
                        likeSpan.html(data.like);
                        hateSapn.html(data.hate);
                    },
                    error: function (e) {
                        console.log(e);
                    }

                });
            }
        } else {
            alert("회원에게만 제공되는 기능입니다.");
        }
    });
</script>
</body>
</html>
