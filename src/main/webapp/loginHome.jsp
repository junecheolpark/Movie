<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>HOME</title>
<style>
body {
	background-color: black;
}

a {
	text-decoration: none;
}

.contents {
	height: 500px;
}

#navLogo {
	width: 150px;
	height: 100px;
}

#logoImg{
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
@media ( max-width : 767px) {
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

@media (min-width : 768px) {
	#navibar {
		display: none;
	}
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${rs eq true}">
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
									<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
									<li class="nav-item"><a class="nav-link" href="/Member/login.jsp">로그인</a></li>
									<li class="nav-item"><a class="nav-link" href="/Member/signup.jsp">회원가입</a></li>
									<li class="nav-item"><a class="nav-link" href="/wishlist.wish">찜한 영화</a></li>
									<li class="nav-item"><a class="nav-link" href="/Mypage/mypageIndex.jsp">마이페이지</a></li>
								</ul>

								<form class="searchForm d-flex">
									<input class="searchInput form-control me-2" type="search" placeholder="영화 검색.." aria-label="Search" name ='val'>
									<input type="hidden" name = 'curPage' value="1">
									<input type="hidden" name = 's_type' value="movieNm">
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
									<li class="nav-item"><a class="nav-link mx-2" href="#">자유게시판</a></li>
								</ul>
							</div>

							<!-- logo -->
							<div class="col-2">
								<a href="/lookMovie.home" id="navLogo" class="mb-2 mb-lg-0">
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
										<button id="searchBtn" class="btn" type="button" data-bs-toggle="modal" data-bs-target="#searchModal">
											<img src="/images/searchIcon.png">
										</button>
									</div>

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
																<input class="searchInput form-control me-2" type="search" placeholder="영화 검색.." aria-label="Search" name ='val'>
																<p class="text-black-50 text-center mt-3">찾으시는 영화가 있으신가요? 검색어를 입력해보세요!</p>
																<input type="hidden" name = 'curPage' value="1">
																<input type="hidden" name = 's_type' value="movieNm">
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

								</div>
							</div>
						</div>
					</nav>
				</div>
			</header>


			<!-- Contents -->
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-5">
						<h1>${loginSession.user_id}</h1>
						<h1>로그인 성공</h1>
						<div class="row p-3 justify-content-center">
							<div class="col-12 col-md-5 col-lg-5 flex justify-content-start">
								<button type="button" class="btn btn-warning w-100"
									id="kakaoBtn" onclick="kakaoLogout();">카카오 로그아웃</button>
							</div>
							<div class="col-12 col-md-5 col-lg-5 d-flex justify-content-end">
								<button type="button" class="btn btn-dark rounded w-100"
									id="logoutBtn">로그아웃</button>
							</div>
						</div>
						<div class="row p-3 justify-content-center">
							<div class="col-12c ol-md-5 col-lg-5 flex justify-content-start">
								<button type="button" class="btn btn-dark rounded w-100"
									id="mypageBtn">마이페이지</button>
							</div>
							<div class="col-12 col-md-5 col-lg-5 d-flex justify-content-end">
								<button type="button" class="btn btn-dark rounded w-100"
									id="postBtn">게시판</button>
							</div>
						</div>
					</div>
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
								<li class="nav-item mb-2"><a href="#" class="nav-link p-0">아이디
										찾기</a></li>
								<li class="nav-item mb-2"><a href="#" class="nav-link p-0">비밀번호
										찾기</a></li>
							</ul>
						</div>

						<div class="col-2">
							<h5>기타</h5>
							<ul class="nav flex-column">
								<li class="nav-item mb-2"><a href="#" class="nav-link p-0">리뷰</a></li>
								<li class="nav-item mb-2"><a href="#" class="nav-link p-0">자유게시판</a></li>
								<li class="nav-item mb-2"><a href="#" class="nav-link p-0">찜
										목록</a></li>
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
										address</label> <input id="newsletter1" type="text"
										class="form-control" placeholder="Email address">
									<button class="btn btn-primary" type="button">영화 추천받기</button>
								</div>
							</form>

							<div class="snsBox">
								<div class="snsIcon1">
									<a href="https://www.kakaocorp.com/"
										class="d-flex align-items-center mb-2 mb-lg-0"> <img
										id="kakaoIcon" src="/resources/images/kakaotalk.png">
									</a>
								</div>
								<div class="snsIcon2">
									<a href="https://twitter.com/"
										class="d-flex align-items-center mb-2 mb-lg-0"> <img
										id="twitterIcon" src="/resources/images/twitter.png">
									</a>
								</div>
								<div class="snsIcon3">
									<a href="https://www.instagram.com/"
										class="d-flex align-items-center mb-2 mb-lg-0"> <img
										id="instagramIcon" src="/resources/images/instagram.png">
									</a>
								</div>
								<div class="snsIcon4">
									<a href="https://www.facebook.com/"
										class="d-flex align-items-center mb-2 mb-lg-0"> <img
										id="facebookIcon" src="/resources/images/facebook.png">
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
				// 카카오 로그아웃 
				Kakao.init('23a01cb0d87a6404d4df1ec97cf82ec7');
				function kakaoLogout() {
					if (!Kakao.Auth.getAccessToken()) { // 토큰이 없다면
						console.log("일반 로그인");
						return;
					}
					Kakao.Auth.logout(function() {
						location.href = "/kakaoLogout.ka"; // 로그아웃 처리
					})
				}

				// 일반 로그아웃
				$("#logoutBtn").on("click", function() {
					location.href = "/logout.mem"; // 로그아웃 처리
				})
				
				// 마이페이지
				$("#mypageBtn").on("click", function() {
					location.href = "/myPage.mem"; 
				})
				
				// 게시판
				$("#postBtn").on("click", function() {
					location.href = "/post/post.jsp"; 
				})
			</script>
		</c:when>
		<c:otherwise>
			<c:if test="${rs eq false}">
				<script>
					alert("로그인에 실패했습니다.");
				</script>
			</c:if>
			<!-- Header -->
			<header class="mb-3 border-bottom">
				<div class="container">
					<nav id="navibar" class="navbar navbar-expand-lg navbar-dark"
						aria-label="Main navigation">
						<div class="container-fluid">
							<!-- toggle button -->
							<button class="navbar-toggler" type="button"
								data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
								aria-controls="navbarNavDropdown" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<!-- 메뉴 -->
							<div class="collapse navbar-collapse justify-content-end"
								id="navbarNavDropdown">
								<ul class="navbar-nav mb-2 mb-lg-0">
									<li class="nav-item"><a class="nav-link" href="#">영화</a></li>
									<li class="nav-item"><a class="nav-link" href="#">리뷰</a></li>
									<li class="nav-item"><a class="nav-link" href="#">자유게시판</a>
									</li>
								</ul>

								<ul class="navbar-nav mb-2 mb-lg-0 me-2">
									<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
									<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
								</ul>


								<a href="" class="d-flex align-items-center mb-2 mb-lg-0 me-3">
									<p class="text-light" id="cart">찜한 영화</p>
								</a> <a href="" class="d-flex align-items-center mb-2 mb-lg-0 me-3">
									<p class="text-light" id="myPage">마이페이지</p>
								</a>

								<form class="d-flex">
									<input class="form-control me-2" type="search"
										placeholder="Search" aria-label="Search">
									<button class="btn btn-outline-success" type="submit">Search</button>
								</form>

							</div>
						</div>
					</nav>

					<nav id="menu" class="navbar navbar-expand-lg w-100 navbar-dark"
						aria-label="Main navigation">
						<div class="row w-100 align-items-center">
							<div class="col-5 d-flex justify-content-center">
								<ul class="navbar-nav mb-2 mb-lg-0">
									<li class="nav-item"><a class="nav-link" href="#">영화</a></li>
									<li class="nav-item"><a class="nav-link" href="#">리뷰</a></li>
									<li class="nav-item"><a class="nav-link" href="#">자유게시판</a>
									</li>
								</ul>

							</div>

							<!-- logo -->
							<div class="col-2">
								<a href="/"
									class="d-flex align-items-center justify-content-start mb-2 mb-lg-0">
									<img id="navLogo" src="/resources/images/logo3.png">
								</a>
							</div>

							<div class="col-5">
								<div class="row">
									<div class="col-5">
										<ul class="navbar-nav mb-2 mb-lg-0 me-2">
											<li class="nav-item"><a class="nav-link" href="#">로그인</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="#">회원가입</a>
											</li>
										</ul>
									</div>

									<div class="col-2">
										<a href="" class="align-items-center "> <img
											class="img-fluid" id="cartIcon"
											src="/resources/images/basket.png"> <!-- <p class="text-light" id="cart">찜한 영화</p> -->
										</a> <a href="" class="align-items-center"> <img
											class="img-fluid" id="myPageIcon"
											src="/resources/images/myPage.png"> <!-- <p class="text-light" id="myPage">마이페이지</p> -->
										</a>
									</div>
									<div class="col-5">
										<form class="d-flex">
											<input class="form-control me-2" type="search"
												placeholder="Search" aria-label="Search">
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
				<div class="row justify-content-center">
					<div class="col-lg-5">
						<h1>로그인 실패</h1>
					</div>
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
								<li class="nav-item mb-2"><a href="#" class="nav-link p-0">아이디
										찾기</a></li>
								<li class="nav-item mb-2"><a href="#" class="nav-link p-0">비밀번호
										찾기</a></li>
							</ul>
						</div>

						<div class="col-2">
							<h5>기타</h5>
							<ul class="nav flex-column">
								<li class="nav-item mb-2"><a href="#" class="nav-link p-0">리뷰</a></li>
								<li class="nav-item mb-2"><a href="#" class="nav-link p-0">자유게시판</a></li>
								<li class="nav-item mb-2"><a href="#" class="nav-link p-0">찜
										목록</a></li>
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
										address</label>
									<input id="newsletter1" type="text"
										class="form-control" placeholder="Email address">
									<button class="btn btn-primary" type="button">영화 추천받기</button>
								</div>
							</form>

							<div class="snsBox">
								<div class="snsIcon1">
									<a href="https://www.kakaocorp.com/"
										class="d-flex align-items-center mb-2 mb-lg-0"> <img
										id="kakaoIcon" src="/resources/images/kakaotalk.png">
									</a>
								</div>
								<div class="snsIcon2">
									<a href="https://twitter.com/"
										class="d-flex align-items-center mb-2 mb-lg-0"> <img
										id="twitterIcon" src="/resources/images/twitter.png">
									</a>
								</div>
								<div class="snsIcon3">
									<a href="https://www.instagram.com/"
										class="d-flex align-items-center mb-2 mb-lg-0"> <img
										id="instagramIcon" src="/resources/images/instagram.png">
									</a>
								</div>
								<div class="snsIcon4">
									<a href="https://www.facebook.com/"
										class="d-flex align-items-center mb-2 mb-lg-0"> <img
										id="facebookIcon" src="/resources/images/facebook.png">
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
		</c:otherwise>
	</c:choose>
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