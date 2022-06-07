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

@media (min-width : 768px) {
	#navibar {
		display: none;
	}
}
/* header 반응형 끝 */

/* contents 영역 */


/* contents 영역 끝 */

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
							<li class="nav-item"><a class="nav-link" href="#">영화</a></li>
							<li class="nav-item"><a class="nav-link" href="#">리뷰</a></li>
							<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
							<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
							<li class="nav-item"><a class="nav-link" href="#">찜한 영화</a></li>
							<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
						</ul>

						<form class="d-flex">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</div>
			</nav>
			<!-- 펼쳐졌을 때 nav -->
			<nav id="menu" class="navbar navbar-expand-md w-100 navbar-dark" aria-label="Main navigation">
				<div class="row w-100 align-items-center">
					<div class="col-5 d-flex justify-content-center">
						<ul class="navbar-nav mb-2 mb-lg-0">
							<li class="nav-item"><a class="nav-link" href="#">영화</a></li>
							<li class="nav-item"><a class="nav-link" href="#">리뷰</a></li>
							<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
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
								</a>
								<a href="" class="align-items-center">
									<img class="img-fluid" id="myPageIcon" src="images\마이페이지.png">
								</a>
							</div>
							<div class="col-5">
								<form class="d-flex">
									<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
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
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">신고 분류</th>
					<th scope="col">신고 내용</th>
					<th scope="col">신고 유저</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${list.size() == 0}">
						<tr>
							<td class="text-center" colspan="4">접수된 신고 내역이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.seq_report}</td>
								<td>${dto.category_check}</td>
								<td>${dto.rp_content}</td>
								<td>${dto.user_id}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<nav>
  			<ul class="pagination justify-content-center">
  				<c:if test="${naviMap.needPrev eq true}">
  					<li class="page-item"><a class="page-link" href="/report.report?curPage=${naviMap.startNavi-1}">Previous</a></li>
  					<%-- 현재 6페이지에 있는 상태에서 이전 버튼을 클릭함 -> 5페이지로 이동 --%>
  				</c:if>
    			
    			<c:forEach var="pageNum" begin="${naviMap.startNavi}" end="${naviMap.endNavi}" step="1">
    				<li class="page-item"><a class="page-link" href="/report.report?curPage=${pageNum}">${pageNum}</a></li>
    			</c:forEach>
    			
    			<c:if test="${naviMap.needNext eq true}">
  					<li class="page-item"><a class="page-link" href="/report.report?curPage=${naviMap.endNavi+1}">Next</a></li>
  				</c:if>    			
 			</ul>
		</nav>
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
						<p>
							지금 영화를 리뷰하고,<br> 내 취향에 딱 맞는 영화를 추천받아 보세요!
						</p>
						<div class="d-flex w-100 gap-2">
							<label for="newsletter1" class="visually-hidden">Email address</label> <input id="newsletter1" type="text" class="form-control"
								placeholder="Email address">
							<button class="btn btn-primary" type="button">영화 추천받기</button>
						</div>
					</form>

					<div class="snsBox">
						<div class="snsIcon1">
							<a href="https://www.kakaocorp.com/"
								class="d-flex align-items-center mb-2 mb-lg-0">
								<img id="kakaoIcon" src="images/kakaotalk.png">
							</a>
						</div>
						<div class="snsIcon2">
							<a href="https://twitter.com/"
								class="d-flex align-items-center mb-2 mb-lg-0">
								<img id="twitterIcon" src="images/twitter.png">
							</a>
						</div>
						<div class="snsIcon3">
							<a href="https://www.instagram.com/"
								class="d-flex align-items-center mb-2 mb-lg-0">
								<img id="instagramIcon" src="images/instagram.png">
							</a>
						</div>
						<div class="snsIcon4">
							<a href="https://www.facebook.com/"
								class="d-flex align-items-center mb-2 mb-lg-0">
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