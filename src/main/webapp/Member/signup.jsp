<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원가입</title>
<style>
        .card {
            width: 60%;
            border: none;
            border-bottom: 1px solid rgba(0, 0, 0, .125);
        }

        .card-header {
            background-color: white;
        }
    </style>
</head>
<body>
	<div class="container">
        <div class="row justify-content-center">
            <form action="" method="post">
                <div class="card card-custom">
                    <div class="col card-header">
                        <h4>회원가입</h4>
                    </div>
                    <div class="card-body">
                        <div class="row p-2">
                            <div class="col-12">
                                <p>이름*</p>
                            </div>
                            <div class="col-12">
                                <input type="text" class="form-control" id="user_name">
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col-12">
                                <p>이메일 주소*</p>
                            </div>
                            <div class="col-12">
                                <input type="text" class="form-control" id="user_id">
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col-12">
                                <p>비밀번호*</p>
                            </div>
                            <div class="col-12">
                                <input type="password" class="form-control " id="user_pw">
                            </div>
                            <div class="form-text">비밀번호는 8~15자 이내로 입력하세요.<br>
                                (영어 대소문자, 숫자, ~!@#$%^&* 포함)</div>
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
                            <div class="col-12">
                                <input type="text" class="form-control" id="user_id">
                            </div>
                            <div class="form-text">나를 표현할 닉네임을 입력해주세요.</div>
                        </div>
                        <div class="row p-2">
                            <div class="col-12">
                                <p>생년월일*</p>
                            </div>
                            <div class="col-12">
                                <input type="text" class="form-control" id="user_birth">
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col-12">
                                <p><label for="phone" class="form-label">전화번호*</label></p>
                            </div>
                            <div class="col-4 mb-2">
                                <select class="form-select" id="phone1">
                                    <option value="010" selected>010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                            </div>
                            <div class="col-4 mb-2">
                                <input type="text" class="form-control" id="phone2">
                            </div>
                            <div class="col-4 mb-2">
                                <input type="text" class="form-control" id="phone3">
                            </div>
                            <div class="col d-none">
                                <input type="text" id="phone" name="user_phone">
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col">
                                <input type="text" class="form-control" id="postCode" name="postCode" placeholder="우편번호">
                            </div>
                            <div class="col">
                                <button type="button" class="btn btn-primary w-100" id="btnPostCode">우편번호 찾기</button>
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col">
                                <input type="text" class="form-control" id="roadAddr" name="roadAddr" placeholder="도로명주소">
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col mb-2">
                                <input type="text" class="form-control" id="detailAddr" name="detailAddr" placeholder="상세주소">
                            </div>
                            <div class="col mb-2">
                                <input type="text" class="form-control" id="extraAddr" name="extraAddr" placeholder="읍/면/동">
                            </div>
                        </div>
                        <div class="row p-3 justify-content-center">
                            <div class="col-12 col-md-4 col-lg-4 d-flex justify-content-end">
                                <button type="button" class="btn btn-info rounded w-100">회원가입</button>
                            </div>
                            <div class="col-12 col-md-4 col-lg-4 flex justify-content-start">
                                <button type="button" class="btn btn-warning rounded w-100">카카오톡 회원가입</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>