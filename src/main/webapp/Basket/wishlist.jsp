<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<title>Wish List</title>

<style>
body {
	background-color: black;
}

a {
	text-decoration: none;
}

/* header */
#navLogo {
	width: 90%;
	height: 90%;
}

#cart {
	display: none;
}

#myPage {
	display: none;
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
@media ( max-width : 1180px) {
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

@media ( min-width : 1180px) {
	#navibar {
		display: none;
	}
}

/* contents 영역 */
section#container {
	background: #ddf;
}

div.content {
	background: #eee;
}

section#container, div.content, aside#aside {
	padding: 10px;
}

div.content {
	width: 80%;
	float: right;
}

aside#aside {
	background: #fef;
	/* position: fixed;
            width: 17%; */
	width: 20%;
	float: left;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

/* clear:both를 통해 플롯 초기화해야 레이아웃 안깨짐
        https://kuzuro.blogspot.com/2018/08/blog-post_18.html 참고 */
@media screen and (max-width: 650px) {
	div.content, aside#aside {
		width: calc(100% - 20px);
		float: none;
	}
}

#aside #profile {
	border: 1px solid grey;
	border-radius: 30px;
	/* height: 400px; */
	width: 100%;
	margin: 0;
}

#box {
	background: white;
	border-radius: 50%;
	width: 200px;
	height: 200px;
}

#box>img {
	width: 100%;
	height: 100%;
}

.profileBtn {
	padding: 10px;
	border-radius: 10px;
	width: 80%;
}

.posters {
	width: 80%;
	height: 80%;
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
    </header>

    <!-- Contents -->
    <div class="container">
        <div class="contents">
            <section id="container">
                <aside id="aside" class="p-3">
                    <div class="row justify-content-center" id="profile">
                        <div class="col-12 mt-4" id="box">
                            <img src="images/오구3.gif">
                        </div>

                        <div class="col-12 d-flex justify-content-center">
                            <h4>홍길동 님</h4>
                        </div>

                        <div class="col-12 d-flex justify-content-center">
                            <p>어서오세요!</p>
                        </div>
                    </div>

                    <div class="row justify-content-center">
                        <button type="button" class="profileBtn btn btn-secondary my-3">정보 수정</button>
                        <button type="button" class="profileBtn btn btn-secondary mb-3">내가 쓴 게시글</button>
                        <button type="button" class="profileBtn btn btn-secondary mb-3">내가 쓴 리뷰</button>
                    </div>
                </aside>
                <div class="content">
                    <div class="row p-3">
                        <div class="col-8">
                            <span class="fs-4">내가 찜한 영화</span>
                            <span class="fs-6 text-secondary">3건</span>
                        </div>
                        <div class="col-2">
                            <select class="form-select" aria-label="Default select example">
                                <option selected>등록순</option>
                                <option value="1">이름순</option>
                                <option value="2">최신영화순</option>
                            </select>
                        </div>
                        <div class="col-2">
                            <button type="button" class="btn btn-secondary">확인</button>
                        </div>
                    </div>

                    <div class="row mb-5">
                        <div class="col-4">
                            <img class="posters" src="images/어벤져스.jpg">
                            <p class="m-0">어벤져스</p>
                            <p class="text-secondary m-0">2022.01.01 개봉</p>
                            <button type="button" class="btn btn-secondary">리뷰보기</button>
                            <button type="button" class="btn btn-secondary">삭제하기</button>
                        </div>
                        <div class="col-4">
                            <img class="posters" src="images/어벤져스.jpg">
                            <p class="m-0">어벤져스</p>
                            <p class="text-secondary m-0">2022.01.01 개봉</p>
                            <button type="button" class="btn btn-secondary">리뷰보기</button>
                            <button type="button" class="btn btn-secondary">삭제하기</button>
                        </div>
                        <div class="col-4">
                            <img class="posters" src="images/어벤져스.jpg">
                            <p class="m-0">어벤져스</p>
                            <p class="text-secondary m-0">2022.01.01 개봉</p>
                            <button type="button" class="btn btn-secondary">리뷰보기</button>
                            <button type="button" class="btn btn-secondary">삭제하기</button>
                        </div>
                    </div>

                    <div class="row mb-5">
                        <div class="col-4">
                            <img class="posters" src="images/어벤져스.jpg">
                            <p class="m-0">어벤져스</p>
                            <p class="text-secondary m-0">2022.01.01 개봉</p>
                            <button type="button" class="btn btn-secondary">리뷰보기</button>
                            <button type="button" class="btn btn-secondary">삭제하기</button>
                        </div>
                        <div class="col-4">
                            <img class="posters" src="images/어벤져스.jpg">
                            <p class="m-0">어벤져스</p>
                            <p class="text-secondary m-0">2022.01.01 개봉</p>
                            <button type="button" class="btn btn-secondary">리뷰보기</button>
                            <button type="button" class="btn btn-secondary">삭제하기</button>
                        </div>
                        <div class="col-4">
                            <img class="posters" src="images/어벤져스.jpg">
                            <p class="m-0">어벤져스</p>
                            <p class="text-secondary m-0">2022.01.01 개봉</p>
                            <button type="button" class="btn btn-secondary">리뷰보기</button>
                            <button type="button" class="btn btn-secondary">삭제하기</button>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>


    <!-- Footer -->
    <footer class="py-5 text-light">
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
                <!-- <ul class="list-unstyled d-flex">
                            <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24">
                                        트위터
                                    </svg></a></li>
                            <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24">
                                        인스타그램
                                    </svg></a></li>
                            <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24">
                                        페이스북
                                    </svg></a></li>
                        </ul> -->
            </div>
        </div>

    </footer>
    
    <script>
    
    </script>
</body>
</html>