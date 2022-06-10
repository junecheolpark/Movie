<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

div.body-manage {
	/* background: #eee; */
	width: 80%;
	float: right;
}

div.body-manage, aside#aside, aside#asideSM {
	padding: 10px;
}

aside#aside, aside#asideSM {
	background: black;
	width: 20%;
	float: left;
	border: 1px solid white;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

#menuBox {
	margin-top: 30px;
}

#aside {
	height: 644px;
}
/* contents 영역 끝 */

/* clear:both를 통해 플롯 초기화해야 레이아웃 안깨짐
        https://kuzuro.blogspot.com/2018/08/blog-post_18.html 참고 */
/* 반응형 시작 */
@media screen and (max-width: 1200px) {
	aside#aside {
		width: 25%;
	}
	div.body-manage {
		width: 75%;
	}
}

@media screen and (max-width: 1024px) {
	aside#aside {
		display: none;
	}
	div.body-manage {
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
	div.body-manage {
		width: 100%;
		float: none;
	}
}

/* 반응형 끝 */
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
	<div class="container">
		<div class="contents">
			<section id="container">
				<aside id="aside">
					<div class="row justify-content-center">
						<div class="col-12 d-flex justify-content-center">
							<h4 class="text-light">${loginSession.user_nickname}</h4>
						</div>

						<div class="col-12 d-flex justify-content-center">
							<p class="text-light">
								관리자님<br>어서오세요!
							</p>
						</div>
					</div>

					<div class="row justify-content-center text-center fs-4"
						id="menuBox">
						<p class="text-light p-3 mb-0">
							<a class="text-reset" href="/lookupMem.admin?curPage=1">회원 관리</a>
						</p>
						<p class="text-light p-3 mb-0">
							<a class="text-reset" href="/report.admin?curPage=1">신고 관리</a>
						</p>
						<p class="p-3 mb-0 bg-warning">
							<a class="text-reset" href=/black.admin">블랙리스트 관리</a>
						</p>
					</div>
				</aside>

				<aside id="asideSM" class="p-3">
					<div class="row">
						<div id="menuBox">
							<h4 class="text-light">${loginSession.user_nickname}관리자님</h4>
							<p class="text-light p-3 mb-0">
								<a class="text-reset" href="/lookupMem.admin?curPage=1">회원 관리</a>
							</p>
							<p class="text-light p-3 mb-0">
								<a class="text-reset" href="/report.admin?curPage=1">신고 관리</a>
							</p>
							<p class="p-3 mb-0 bg-warning">
								<a class="text-reset" href="/black.admin">블랙리스트 관리</a>
							</p>
						</div>

					</div>
				</aside>

				<div class="body-manage">
					<div class="row p-3 body-manage-header">
						<div class="col-8">
							<span class="fs-4">블랙리스트 관리</span>
						</div>
						<div class="col-4 d-flex justify-content-end">
							<button type="button" class="btn btn-warning me-3" data-bs-toggle="modal" data-bs-target="#modal">등록</button>
							<button type="button" class="btn btn-warning" id="delBlackBtn">삭제</button>
						</div>
					</div>
					
					<form id="blacklistForm">
						<div class="modal fade" id="modal" tabindex="-1" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title m-auto">블랙리스트 등록</h5>
										<button type="button" class="btn-close m-0" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="form-floating">
											<input type="text" name="user_id" class="form-control mb-3" placeholder="Leave a comment here" id="black_id">
											<label for="floatingTextarea">회원 아이디</label>
										</div>
										<div class="form-floating">
											<input type="text" name="reason" class="form-control" placeholder="Leave a comment here" id="black_reason">
											<label for="floatingTextarea">블랙리스트 등록 사유</label>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										<button type="button" id="addBlackBtn" class="btn btn-primary">등록</button>
									</div>
								</div>
							</div>
						</div>
					</form>
					

					<div class="body-manage-content">
						<div class="row p-3">
							<table class="table table-light">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">ID</th>
										<th scope="col">사유</th>
										<th scope="col">등록일</th>
									</tr>
								</thead>
								<tbody class="manage-content-tbody">
									<c:choose>
										<c:when test="${list.size() == 0}">
											<tr>
												<td class="text-center" colspan="4">블랙리스트가 존재하지 않습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${list}" var="dto">
												<tr>
													<td><input type="checkbox" name="check" value="${dto.user_id}"></td>
													<td>${dto.user_id}</td>
													<td>${dto.black_reason}</td>
													<td>${dto.black_date}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>

							<%-- <nav class="manage-content-nav">
								<ul class="pagination justify-content-center">
									<c:if test="${naviMap.needPrev eq true}">
										<li class="page-item"><a class="page-link"
											href="/report.report?curPage=${naviMap.startNavi-1}">Previous</a></li>
										현재 6페이지에 있는 상태에서 이전 버튼을 클릭함 -> 5페이지로 이동
									</c:if>

									<c:forEach var="pageNum" begin="${naviMap.startNavi}"
										end="${naviMap.endNavi}" step="1">
										<li class="page-item"><a class="page-link"
											href="/report.report?curPage=${pageNum}">${pageNum}</a></li>
									</c:forEach>

									<c:if test="${naviMap.needNext eq true}">
										<li class="page-item"><a class="page-link"
											href="/report.report?curPage=${naviMap.endNavi+1}">Next</a></li>
									</c:if>
								</ul>
							</nav> --%>


							<!-- <script>
								
							</script> -->
						</div>
					</div>
				</div>
			</section>
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

				<c:choose>
					<c:when test="${not empty loginSession}">
						<div class="col-4">
							<h5>계정</h5>
							<ul class="nav flex-column">
								<li class="nav-item mb-2"><a href="/myPage.mem" class="nav-link p-0">마이페이지</a></li>
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
								<li class="nav-item mb-2"><a href="/myPage.mem" class="nav-link p-0">마이페이지</a></li>
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
		// 블랙리스트 등록 버튼
		$("#addBlackBtn").on("click", function(){
			if($("#black_id").val() === "" || $("#black_reason").val() === ""){ // 입력창이 비어있다면
				alert("입력창이 비어있습니다.");
				return;
			}
			
			let blacklist = $("#blacklistForm").serialize();
			console.log(blacklist);
			
			$.ajax({
				url: "/addBlack.admin"
				, type: "post"
				, data: blacklist
				, success: function(data){
					console.log(data);
					if(data === "fail"){ // 댓글 등록에 실패했거나
						alert("블랙리스트 등록에 실패했습니다.");
					}else{ 
						makeBlacklist(data);
						$("#modal").modal('hide');
					}  				
				}, error: function(e){
					console.log(e);
				}
			})
		})
		
		let user_id;
		$(".manage-content-tbody").on("change", "input[name=check]:checked", function(){
			user_id = $(this).val();
		})
		
		// 블랙리스트 삭제 버튼
		$("#delBlackBtn").on("click", function(){
			if(confirm("블랙리스트를 삭제하시겠습니까?")){
				$.ajax({
					url: "/delBlack.admin"
					, type : "post"
					, data : {user_id: user_id}
					, success : function(data){
						if(data === "fail"){
							alert("블랙리스트 삭제에 실패했습니다.");
						}else{						
							alert("삭제가 완료되었습니다.");
							makeBlacklist(data);
						}
					}, error : function(e){
						console.log(e);
					}
				})
			}else{
				return false;
			}
		})
		
		
		function makeBlacklist(data){
			let list = JSON.parse(data);
			$(".manage-content-tbody").empty();
			
			if(list.length == 0){
				let tr = $("<tr>");
				let td = $("<td>").addClass("text-center").attr("colspan", "3").html("블랙리스트가 존재하지 않습니다.");
				tr.append(td);
				$(".manage-content-tbody").append(tr);
			}else{
				for(let blacklist of list){
					let tr = $("<tr>");
					let td1 = $("<td>");
					let input = $("<input>").attr({type:"checkbox", name:"check", value: blacklist.user_id});
					let td2 = $("<td>").html(blacklist.user_id);
					let td3 = $("<td>").html(blacklist.black_reason);
					let td4 = $("<td>").html(blacklist.black_date);
					
					td1.append(input);
					tr.append(td1, td2, td3, td4);	
					$(".manage-content-tbody").append(tr);
					
				}
			}
		}
	</script>
</body>
</html>