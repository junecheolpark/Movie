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
<title>아이디 찾기</title>
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

/* body*/
.card-header {
	background-color: white;
}

/* Footer */
.nav-link {
	color: gray;
	text-decoration: none;
}

.nav-link:hover {
	color: white;
}

@media ( max-width : 1000px) {
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

@media ( min-width : 1000px) {
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
			<div class="col-lg-6">
				<c:if test="${rs eq true}">
					<div class="card card-custom">
						<div class="card-header">
							<h4>아이디 찾기</h4>
						</div>
						<div class="card-body">
							<div class="row p-2 justify-content-center">
								<p class="col-12 d-flex justify-content-center">회원님의 아이디는
									${user_id} 입니다.</p>
							</div>
							<div class="row p-3 justify-content-center">
								<div class="col-6 d-flex justify-content-center">
									<button type="button" class="btn btn-dark w-100" id="loginBtn">로그인</button>
								</div>
							</div>
						</div>
					</div>
					<script>
						$("#loginBtn").on("click", function() {
							location.href = "/Member/login.jsp";
						})
					</script>
					<c:set var="doneLoop" value="true" />
				</c:if>
				<c:if test="${rs eq false}">
					<div class="card card-custom">
						<div class="card-header">
							<h4>아이디 찾기</h4>
						</div>
						<div class="card-body">
							<div class="form-group p-2 d-flex justify-content-center">
								<p class="text-center">등록된 정보가 없습니다.</p>
							</div>
							<div class="row p-3 justify-content-center">
								<div class="col-5 d-flex justify-content-center">
									<button type="button" class="btn btn-dark w-100" id="againBtn">다시
										찾기</button>
								</div>
								<div class="col-5 d-flex justify-content-center">
									<button type="button" class="btn btn-dark w-100" id="signupBtn">회원가입</button>
								</div>
							</div>
						</div>
					</div>
					<script>
						$("#againBtn").on("click", function() {
							location.href = "/Member/findId.jsp";
						})

						$("#signupBtn").on("click", function() {
							location.href = "/Member/signup.jsp";
						})
					</script>
				</c:if>
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
								address</label> <input id="newsletter1" type="text" class="form-control"
								placeholder="Email address">
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
</body>
</html>