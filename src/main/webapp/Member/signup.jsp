<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원가입</title>
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
.body-container {
	padding: 10px;
}

.card-header {
	background-color: white;
}

.card-footer {
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
							<img id="navLogo" src="images/logo3.png">
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
								<a href="" class="align-items-center"> <img
									class="img-fluid" id="cartIcon" src="images\찜.png"> <!-- <p class="text-light" id="cart">찜한 영화</p> -->
								</a> <a href="" class="align-items-center"> <img
									class="img-fluid" id="myPageIcon" src="images\마이페이지.png">
									<!-- <p class="text-light" id="myPage">마이페이지</p> -->
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
				<form id="signupForm" action="/signupProc.mem" method="post">
					<div class="card card-custom">
						<div class="card-header">
							<h4>회원가입</h4>
						</div>
						<div class="card-body">
							<div class="row p-2">
								<div class="col-12">
									<p>이름*</p>
								</div>
								<div class="col-12">
									<input type="text" class="form-control" id="user_name" name="user_name">
								</div>
							</div>
							<div class="row p-2">
								<div class="col-12">
									<p>아이디*</p>
								</div>
								<div class="col-12 col-md-8 col-lg-8">
									<input type="text" class="form-control" id="user_id" name="user_id" readonly>
								</div>
								<div class="col-12 col-md-4 col-lg-4">
									<button type="button" class="btn btn-warning w-100" id="checkId">아이디 확인</button>
								</div>
							</div>
							<div class="row p-2">
								<div class="col-12">
									<p>비밀번호*</p>
								</div>
								<div class="col-12">
									<input type="password" class="form-control " id="user_pw" name="user_pw">
								</div>
								<div class="form-text">
									비밀번호는 6~12자 이내로 입력하세요.<br> (영어 대소문자, 숫자, ~!@#$%^&* 포함)
								</div>
							</div>
							<div class="row p-2">
								<div class="col-12">
									<p>비밀번호 확인*</p>
								</div>
								<div class="col-12">
									<input type="password" class="form-control " id="user_pwCheck">
								</div>
								<div class="form-text">확인을 위해 이전과 동일한 비밀번호를 입력하세요.</div>
							</div>
							<div class="row p-2">
								<div class="col-12">
									<p>닉네임*</p>
								</div>
								<div class="col-12 col-md-8 col-lg-8">
									<input type="text" class="form-control" id="user_nickname" name="user_nickname" readonly>
								</div>
								<div class="col-12 col-md-4 col-lg-4">
									<button type="button" class="btn btn-warning w-100" id="checkNickname">닉네임 확인</button>
								</div>
								<div class="form-text">나를 표현할 닉네임을 4~8자 이내로 입력해 주세요.</div>
							</div>
							<div class="row p-2">
								<div class="col-12">
									<p>생년월일*</p>
								</div>
								<div class="col-12">
									<input type="text" class="form-control" id="user_birth" name="user_birth">
								</div>
								<div class="form-text">8자리 숫자로 입력해 주세요. <br>예) 1999년 01월 01일 -> 19990101</div>
							</div>
							<div class="row p-2">
								<div class="col-12">
									<p>전화번호*</p>
								</div>
								<div class="col-12">
									<input type="text" class="form-control" id="user_phone" name="user_phone">
								</div>
								<div class="form-text">전화번호는 - 없이 숫자만 입력해 주세요.</div>
							</div>
							<div class="row p-2">
								<div class="col">
									<input type="text" class="form-control" id="postcode"
										name="postcode" placeholder="우편번호">
								</div>
								<div class="col">
									<button type="button" class="btn btn-primary w-100"
										id="btnPostCode">우편번호 찾기</button>
								</div>
							</div>
							<div class="row p-2">
								<div class="col">
									<input type="text" class="form-control" id="roadAddr"
										name="roadAddr" placeholder="도로명주소">
								</div>
							</div>
							<div class="row p-2">
								<div class="col mb-2">
									<input type="text" class="form-control" id="detailAddr"
										name="detailAddr" placeholder="상세주소">
								</div>
								<div class="col mb-2">
									<input type="text" class="form-control" id="extraAddr"
										name="extraAddr" placeholder="읍/면/동">
								</div>
							</div>
							<div class="row p-3 justify-content-center">
								<div class="col-12 col-md-4 col-lg-4 d-flex justify-content-end">
									<button type="button" class="btn btn-dark rounded w-100" id="signupBtn">회원가입</button>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="text-center">
								<span>또는</span>
							</div>
							<div class="row justify-content-center">
								<div
									class="col-12 col-md-4 col-lg-4 d-flex justify-content-center">
									<a href="/kakao/kakaoSignup.jsp"><img src="/semi_project/images/kakao_singup.png"></a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
		// 일반 가입
		$("#signupBtn").on("click", function(){
			let regexPw = /[a-zA-Z0-9~!@#$%^&*]{6,12}/; // 비밀번호 정규식
			let regexBirth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/; // 셍년월일 정규식
			let regexPhone = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}/; // 전화번호 정규식
			
			if($("#user_id").val() === "") {
				alert("아이디를 입력해 주세요.");
				return;
			} else if(!regexPw.test($("#user_pw").val())) {
				alert("형식에 맞지않는 비밀번호입니다.");
				return;
			} else if($("#user_pw").val() !== $("#user_pwCheck").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return;
			} else if ($("#user_nickname").val() === "") {
				alert("닉네임을 입력해 주세요.");
				return;
			} else if(!regexBirth.test($("#user_birth").val())){
				alert("형식에 맞지않는 생년월일입니다.");
				return;
			} else if(!regexPhone.test($("#user_phone").val())){
				alert("형식에 맞지않는 전화번호입니다.");
				return;
			} else if($("#postcode").val() === "" || $("#roadAddr").val() === "") {
				alert("주소를 입력해 주세요.");
				return;
			}
			
			document.getElementById("signupForm").submit();
		})
		
		// 아이디 팝업
		$("#checkId").on("click", function(){
			let url = "/checkId.mem";
			let name ="아이디 중복검사";
			let option ="width=500, height=300, left=700, top=300";
			window.open(url, name, option);
		})
		
		// 닉네임 팝업
		$("#checkNickname").on("click", function(){
			let url = "/checkNickname.mem";
			let name ="닉네임 중복검사";
			let option ="width=500, height=300, left=700, top=300";
			window.open(url, name, option);
		})
		
		// 다음 우편번호 api
		$("#btnPostCode").on("click", function(){
			new daum.Postcode({
	            oncomplete: function(data) {
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("#postcode").val(data.zonecode);
	                $("#roadAddr").val(roadAddr);
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                	$("#extraAddr").val(extraRoadAddr);
	                } else {
	                	$("#extraAddr").val("");
	                }
	            }
	        }).open();
		})
	</script>
</body>

</html>