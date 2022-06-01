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
<title>아이디 찾기</title>
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
						<h4>아이디 찾기</h4>
					</div>
					<div class="card-body">
						<div class="form-group p-2">
							<p>이름*</p>
							<div>
								<input type="text" class="form-control" id="user_name">
							</div>
							<div class="form-text">회원정보에 등록한 이름을 입력해주세요.</div>
						</div>
						<div class="form-group p-2">
							<p>이메일*</p>
							<div>
								<input type="text" class="form-control" id="user_email">
							</div>
							<div class="form-text">
								가입할 때 사용하셨던 이메일을 입력해주세요. <br> 소설 계정으로 가입하셨을 때는 해당 SNS의 이메일을
								입력해주세요.
							</div>
						</div>
						<div class="row p-3 justify-content-center">
							<div
								class="col-12 col-md-6 col-lg-6 d-flex justify-content-center">
								<button type="button" class="btn btn-info rounded w-100">아이디
									찾기</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>