<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>MypagePopup</title>

    <style>

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
            color: gray;
            text-decoration: none;
        }

        .nav-link:hover {
            color: white;
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

        /* Contents */
        .contents{
            background-color: rgb(237, 241, 244);
        }
        .contentsBox{
            width: 1500px;
            height: 1160px;
            background-color: white;
            border-radius: 10px;
            position: relative;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
        }
        .contentsImgBox{
            width: 80px;
            height: 80px;
            background-color: rgb(237, 241, 244);
            overflow: hidden;
            border-radius: 30%;
            position: relative;
            top: 10px;
            left: 50%;
            transform: translateX(-50%);
        }
        .profileImg{
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .contentsBox > .btn{
            float: right;
            margin: 5px;
        }
        .contentsModify{
            text-align: left;
        }
        .contentsModifyBox{
            margin: 20px;
        }
        .btn-outline-info{
            float: right;
        }
    </style>
</head>

<body>

    <!-- Header -->
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
                                <c:when test="${not empty loginSession}">
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

    <!-- Contents -->
    <div class="contents">
        <div class="contents row text-black">
            <div class="contentsBox">
                <div class="contentsModifyBox">
                    <div class="contentsModify">
                        <div class="container w-50">
						  <form id="checkIdForm" action="/checkNickname.mem" method="get">
								<div class='container'>
									<div class="row m-3 justify-content-center">
										<div class="col-6 m-2">
											<input type="text" class="form-control" id="nickname" value="${nickname}" name="nickname" placeholder="nickname 입력">
										</div>
										<div class="col-3 m-2">
											<button type="button" class='btn btn-success' id="checkNickname">중복확인</button>
										</div>
									</div>
									<div class="row m-2 justify-content-start">
										<div class="col-4">
											<span>확인결과 : </span>
										</div>
										<div class="col-8">
											<c:if test="${rs eq 'ok'}">
												<span>사용 가능한 닉네임입니다.</span>
											</c:if>
											<c:if test="${rs eq 'no'}">
												<span>사용 불가한 닉네임입니다.</span>
											</c:if>
										</div>
									</div>
									<div class="row m-2 justify-content-center">
										<div class="col-4 d-flex justify-content-end">
											<button type="button" class="btn btn-primary" id="useBtn" disabled>사용</button>
										</div>
										<div class="col-4 d-flex justify-content-start">
											<button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
										</div>
									</div>
								</div>
							</form>
							<script>
								// 중복확인 버튼을 눌렀을 때 nickname값이 유효한 값이 체크 후에 서버로 중복확인 요청
								$("#checkNickname").on("click", function(){
									let regexNickname = /[a-zA-Z0-9ㄱ-힣]{4,8}/; // 닉네임 정규식
									if(!regexNickname.test($("#nickname").val())){
										alert("형식에 맞지 않는 닉네임입니다.");
										return; // return 을 만나면 그 즉시 함수가 종료 
									}
									$("#checkNicknameForm").submit();
								})	
							
								let useBtn = document.getElementById("useBtn");
							
								console.log("${rs}");
								if("${rs}" === "ok"){ // 사용 가능한 닉네임이라면
									useBtn.disabled = false; // disabled 속성 해지
								}else{
									useBtn.disabled = true; // disabled 속성 적용 
								}
								
							
								useBtn.onclick = function(){ // 사용버튼 클릭	
									let regexNickname = /[a-zA-Z0-9ㄱ-힣]{4,8}/; // 닉네임 정규식
									if(!regexId.test($("#nickname").val())){
										alert("형식에 맞지 않는 닉네임입니다.");
										useBtn.disabled = true;
										return; // return 을 만나면 그 즉시 함수가 종료 
									}
									
									// 1. 팝업창을 열어줬던 부모창(opener)의 nickname input칸에 사용자가 입력한 nickname를 전달.
									// 2. 팝업창을 닫음.
									// 왼쪽은 부모창(회원가입)의 nickname input요소     오른쪽은 팝업창의 nickname input요소 
									opener.document.getElementById("nickname").value = document.getElementById("nickname").value;
									self.close(); // 내 자신 창을 닫겠다. 
								}
								
								document.getElementById("cancelBtn").onclick = function(){
									self.close(); // 취소버튼 클릭 시 팝업 창닫기
								}
							</script>
                        </div>
                    </div>
                </div>
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

                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-2">
                            <h5>계정</h5>
                            <ul class="nav flex-column">
                                <li class="nav-item mb-2"><a href="/toLogin.mem" class="nav-link p-0">로그인</a></li>
                                <li class="nav-item mb-2"><a href="/signup.mem" class="nav-link p-0">회원가입</a></li>
                                <li class="nav-item mb-2"><a href="/myPage.mem" class="nav-link p-0">마이페이지</a></li>
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

                <div class="col-4">
                    <h5>계정</h5>
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2"><a href="/toLogin.mem" class="nav-link p-0">로그인</a></li>
                        <li class="nav-item mb-2"><a href="/signup.mem" class="nav-link p-0">회원가입</a></li>
                        <li class="nav-item mb-2"><a href="/myPage.mem" class="nav-link p-0">마이페이지</a></li>
                        <li class="nav-item mb-2"><a href="/toFindId.mem" class="nav-link p-0">아이디 찾기</a></li>
                        <li class="nav-item mb-2"><a href="/toFindPw.mem" class="nav-link p-0">비밀번호 찾기</a></li>
                    </ul>
                </div>

                <div class="col-4">
                    <h5>기타</h5>
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2"><a href="/toReviewList.re?curPage=1" class="nav-link p-0">리뷰</a></li>
                        <li class="nav-item mb-2"><a href="/post.po?curPage=1" class="nav-link p-0">자유게시판</a></li>
                        <li class="nav-item mb-2"><a href="/wishlist.wish" class="nav-link p-0">찜 목록</a></li>
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
    </script>
</body>

</html>