<%--
  Created by IntelliJ IDEA.
  User: jangseoksu
  Date: 2022/05/30
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        body {
            height: 4000px;
        }

        * {
            box-sizing: border-box;
        }

        header {
            height: 3.075%;
            background-color: black;
        }

        footer {
            height: 9%;
            background-color: black;
        }

        .container {
            height: 87.925%;
            width: 100%;
            padding-bottom: 12px;
        }

        #titleContainer {
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

        #titleDiv {

        }

        #titleDiv #title {
            font-size: 1.5em;
            font-weight: bold;
        }

        #titleDiv #movieNum {
            font-size: 0.8em;
            color: silver;
        }

        #searchBtn {
            background-color: #037b94;
            color: white;
            border: none;
            border-radius: 8px;
        }

        #searchInput {
            border-radius: 8px;
            margin-right: 5px;
        }

        #selectionDiv1 {
            margin-top: 20px;
            height: 1%;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 60px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            background-color: #503396;
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

        #selectionDiv2 {
            height: 1%;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            background-color: #503396;
            padding: 10px;
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
            margin-bottom: 20px;
        }

        #selectionDiv2 button {
            background-color: #503396;
            color: white;
            border: none;
            font-size: 0.8em;
        }

        #selectionDiv2 button:hover {
            color: silver;
        }

        #movieDiv {
            height: 93%;
        }

        .movieLi {
            height: 19.8%;
            width: 100%;
        }

        .pagingDiv {
            height: 1%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            background-color: black;
            border-radius: 8px;
        }

        .movie {
            height: 50%;
            width: 33%;
        }

        @media screen and (max-width: 992px) {
            .movie {
                height: 33.3%;
                width: 50%;
            }
        }

        .movie .movieImgDiv {
            height: 72%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
        }

        .movieNameDiv {
            height: 10%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 5px;
            gap: 10px;
        }

        .movieNameDiv a {
            flex-basis: 200px;
            color: black;
            text-decoration: none;
        }

        .movieName {
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .directors {
            display: block;
            flex-basis: 100px;
            color: silver;
            font-size: 0.8em;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .movie .movieImgDiv img {
            height: 100%;
            border-radius: 10px;
        }

        .movieCategory {
            width: 300px;
            height: 10%;
            color: silver;
            font-size: 0.8em;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            text-align: right;
        }

        .movieAvgPoint {
            height: 8%;
            color: silver;
            font-size: 0.7em;
            text-align: right;
        }

        a {
            text-decoration: none;
        }

        /*
        .contents {
            height: 500px;
        } */

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

        /* Footer */
        .nav-link {
            color: gray !important;
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

        .pagination {
            margin: 20px;
        }
    </style>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.js"
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
<body>
<header class="mb-3 border-bottom">
    <div class="container">
        <nav
                id="navibar"
                class="navbar navbar-expand-lg navbar-dark"
                aria-label="Main navigation">
            <div class="container-fluid">
                <!-- toggle button -->
                <button
                        class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarNavDropdown"
                        aria-controls="navbarNavDropdown"
                        aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- 메뉴 -->
                <div
                        class="collapse navbar-collapse justify-content-end"
                        id="navbarNavDropdown">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="/listLookup.movie?curPage=1">영화</a>
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
                        <input
                                class="form-control me-2"
                                type="search"
                                placeholder="Search"
                                aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>

                </div>
            </div>
        </nav>

        <nav
                id="menu"
                class="navbar navbar-expand-lg w-100 navbar-dark"
                aria-label="Main navigation">
            <div class="row w-100 align-items-center">
                <div class="col-5 d-flex justify-content-center">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="/listLookup.movie?curPage=1">영화</a>
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
                    <a
                            href="/"
                            class="d-flex align-items-center justify-content-start mb-2 mb-lg-0">
                        <img id="navLogo" src="/images/logo3.png">
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
                                <img class="img-fluid" id="cartIcon" src="/images/찜.png">
                                <!-- <p class="text-light" id="cart">찜한 영화</p> -->
                            </a>
                            <a href="" class="align-items-center">
                                <img class="img-fluid" id="myPageIcon" src="/images/마이페이지.png">
                                <!-- <p class="text-light" id="myPage">마이페이지</p> -->
                            </a>
                        </div>
                        <div class="col-5">
                            <form class="d-flex">
                                <input
                                        class="form-control me-2"
                                        type="search"
                                        placeholder="Search"
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
<div class="container">
    <div id="titleContainer">
        <div id="titleDiv">
            <span id="title">영화 목록</span>
            <span id="movieNum">
                (xxx)</span></div>
        <div id="searchDiv">
            <input type="text" id="searchInput" placeholder="검색">
            <button type="button" id="searchBtn">검색</button>
        </div>
    </div>
    <div id="selectionDiv1">
        <button type="button" class="selectByCategory" value = "코믹">코믹</button>
        <button type="button" class="selectByCategory" value = "액션">액션</button>
        <button type="button" class="selectByCategory" value = "멜로">멜로</button>
        <button type="button" class="selectByCategory" value = "SF">SF</button>
        <button type="button" class="selectByCategory" value = "호러">호러</button>
        <button type="button" class="selectByCategory">기타</button>
    </div>
    <div id="selectionDiv2">
        <button type="button" id="selectByReviewCount">리뷰 많은 순</button>
        <button type="button" id="selectByHighAveragePoint">높은 평점 순</button>
    </div>
    <div id="movieDiv">
        <div class="movieLi row">
            <c:if test="${not empty arrayList}">
                <c:forEach items="${arrayList}" var="movieDTO">
                    <div class="movie col-6 col-lg-4">
                        <div class="movieImgDiv">
                            <img src="/NoImg.webp">
                        </div>
                        <div class="movieNameDiv">
                            <span class="movieName">
                                 <a href="">${movieDTO.movieNm}</a>
                            </span>
                            <c:if test="${not empty movieDTO.directors}">
                                <span class="directors">${movieDTO.directors}</span>"
                            </c:if>
                            <c:if test="${empty movieDTO.directors}">
                                <span class="directors">등록된 감독이 없습니다</span>"
                            </c:if>
                        </div>
                        <div class="categoryDiv">
                            <span class="movieCategory">${movieDTO.genreAlt}</span>
                        </div>
                        <div class="avgPointDiv">
                            <span class="movieAvgPoint">5.0</span>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty arrayList}">
                <div class="col-12">
                    조회 결과가 없습니다.
                </div>
            </c:if>
        </div>
    </div>
    <nav aria-label="PageNav">
        <ul class="pagination d-flex justify-content-center">
            <li class="page-item prevBtn"><a class="page-link" href="/listLookup.movie?curPage=${hashMap.naviStart-1}">Previous</a>
            </li>
            <c:forEach var="pageNum" begin="${hashMap.naviStart}" end="${hashMap.naviEnd}" step="1">
                <li class="page-item"><a class="page-link" href="/listLookup.movie?curPage=${pageNum}">${pageNum}</a>
                </li>
            </c:forEach>
            <li class="page-item nextBtn"><a class="page-link" href="/listLookup.movie?curPage=${hashMap.naviEnd+1}">Next</a>
            </li>
        </ul>
    </nav>
</div>
<footer class="py-5 text-light">
    <div class="container">
        <div class="row">
            <div class="col-2">
                <h5>장르</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2">
                        <a href="#" class="nav-link p-0">코믹</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="#" class="nav-link p-0">액션</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="#" class="nav-link p-0">멜로</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="#" class="nav-link p-0">SF</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="#" class="nav-link p-0">호러</a>
                    </li>
                </ul>
            </div>

            <div class="col-2">
                <h5>계정</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2">
                        <a href="#" class="nav-link p-0">로그인</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="#" class="nav-link p-0">회원가입</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="#" class="nav-link p-0">마이페이지</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="#" class="nav-link p-0">아이디 찾기</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="#" class="nav-link p-0">비밀번호 찾기</a>
                    </li>
                </ul>
            </div>

            <div class="col-2">
                <h5>기타</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2">
                        <a href="#" class="nav-link p-0">리뷰</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="#" class="nav-link p-0">자유게시판</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="#" class="nav-link p-0">찜 목록</a>
                    </li>
                </ul>
            </div>

            <div class="col-4 offset-1">
                <form>
                    <h5>영화 리뷰 플랫폼 - 영화 추천이</h5>
                    <p>지금 영화를 리뷰하고,<br>
                        내 취향에 딱 맞는 영화를 추천받아 보세요!</p>
                    <div class="d-flex w-100 gap-2">
                        <label for="newsletter1" class="visually-hidden">Email address</label>
                        <input
                                id="newsletter1"
                                type="text"
                                class="form-control"
                                placeholder="Email address">
                        <button class="btn btn-primary" type="button">영화 추천받기</button>
                    </div>
                </form>

                <div class="snsBox">
                    <div class="snsIcon1">
                        <a
                                href="https://www.kakaocorp.com/"
                                class="d-flex align-items-center mb-2 mb-lg-0">
                            <img id="kakaoIcon" src="/images/">
                        </a>
                    </div>
                    <div class="snsIcon2">
                        <a href="https://twitter.com/" class="d-flex align-items-center mb-2 mb-lg-0">
                            <img id="twitterIcon" src="/images/twitter.png">
                        </a>
                    </div>
                    <div class="snsIcon3">
                        <a
                                href="https://www.instagram.com/"
                                class="d-flex align-items-center mb-2 mb-lg-0">
                            <img id="instagramIcon" src="/images/instagram.png">
                        </a>
                    </div>
                    <div class="snsIcon4">
                        <a
                                href="https://www.facebook.com/"
                                class="d-flex align-items-center mb-2 mb-lg-0">
                            <img id="facebookIcon" src="/images/facebook.png">
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="d-flex justify-content-center py-4 my-4 border-top">
            <p>&copy; 영화 리뷰 플랫폼, 영화 추천이 All rights reserved.</p>
            <!-- <ul class="list-unstyled d-flex"> <li class="ms-3"><a class="link-dark"
            href="#"><svg class="bi" width="24" height="24"> 트위터 </svg></a></li> <li
            class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24"
            height="24"> 인스타그램 </svg></a></li> <li class="ms-3"><a class="link-dark"
            href="#"><svg class="bi" width="24" height="24"> 페이스북 </svg></a></li> </ul> -->
        </div>
    </div>
</footer>
<script>
    let prevBtn = ${hashMap.prevBtn};
    if (!prevBtn) {
        $(".prevBtn").addClass("disabled");
    }

    let nextBtn = ${hashMap.nextBtn};
    if (!nextBtn) {
        $(".nextBtn").addClass("disabled");
    }

    $(".selectByCategory").on("click", function (){
        let val = $(this).val();
        location.href = "/search.movie?genreAlt="+val;
    });
</script>
</body>
</html>
