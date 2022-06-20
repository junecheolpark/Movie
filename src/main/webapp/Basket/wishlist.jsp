<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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

/* contents 영역 */
section#container {
	/* background: #f6f6f6f8; */
	background: white;
}

div.body-wishList {
	/* background: #eee; */
	width: 80%;
	float: right;
}

section#container, div.body-wishList, aside#aside, aside#asideSM {
	padding: 10px;
}

aside#aside, aside#asideSM {
	background: black;
	width: 20%;
	float: left;
	/* border: 1px solid black; */
	border-radius: 20px;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

#aside #profile {
	border: 1px solid grey;
	border-radius: 30px;
	/* height: 400px; */
	width: 100%;
	margin: 0;
}

#profileBox {
	width: 200px;
	height: 200px;
}

#profileBox>img {
	width: 100%;
	height: 100%;
	border-radius: 30%;
}

.profileBtn {
	padding: 10px;
	border-radius: 10px;
	width: 80%;
}

.imgBox {
	width: 150px;
	height: 200px;
}

.imgBox>img {
	width: 100%;
	height: 100%;
}
/* contents 영역 끝 */

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
</head>
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
									<li class="nav-item"><a class="nav-link" href="/logout.mem">로그아웃</a></li>
									<li class="nav-item"><a class="nav-link" href="/wishlist.wish">찜한 영화</a></li>
									<li class="nav-item"><a class="nav-link" href="/myPage.mem?curPage=1">마이페이지</a></li>
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
						<a href="/toHome.home" id="navLogo" class="mb-2 mb-lg-0"> <img id="logoImg" src="/images/logo3.png">

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
									<a href="logout.mem"><img class="img-fluid" id="logoutIcon" src="/images/logout.png"></a>
									<a href="/wishlist.wish" class=""> <img class="img-fluid" id="cartIcon" src="/images/찜.png">
									</a>
									<a href="/myPage.mem?curPage=1" class=""> <img class="img-fluid" id="myPageIcon" src="/images/마이페이지.png">
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
	<c:choose>
		<c:when test="${not empty loginSession}">
			<div class="container">
				<div class="contents">
					<section id="container">
						<aside id="aside" class="p-3 mt-3">
							<div class="row justify-content-center" id="profile">
								<div class="col-12 mt-4" id="profileBox">
									<c:if test="${profile eq null}">
										<img class="profileImg" src="/images/기본프로필.jpg">
									</c:if>
									<c:if test="${profile ne null}">
										<img class="profileImg" src="/files/${profile}">
									</c:if>
								</div>

								<div class="col-12 d-flex justify-content-center">
									<h4 class="text-light">${loginSession.user_nickname}님</h4>
								</div>

								<div class="col-12 d-flex justify-content-center">
									<p class="text-light">어서오세요!</p>
								</div>
							</div>

							<div class="row justify-content-center" id="profileBtnBox">
								<button type="button" class="profileBtn btn btn-warning my-3">
									<a class="text-reset" href="/modify.mem?curPage=1">정보 수정</a>
								</button>
								<button type="button" class="profileBtn btn btn-warning mb-3">
									<a class="text-reset" href="/myPage.mem?curPage=1">내가 쓴 게시글</a>
								</button>
								<button type="button" class="profileBtn btn btn-warning mb-3">
									<a class="text-reset" href="/myReview.mypage?curPage=1">내가 쓴 리뷰</a>
								</button>
							</div>
						</aside>

						<aside id="asideSM" class="p-3 mt-3">
							<div class="row pt-3 justify-content-center" id="profile">
								<div class="col-4 me-5 mt-3" id="profileBox">
									<c:if test="${profile eq null}">
										<img class="profileImg" src="/images/기본프로필.jpg">
									</c:if>
									<c:if test="${profile ne null}">
										<img class="profileImg" src="/files/${profile}">
									</c:if>
								</div>

								<div class="col-6" id="profileBtnBox">
									<h4 class="text-light">${loginSession.user_nickname}님</h4>
									<button type="button" class="profileBtn btn btn-warning my-3">
										<a class="text-reset" href="/modify.mem?curPage=1">정보 수정</a>
									</button>
									<button type="button" class="profileBtn btn btn-warning mb-3">
										<a class="text-reset" href="/myPage.mem?curPage=1">내가 쓴 게시글</a>
									</button>
									<button type="button" class="profileBtn btn btn-warning mb-3">
										<a class="text-reset" href="/myReview.mypage?curPage=1">내가 쓴 리뷰</a>
									</button>
								</div>

								<div class="row" id="profileBtnBoxSM">
									<div class="col-12">
										<h4 class="text-light">${loginSession.user_nickname}님</h4>
									</div>
									<div class="col-4 px-0 d-flex justify-content-center">
										<button type="button" class="profileBtn btn btn-warning btn-sm">
											<a class="text-reset" href="/modify.mem?curPage=1">정보 수정</a>
										</button>
									</div>
									<div class="col-4 px-0 d-flex justify-content-center">
										<button type="button" class="profileBtn btn btn-warning btn-sm">
											<a class="text-reset" href="/myPage.mem?curPage=1">내가 쓴 게시글</a>
										</button>
									</div>
									<div class="col-4 px-0 d-flex justify-content-center">
										<button type="button" class="profileBtn btn btn-warning btn-sm">
											<a class="text-reset" href="/myReview.mypage?curPage=1">내가 쓴 리뷰</a>
										</button>
									</div>
								</div>
							</div>
						</aside>

						<div class="body-wishList">
							<div class="row p-3 body-wishList-header">
								<div class="col-7">
									<span class="fs-4">내가 찜한 영화</span> <span id="wishCnt" class="fs-6 text-secondary">${totalCnt}건</span>
								</div>
								<div class="col-3">
									<select id="selectBox" class="form-select">
										<option value="1" selected>등록순</option>
										<option value="2">이름순(영문)</option>
										<option value="3">이름순(국문)</option>
									</select>
								</div>
								<div class="col-2">
									<button type="button" class="btn btn-secondary" id="selectBtn">확인</button>
								</div>
							</div>

							<div class="body-wishList-content">
								<c:choose>
									<c:when test="${wishList.size() == 0}">
										<div class="row">
											<p class="text-center fs-5 text-secondary">찜한 영화가 존재하지 않습니다.</p>
										</div>
									</c:when>

									<c:otherwise>
										<div class="row p-3">
											<c:forEach items="${wishList}" var="wishList">
												<div class="wishBox col-sm-6 col-md-4 mb-3">
													<div class="imgBox" id="${wishList.movieCd}">
														<img class="posters" src="<c:url value="/images/NoImg.webp"/>">
													</div>
													<div class="imgText">
														<p class="mb-0">${wishList.movieNm}${wishList.movieNmEn}</p>
														<p class="mb-0 text-secondary">${wishList.prdtYear}년개봉</p>
													</div>
													<div class="imgBtn">
														<button type="button" class="reviewBtn btn btn-warning mb-2" value="${wishList.movieCd}">리뷰보기</button>
														<button type="button" class="deleteWish btn btn-secondary mb-2" value="${wishList.seq_basket}">삭제하기</button>
													</div>
												</div>
												<script>
												$(".reviewBtn").on("click", function(){
													location.href = "/detailView.re?movieCd="+$(this).val();
												})
												
												 $.ajax({
							                		url : "<c:url value="/MovieServiceJSON"/>",
							                		type : "post",
							                		dataType : "json",
							                		data : {query : "${wishList.movieNmEn}"},
							                				success : function(json) {
							                					$.each(json.items,function(i,item) {
							                						console.log(item.image);
							                						if(item.image){
							                							$("#${wishList.movieCd}").empty();
							                    						$("#${wishList.movieCd}").append('<img src="' +item.image+ '"/>');
							                						}
							                						
							                												});
							                						},error : function(error) {
							                							
							                							
							                						}
							                						
					                				});
											</script>
											</c:forEach>



										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</section>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<div class="container">
				<div class="contents">
					<section id="container">
						<div class="body-wishList-content">
							<div class="row">
								<div class="col d-flex justify-content-center">
									<strong class="fs-3">로그인이 필요해요!</strong>
								</div>
							</div>
							<div class="row">
								<div class="col-12 d-flex justify-content-center">
									<p>로그인 하시면 나중에 보고 싶은 영화를 찜 해둘 수 있습니다!</p>
								</div>
								<div class="col-12 d-flex justify-content-center">
									<p>지금 바로 로그인하시고, 확인해보세요!</p>
								</div>
							</div>
							<div class="row btnBox">
								<div class="col d-flex justify-content-center">
									<button class="btn btn-primary me-2">
										<a class="text-reset" href="Member/signup.jsp">회원가입</a>
									</button>
									<button class="btn btn-info text-white">
										<a class="text-reset" href="Member/login.jsp">로그인하고 영화 찜하러 가기!</a>
									</button>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</c:otherwise>
	</c:choose>



	<!-- Footer -->
	<footer class="py-5 text-light">
		<div class="container">
			<div class="row" id="bigFoot">
				<div class="col-2">
					<h5>장르</h5>
					<ul class="nav flex-column">
						<li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=코미디" class="nav-link p-0">코미디</a></li>
						<li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=액션" class="nav-link p-0">액션</a></li>
						<li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=멜로" class="nav-link p-0">멜로</a></li>
						<li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=SF" class="nav-link p-0">SF</a></li>
						<li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=호러" class="nav-link p-0">호러</a></li>
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
							<label for="newsletter1" class="visually-hidden">Email address</label> <input id="newsletter1" type="text"
								class="form-control" placeholder="Email address">
							<button class="btn btn-primary" type="button">영화 추천받기</button>
						</div>
					</form>

					<div class="snsBox">
						<div class="snsIcon1">
							<a href="https://www.kakaocorp.com/" class="d-flex align-items-center mb-2 mb-lg-0"> <img id="kakaoIcon"
								src="/images/kakaotalk.png">
							</a>
						</div>
						<div class="snsIcon2">
							<a href="https://twitter.com/" class="d-flex align-items-center mb-2 mb-lg-0"> <img id="twitterIcon"
								src="/images/twitter.png">
							</a>
						</div>
						<div class="snsIcon3">
							<a href="https://www.instagram.com/" class="d-flex align-items-center mb-2 mb-lg-0"> <img id="instagramIcon"
								src="/images/instagram.png">
							</a>
						</div>
						<div class="snsIcon4">
							<a href="https://www.facebook.com/" class="d-flex align-items-center mb-2 mb-lg-0"> <img id="facebookIcon"
								src="/images/facebook.png">
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="row justify-content-center" id="smallFoot">
				<div class="col-4">
					<h5>장르</h5>
					<ul class="nav flex-column">
						<li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=코미디" class="nav-link p-0">코미디</a></li>
						<li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=액션" class="nav-link p-0">액션</a></li>
						<li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=멜로" class="nav-link p-0">멜로</a></li>
						<li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=SF" class="nav-link p-0">SF</a></li>
						<li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=호러" class="nav-link p-0">호러</a></li>
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
							<label for="newsletter1" class="visually-hidden">Email address</label> <input id="newsletter1" type="text"
								class="form-control" placeholder="Email address">
							<button class="btn btn-primary" type="button">영화 추천받기</button>
						</div>
					</form>

					<div class="snsBox">
						<div class="snsIcon1">
							<a href="https://www.kakaocorp.com/" class="d-flex align-items-center mb-2 mb-lg-0"> <img id="kakaoIcon"
								src="/images/kakaotalk.png">
							</a>
						</div>
						<div class="snsIcon2">
							<a href="https://twitter.com/" class="d-flex align-items-center mb-2 mb-lg-0"> <img id="twitterIcon"
								src="/images/twitter.png">
							</a>
						</div>
						<div class="snsIcon3">
							<a href="https://www.instagram.com/" class="d-flex align-items-center mb-2 mb-lg-0"> <img id="instagramIcon"
								src="/images/instagram.png">
							</a>
						</div>
						<div class="snsIcon4">
							<a href="https://www.facebook.com/" class="d-flex align-items-center mb-2 mb-lg-0"> <img id="facebookIcon"
								src="/images/facebook.png">
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
		function sortWish(option){
			let url;
			if(option == 1){ //등록순
				url = "/sortbyAdd.wish";
			}else if(option == 2){ // 영어이름순
				url = "/sortbyNameEn.wish";
			}else if(option == 3){ // 한글이름순
				url = "/sortbyName.wish";
			}
			 $.ajax({
				url: url
				, type : "get"
				, success: function(data){
					let list = JSON.parse(data);
					$(".body-wishList-header").empty();
					
					let headCol1 = $("<div>").addClass("col-7");
					let span1 = $("<span>").addClass("fs-4").html("내가 찜한 영화");
					let span2 = $("<span>").addClass("fs-6 text-secondary").attr("id", "wishCnt").html(list.length + "건");
					headCol1.append(span1, " ", span2);
					
					let headCol2 = $("<div>").addClass("col-3");
					let selectBox = $("<select>").addClass("form-select").attr("id", "selectBox");
					
					let opt1 = $("<option>").html("등록순").val(1);
					let opt2 = $("<option>").html("이름순(영문)").val(2);
					let opt3 = $("<option>").html("이름순(국문)").val(3);
					
					selectBox.append(opt1, opt2, opt3);
					headCol2.append(selectBox);
					
					let headCol3 = $("<div>").addClass("col-2");
					let btn = $("<button>").addClass("btn btn-secondary").attr("id", "selectBtn").html("확인");
					headCol3.append(btn);
					
					let rs = $(".body-wishList-header").append(headCol1, headCol2, headCol3);
					$(".body-wishList").append(rs);
					
					//console.log($("#selectBox > option[value='"+option+"']"));
					$("#selectBox > option[value='"+option+"']").attr("selected", true);
					
					console.log(data);
 					makeList(data);
				}, error: function(e){
					console.log(e);
				}
			}) 
		}
	
		/* 정렬 */
		$(".body-wishList").on("click", "#selectBtn", function(){
			let option = $("#selectBox").val();
			sortWish(option);
		})
		
		/* 찜 목록 삭제 */
		$(".body-wishList-content").on("click", ".deleteWish", function(){
			let answer = confirm("정말 해당 영화를 찜 목록에서 삭제하시겠습니까?");
			if(answer){
				let seq_basket = $(this).val();
				console.log(seq_basket);
				
				$.ajax({
					url: "/delete.wish"
					, type : "post"
					, data : {seq_basket: seq_basket}
					, success : function(data){
						if(data === "fail"){
							alert("찜 영화 삭제에 실패했습니다.");
						}else{
							let list = JSON.parse(data);
							
							$("#wishCnt").html(list.length + "건");							
							alert("삭제가 완료되었습니다.");
							makeList(data);
						}
					}, error : function(e){
						console.log(e);
					}
				})
			}
		})
		
		/* 정렬 목록 만드는 함수 */
		function makeList(data){
			let list = JSON.parse(data);
			$(".body-wishList-content").empty();
			if(list.length == 0){
				
				let p = $("<p>").addClass("text-center fs-5 text-secondary").html("찜한 영화가 존재하지 않습니다.");
				let div = $("<div>").addClass("row");
				div.append(p);
	
				let rs = $(".body-wishList-content").append(div);
				$(".body-wishList").append(rs);
				
			}else{
				let row = $("<div>").addClass("row p-3");
				for(let wishList of list){
					
					let col = $("<div>").addClass("wishBox col-4 mb-3");
					let imgBox = $("<div>").addClass("imgBox");
					let img = $("<img>").addClass("posters").attr("src", "<c:url value='/images/NoImg.webp'/>");
					let imgText = $("<div>").addClass("imgText");
					let p1 = $("<p>").addClass("mb-0").html(wishList.movieNm + " " + wishList.movieNmEn);
					let p2 = $("<p>").addClass("mb-0 text-secondary").html(wishList.prdtYear + "년 개봉");
					let imgBtn = $("<div>").addClass("imgBtn");
					let button1 = $("<button>").addClass("btn btn btn-warning mb-2").html("리뷰보기");
					let button2 = $("<button>").addClass("deleteWish btn btn-secondary mb-2").html("삭제하기").val(wishList.seq_basket);
					
					imgBox.append(img);
					imgText.append(p1, p2);
					imgBtn.append(button1, " ", button2);
					col.append(imgBox, imgText, imgBtn);
					row.append(col);
				}
				let rs = $(".body-wishList-content").append(row);
				$(".body-wishList").append(rs);
			}
		}
		
	</script>
</body>
</html>