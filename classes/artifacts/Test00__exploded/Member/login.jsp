<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>로그인</title>
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
                        <h4>로그인</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group p-2">
                            <p>ID*</p>
                            <div>
                                <input type="text" class="form-control" id="user_id" placeholder="ID">
                            </div>
                        </div>
                        <div class="form-group p-2">
                            <p>PW*</p>
                            <div>
                                <input type="password" class="form-control " id="user_pw" placeholder="PW">
                            </div>
                        </div>
                        <div class="row p-3 justify-content-center">
                            <div class="col-12 col-md-4 col-lg-4 d-flex justify-content-end">
                                <button type="button" class="btn btn-dark rounded w-100">로그인</button>
                            </div>
                            <div class="col-12 col-md-4 col-lg-4 flex justify-content-start">
                                <button type="button" class="btn btn-warning rounded w-100">카카오톡 로그인</button>
                            </div>
                        </div>
                        <div class="row p-3">
                            <div class="col text-center">
                                <p class="m-0">계정이 없으신가요? <a href="/"
                                        class="text-decoration-none"><strong>회원가입</strong></a>을 해보세요</p><br>
                                <p class="m-0">아이디를 잊으셨나요? <a href="/" class="text-decoration-none"><strong>아이디
                                            찾기</strong></a></p><br>
                                <p class="m-0">비밀번호를 잊으셨나요? 비밀번호 <a href="/"
                                        class="text-decoration-none"><strong>찾기</strong></a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>