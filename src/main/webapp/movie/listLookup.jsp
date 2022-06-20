<%--
  Created by IntelliJ IDEA.
  User: jangseoksu
  Date: 2022/05/30
  Time: 11:11 AM
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
            background-color: black !important;
        }

        footer {
            width: 100%;
            height: 9%;
            background-color: black !important;
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
        .selection {
            margin-top: 20px;
            height: 2%;
            border-radius: 8px;
            background-color: #503396;
            margin-bottom: 20px;
        }

        #selectionDiv1 {
            height: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 60px;
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
            height: 50%;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            padding: 10px;
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
            height: 90%;
            margin-bottom: 20px;
        }

        .movieLi {
            height: 19.8%;
            width: 100%;
        }

        .movie {
            height: 50%;
            width: 33%;
        }

        .movie div {
            padding-left: 70px;
            padding-right: 70px;
        }

        .avgPointImg {
            padding: 1px;
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
            justify-content: space-between;
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
            width: 52%;
            border-radius: 10px;
        }

        .movieCategory {
            width: 300px;
            color: silver;
            font-size: 0.8em;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            text-align: left;
        }


        .avgPointDiv {
            display: flex;
            color: silver;
            font-size: 0.7em;
        }

        .movieAvgPoint {
            height: 8%;
            text-align: right;
            flex-basis: 70px;
        }

        .searchDiv {
            height: 1%;
            display: flex;
            justify-content: center;
            margin: 20px;
            margin-top: 30px;
        }

        #searchBtn2 {
            background-color: #037b94;
            color: white;
            border: none;
            border-radius: 8px;
            flex-basis: 70%;
        }

        #searchInput {
            border-radius: 8px;
            margin-right: 5px;
            flex-basis: 30%;
        }


        @media screen and (max-width: 700px) {
            #selectionDiv1 {
                gap: 20px;
            }

            .movieCategory {
                width: 50px;
            }

        }
        @media screen and (max-width: 992px) {
            .movie {
                display: grid;
                grid-template-columns: repeat(10, 10%);
                grid-template-rows: repeat(10, 10%);
            }
            
            .movieImgDiv img {
				max-width : 200px;
				!important;
			}

            .movie div {
                padding: 0px;
            }

            .movieImgDiv {
                grid-column: 1/4;
                grid-row: 1/11;
            }

            .movieNameDiv {
                grid-column: 5/10;
                grid-row: 2/3;
            }

            .categoryDiv {
                grid-column: 5/10;
                grid-row: 3/4;
            }

            .avgPointDiv {
                grid-column: 5/10;
                grid-row: 4/5;
            }

        }


        @media screen and (max-width: 992px) {
            .movie {
                height: 33.3%;
                width: 50%;
            }
        }

        a {
            text-decoration: none;
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
        #logoutIcon {
            width: 30px;
            height: 30px;
        }
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
                        <li class="nav-item"><a class="nav-link" href="/post.po">자유게시판</a></li>
                        <li class="nav-item"><a class="nav-link" href="/Member/login.jsp">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="/Member/signup.jsp">회원가입</a></li>
                        <li class="nav-item"><a class="nav-link" href="/wishlist.wish">찜한 영화</a></li>
                        <li class="nav-item"><a class="nav-link" href="/Mypage/mypageIndex.jsp">마이페이지</a></li>
                        <c:choose>
                            <c:when test="${empty loginSession}">
                                <li class="nav-item"><a class="nav-link" href="/toLogin.mem">로그인</a></li>
                                <li class="nav-item"><a class="nav-link" href="/toSignUp.mem">회원가입</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item"><a class="nav-link" href="/logout.mem">로그아웃</a></li>
                                <li class="nav-item"><a class="nav-link" href="/wishlist.wish">찜한 영화</a></li>
                                <li class="nav-item"><a class="nav-link" href="/myPage.mem?curPage=1">마이페이지</a></li>
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
                                <a href="logout.mem"><img class="img-fluid" id="logoutIcon"
                                                          src="/images/logout.png"></a>
                                <a href="/wishlist.wish" class=""> <img class="img-fluid" id="cartIcon"
                                                                        src="/images/찜.png">
                                </a>
                                <a href="/myPage.mem?curPage=1" class=""> <img class="img-fluid" id="myPageIcon"
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

<div id="container">
    <div id="titleContainer">
        <div id="titleDiv">
            <span id="title">
                <c:if test="${empty s_type}">
                    전체 영화
                </c:if>
                <c:if test="${s_type eq 'genreAlt'}">
                    ${val} 영화
                </c:if>
                <c:if test="${s_type eq 'movieNm'}">
                    "${val}" 검색 결과 조회
                </c:if>
            </span>
            <span id="movieNum">
                (${totalCount})</span></div>
    </div>
    <div class="selection">
        <div id="selectionDiv1">
            <button type="button" class="selectByCategory" value="전체">전체</button>
            <button type="button" class="selectByCategory" value="코미디">코미디</button>
            <button type="button" class="selectByCategory" value="액션">액션</button>
            <button type="button" class="selectByCategory" value="멜로">멜로</button>
            <button type="button" class="selectByCategory" value="SF">SF</button>
            <button type="button" class="selectByCategory" value="호러">호러</button>
            <button type="button" class="selectByCategory" value="기타">기타</button>
        </div>
        <div id="selectionDiv2">
            <button type="button" id="orderByRecentMovie">최신 영화 순</button>
            <button type="button" id="orderByReviewCount">리뷰 많은 순</button>
            <button type="button" id="orderByHighAveragePoint">높은 평점 순</button>
        </div>
    </div>
    <div id="movieDiv">
        <div class="movieLi row">
            <c:if test="${not empty arrayList}">
                <c:forEach items="${arrayList}" var="movieDTO">
                    <div class="movie col-6 col-lg-4">
                        <div class="movieImgDiv" id="${movieDTO.movieCd}Img">
                            <img src="images/NoImg.webp"/>
                        </div>
                        <div class="movieNameDiv">
                            <span class="movieName">
                                 <a href="/detailView.re?movieCd=${movieDTO.movieCd}">${movieDTO.movieNm}</a>
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
                            <span class="avgPointImg">

                            </span>
                            <c:forEach items="${points}" var="i">
                                <c:if test="${i.key eq movieDTO.movieCd}">
                                        <span class="movieAvgPoint" data-value="${i.value['avg']}">
                                            <fmt:formatNumber value="${i.value['avg']}" type="pattern" pattern="0.00"/> (${i.value['count']})
                                        </span>
                                </c:if>
                            </c:forEach>

                        </div>
                    </div>
                    <script>
                    $.ajax({
                		url : "<c:url value="/MovieServiceJSON"/>",
                		type : "post",
                		dataType : "json",
                		data : {query : '${movieDTO.movieNm}'},
                				success : function(json) {
                					/* $(".movieImgDiv").append('<img src="images/NoImg.webp"/>'); */
                					$.each(json.items,function(i,item) {
                						console.log(item.image);
                						if(item.image){
                							$('.movieLi').find("#${movieDTO.movieCd}Img").empty();
                    						$('.movieLi').find("#${movieDTO.movieCd}Img").append('<img src="' +item.image+ '"/>');
                						}
                						
                												});
                						},error : function(error) {
                							
                							
                						}
                						
                				});
                    </script>
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
            <c:if test="${not empty orderBy}">
                <li class="page-item prevBtn"><a class="page-link"
                                                 href="/orderBy.${orderBy}.movie?s_type=${s_type}&curPage=${hashMap.naviStart-1}&val=${val}"
                                                 data-value="${hashMap.naviStart-1}">Previous</a>
                </li>
                <c:forEach var="pageNum" begin="${hashMap.naviStart}" end="${hashMap.naviEnd}" step="1">
                    <li class="page-item"><a class="page-link"
                                             href="/orderBy.${orderBy}.movie?s_type=${s_type}&curPage=${pageNum}&val=${val}"
                                             data-value="${pageNum}">${pageNum}</a>
                    </li>
                </c:forEach>
                <li class="page-item nextBtn"><a class="page-link"
                                                 href="/orderBy.${orderBy}.movie?s_type=${s_type}&curPage=${hashMap.naviEnd+1}&val=${val}"
                                                 data-value="${hashMap.naviEnd+1}">Next</a>
                </li>
            </c:if>
            <c:if test="${empty orderBy && empty s_type}">
                <li class="page-item prevBtn"><a class="page-link"
                                                 href="listLookup.movie?curPage=${hashMap.naviStart-1}"
                                                 data-value="${hashMap.naviStart-1}">Previous</a>
                </li>
                <c:forEach var="pageNum" begin="${hashMap.naviStart}" end="${hashMap.naviEnd}" step="1">
                    <li class="page-item"><a class="page-link"
                                             href="listLookup.movie?curPage=${pageNum}"
                                             data-value="${pageNum}">${pageNum}</a>
                    </li>
                </c:forEach>
                <li class="page-item nextBtn"><a class="page-link"
                                                 href="listLookup.movie?curPage=${hashMap.naviEnd+1}"
                                                 data-value="${hashMap.naviEnd+1}">Next</a>
                </li>
            </c:if>
            <c:if test="${empty orderBy && not empty s_type}">
                <li class="page-item prevBtn"><a class="page-link"
                                                 href="/search.movie?s_type=${s_type}&curPage=${hashMap.naviStart-1}&val=${val}"
                                                 data-value="${hashMap.naviStart-1}">Previous</a>
                </li>
                <c:forEach var="pageNum" begin="${hashMap.naviStart}" end="${hashMap.naviEnd}" step="1">
                    <li class="page-item"><a class="page-link"
                                             href="/search.movie?s_type=${s_type}&curPage=${pageNum}&val=${val}"
                                             data-value="${pageNum}">${pageNum}</a>
                    </li>
                </c:forEach>
                <li class="page-item nextBtn"><a class="page-link"
                                                 href="/search.movie?s_type=${s_type}&curPage=${hashMap.naviEnd+1}&val=${val}"
                                                 data-value="${hashMap.naviEnd+1}">Next</a>
                </li>
            </c:if>
        </ul>
    </nav>
    <div class="searchDiv">
        <form method="get" class="searchForm" action="/search.movie">
            <input type="text" id="searchInput" class="searchInput" name="val" placeholder="검색">
            <input type="hidden" name = 'curPage' value="1">
            <input type="hidden" name = 's_type' value="movieNm">
            <button type="submit" id="searchBtn2" class="searchBtn">검색</button>
        </form>
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
                            <li class="nav-item mb-2"><a href="/logout.mem" class="nav-link p-0">로그아웃</a></li>
                            <li class="nav-item mb-2"><a href="/myPage.mem?curPage=1" class="nav-link p-0">마이페이지</a></li>
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
                            <li class="nav-item mb-2"><a href="/logout.mem" class="nav-link p-0">로그아웃</a></li>
                            <li class="nav-item mb-2"><a href="/myPage.mem?curPage=1" class="nav-link p-0">마이페이지</a></li>
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

    $(".selectByCategory").on("click", function () {
        let val = $(this).val();
        if (val === '전체') {
            location.href = "/listLookup.movie?curPage=1";
        } else {
            location.href = "/search.movie?s_type=genreAlt&curPage=1&val=" + val;
        }
    });

    $("#orderByRecentMovie").on("click", function () {
        location.href = "/orderBy.recent.movie?s_type=${s_type}&curPage=1&val=${val}";
    });
    $("#orderByReviewCount").on("click", function () {
        location.href = "/orderBy.reviewCount.movie?s_type=${s_type}&curPage=1&val=${val}";
    });
    $("#orderByHighAveragePoint").on("click", function () {
        location.href = "/orderBy.avgPoint.movie?s_type=${s_type}&curPage=1&val=${val}";
    });

    let orderBy = "${orderBy}";

    $(function () {
        console.log(orderBy);
        if (orderBy === 'recent') {
            $('#orderByRecentMovie').css("color", "silver");
        }
        if (orderBy === 'reviewCount') {
            $('#orderByReviewCount').css("color", "silver");
        }
        if (orderBy === 'avgPoint') {
            $('#orderByHighAveragePoint').css("color", "silver");
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
</body>
</html>
