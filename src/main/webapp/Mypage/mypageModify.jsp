<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script
            src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>MypageModify</title>

    <style>
        body {
            background-color: black;
        }

        a {
            text-decoration: none;
        }

        .contents {
            height: 1400px;
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

        .contentsModify {
            text-align: left;
        }

        .contentsModifyBox {
            margin: 20px;
        }

        .btn-outline-info {
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
                        <li class="nav-item"><a class="nav-link" href="/post.po?curPage=1">자유게시판</a></li>
                        <c:choose>
                            <c:when test="${empty loginSession}">
                                <li class="nav-item"><a class="nav-link" href="/toLogin.mem">로그인</a></li>
                                <li class="nav-item"><a class="nav-link" href="/toSignUp.mem">회원가입</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item"><a class="nav-link" href="/logout.mem">로그아웃</a></li>
                                <li class="nav-item"><a class="nav-link" href="/wishlist.wish">찜한 영화</a></li>
                                <li class="nav-item"><a class="nav-link" href="/myPage.mem">마이페이지</a></li>
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
                                <a href="/myPage.mem" class=""> <img class="img-fluid" id="myPageIcon"
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

<!-- Contents -->
<div class="contents">
    <div class="contents row text-black">
        <div class="contentsBox">
            <div class="contentsModifyBox">
                <div class="contentsImgBox">
                    <c:if test="${profile eq null}">
                        <img class="profileImg" src="/images/기본프로필.jpg">
                    </c:if>
                    <c:if test="${profile ne null}">
                        <img class="profileImg" src="/files/${profile}">
                    </c:if>
                </div>
                <br><p>${dto.user_nickname}</p>
                <div class="contentsModify">
                    <div class="container w-50">
                        <form id="modifyForm" action="/modifyProc.mem" method="post" enctype="multipart/form-data">
                            <div class="row p-2">
                                <h2>내 정보 수정</h2>
                                <div class="col-12">
                                    <label for="profileImg" class="form-label">프로필 사진</label><br>
                                    <input type="file" name="photo">
                                </div>
                                <div class="row p-2">
                                    <div class="col-12">
                                        <label for="nickname" class="form-label">닉네임</label>
                                    </div>
                                </div>
                                <div class="col-8 mb-2">
                                    <input type="text" class="form-control" id="user_nickname"
                                           name="user_nickname" value="${dto.getUser_nickname()}" readonly>
                                </div>
                                <div class="col-4 mb-2">
                                    <button type="button" id="checkNicknameBtn"
                                            class="btn btn-outline-warning w-100" disabled>닉네임 확인</button>
                                </div>
                            </div>
                            <c:if test="${loginSession.user_category eq '일반 가입'}">
                                <%-- 일반 회원이라면 비밀번호 보이기 --%>
                                <div class="row p-2">
                                    <div class="col-12">
                                        <label for="password" class="form-label">비밀번호</label>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <input type="password" class="form-control" id="user_pw" name="user_pw" readonly>
                                    </div>
                                </div>
                                <div class="row p-2">
                                    <div class="col-12">
                                        <label for="pwCheck" class="form-label">비밀번호 확인</label>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <input type="password" class="form-control" id="user_pwCheck" readonly>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${loginSession.user_category eq '카카오 가입'}">
                                <%-- 카카오 회원이라면 비밀번호 감추기 --%>
                                <div class="row p-2 d-none">
                                    <div class="col-12 ">
                                        <label for="password" class="form-label">비밀번호</label>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <input type="password" class="form-control" id="user_pw" name="user_pw"
                                               readonly value="${loginSession.user_pw}">
                                    </div>
                                </div>
                                <div class="row p-2 d-none">
                                    <div class="col-12 ">
                                        <label for="pwCheck" class="form-label">비밀번호 확인</label>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <input type="password" class="form-control" id="user_pwCheck"
                                               readonly value="${loginSession.user_pw}">
                                    </div>
                                </div>
                            </c:if>
                            <div class="row p-2">
                                <div class="col-12">
                                    <label for="phone" class="form-label">휴대폰 번호</label>
                                </div>
                                <div class="col-4 mb-2">
                                    <select class="form-select" id="phone1" readonly>
                                        <option value="010" selected>010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="018">018</option>
                                        <option value="019">019</option>
                                    </select>
                                </div>
                                <div class="col-4 mb-2">
                                    <input type="text" class="form-control" id="phone2" readonly>
                                </div>
                                <div class="col-4 mb-2">
                                    <input type="text" class="form-control" id="phone3" readonly>
                                </div>
                                <div class="col d-none">
                                    <input type="text" id="user_phone" name="user_phone">
                                </div>
                            </div>
                            <div class="row p-2">
                                <div class="col-12">
                                    <label for="postcode" class="form-label">주소</label>
                                </div>
                                <div class="col">
                                    <input type="text" class="form-control" id="postcode"
                                           name="postcode" value="${dto.getPostcode()}"
                                           placeholder="우편번호" readonly>
                                </div>
                                <div class="col">
                                    <button type="button" class="btn btn-outline-primary w-100"
                                            id="btnPostcode" disabled>우편번호 찾기</button>
                                </div>
                            </div>
                            <div class="row p-2">
                                <div class="col">
                                    <input type="text" class="form-control" id="roadAddr"
                                           name="roadAddr" value="${dto.getRoadAddr()}"
                                           placeholder="도로명주소" readonly>
                                </div>
                            </div>
                            <div class="row p-2">
                                <div class="col mb-2">
                                    <input type="text" class="form-control" id="detailAddr"
                                           name="detailAddr" value="${dto.getDetailAddr()}"
                                           placeholder="상세주소" readonly>
                                </div>
                                <div class="col mb-2">
                                    <input type="text" class="form-control" id="extraAddr"
                                           name="extraAddr" value="${dto.getExtraAddr()}"
                                           placeholder="읍/면/동" readonly>
                                </div>
                            </div>

                            <div class="row justify-content-center btn-before">
                                <div class="col-4 d-flex justify-content-end">
                                    <button type="button" class="btn btn-secondary" id="backBtn">뒤로가기</button>
                                </div>
                                <div class="col-4 d-flex justify-content-start">
                                    <button type="button" class="btn btn-primary" id="modifyBtn">수정</button>
                                </div>
                            </div>
                            <div class="row justify-content-center btn-after d-none">
                                <div class="col-4 d-flex justify-content-end">
                                    <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
                                </div>
                                <div class="col-4 d-flex justify-content-start">
                                    <button type="button" class="btn btn-primary" id="completeBtn">수정완료</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <script>

                        const searchForm = $(".searchForm");
                        searchForm.on("submit", function (event) {
                            if ($(this).children(".searchInput").val() === "") {
                                event.preventDefault();
                                alert("검색어를 입력하세요");
                            }
                        });

                        // 뒤로가기버튼을 눌렀을때 mypageIndex로 돌아가기
                        $("#backBtn").on("click", function() {
                            location.href = "/myPage.mem";
                        });

                        // 닉네임 확인 버튼 누르면 팝업창 띄우기
                        document.getElementById("checkNicknameBtn").onclick = function() {
                            // 팝업창을 띄우기 위해 필요한 3가지 값
                            // 1. jsp 경로값 (팝업창을 꾸며주는 jsp 별도로 필요)
                            // 2. 팝업창의 이름값
                            // 3. 팝업창의 크기, 위치
                            let url = "/Member/checkNickname.jsp";
                            let name = "닉네임 중복검사";
                            let option = "width=1500, height=900, left=80, top=300";
                            window.open(url, name, option);
                        }

                        // 수정버튼을 눌렀을때
                        $("#modifyBtn").on("click", function() {
                            $("input").not("#user_id").attr("readonly", false); // 닉네임를 제외한 input readonly 제거
                            $("#checkNicknameBtn").attr("disabled", false); // 닉네임 확인 버튼에 걸린 disabled 제거
                            $("#btnPostcode").attr("disabled", false); // 우편번호찾기 버튼에 걸린 disabled 제거
                            $(".btn-before").css("display", "none"); // 기존의 버튼들 감춰주기
                            $(".btn-after").removeClass("d-none"); // 취소, 완료버튼 보여주기
                        });

                        // 수정화면에서 취소 버튼을 눌렀을때
                        $("#cancelBtn").on("click", function() {
                            location.href = "/modify.mem";
                        });

                        // 수정완료버튼 눌렀을 때
                        $("#completeBtn").on("click", function() {

                            // 닉네임, 전화번호, 주소 빈값/유효한 값인지 확인
                            let regexNickname = /[a-zA-Z0-9ㄱ-힣]{4,8}/; // 닉네임 정규식
                            let regexPhone = /[0-9]{11}/; // 휴대전화 정규식
                            let regexPw = /[a-zA-Z0-9~!@#$%^&*]{6,12}/; // 비밀번호 정규식

                            // user_phone 번호 합쳐주는 작업
                            let user_phone = $("#phone1 option:selected").val() + $("#phone2").val() + $("#phone3").val();
                            $("#user_phone").val(user_phone);

                            // 유효성 검사
                            if (!regexNickname.test($("#user_nickname").val())) {
                                alert("형식에 맞지않는 닉네임입니다.");
                                return;
                            } else if (!regexPhone.test(user_phone)) { // 숫자 데이터에 대한 별도의 형변환이 필요없음
                                alert("형식에 맞지않는 휴대폰번호입니다.");
                                return;
                            } else if (!regexPw.test(user_pw)) {
                                alert("형식에 맞지않는 비밀번호입니다.");
                                return;
                            } else if ($("#user_pw").val() !== $("#user_pwCheck").val()) {
                                alert("비밀번호가 일치하지 않습니다.");
                                return;
                            } else if ($("#postcode").val() === "" || $("#roadAddr").val() === "") { // 빈값확인
                                alert("주소를 입력해 주세요.");
                                return;
                            }

                            $("#modifyForm").submit();
                        })


                        // 휴대폰 번호 셋팅
                        let user_phone = "${dto.getUser_phone()}";
                        let phone1 = user_phone.slice(0, 3);
                        let phone2 = user_phone.slice(3, 7);
                        let phone3 = user_phone.slice(7);

                        // 셀렉트 박스에 default selected값 주기
                        $("#phone1").val(phone1).prop("selected", true);
                        $("#phone2").val(phone2);
                        $("#phone3").val(phone3);

                        // 다음 우편번호 api 띄우기
                        $("#btnPostcode")
                            .on(
                                "click",
                                function() {
                                    new daum.Postcode(
                                        {
                                            oncomplete : function(
                                                data) {
                                                var roadAddr = data.roadAddress; // 도로명 주소 변수
                                                var extraRoadAddr = ''; // 참고 항목 변수

                                                if (data.bname !== ''
                                                    && /[동|로|가]$/g
                                                        .test(data.bname)) {
                                                    extraRoadAddr += data.bname;
                                                }
                                                // 건물명이 있고, 공동주택일 경우 추가한다
                                                if (data.buildingName !== ''
                                                    && data.apartment === 'Y') {
                                                    extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                                        + data.buildingName
                                                        : data.buildingName);
                                                }
                                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                                if (extraRoadAddr !== '') {
                                                    extraRoadAddr = ' ('
                                                        + extraRoadAddr
                                                        + ')';
                                                }

                                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                                $("#postcode")
                                                    .val(
                                                        data.zonecode);
                                                $("#roadAddr")
                                                    .val(
                                                        roadAddr);

                                                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                                                if (roadAddr !== '') {
                                                    $(
                                                        "#extraAddr")
                                                        .val(
                                                            extraRoadAddr);
                                                } else {
                                                    $(
                                                        "#extraAddr")
                                                        .val(
                                                            "");
                                                }
                                            }
                                        }).open();
                                })
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
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
                            <li class="nav-item mb-2"><a href="/myPage.mem" class="nav-link p-0">마이페이지</a></li>
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
                            <li class="nav-item mb-2"><a href="/myPage.mem" class="nav-link p-0">마이페이지</a></li>
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
$("#searchBtn").on("click", function(){ // 검색 버튼 클릭 시
	// 검색어키워드 값을 가져오기
	let searchKeyword = $("#searchKeyword").val();
	console.log(searchKeyword);
	// /searchProc.bo?searchKeyword=...

    const searchForm = $(".searchForm");
    searchForm.on("submit", function (event) {
        if ($(this).children(".searchInput").val() === "") {
            event.preventDefault();
            alert("검색어를 입력하세요");
        }
    });
</script>
</body>

</html>