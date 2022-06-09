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
<title>NICKNAME 중복확인</title>
</head>
<body>
	<form id="checkNicknameForm" action="/checkNicknameProc.mem"
		method="get">
		<div class="container">
			<div class="row justify-content-center">
				<div class="row m-2 p-3">
					<div class="d-flex justify-content-center border-bottom">
						<h4>닉네임 중복확인</h4>
					</div>
				</div>
				<div class="row p-3">
					<div class="col-8">
						<input type="text" class="form-control" id="user_nickname"
							name="user_nickname" value="${user_nickname}"
							placeholder="닉네임 입력">
					</div>
					<div class="col-4">
						<button type="button" class="btn btn-outline-success"
							id="checkNickname">중복확인</button>
					</div>
				</div>
				<div class="row p-3">
					<div class="col-12 d-flex justify-content-center">
						<c:if test="${rs eq 'available'}">
							<span>사용 가능한 닉네임입니다.</span>
						</c:if>
						<c:if test="${rs eq 'unavailable'}">
							<span>사용 불가한 닉네임입니다.</span>
						</c:if>
					</div>
				</div>
				<div class="row p-3 justify-content-center">
					<div class="col-3 d-flex justify-content-end">
						<button type="button" class="btn btn-primary w-100" id="useBtn"
							disabled>사용</button>
					</div>
					<div class="col-3 d-flex justify-content-start">
						<button type="button" class="btn btn-danger w-100" id="cancelBtn">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
		$("#checkNickname").on("click", function() {
			let regexNickname = /[a-zA-Z0-9ㄱ-힣]{4,8}/;
			if (!regexNickname.test($("#user_nickname").val())) {
				alert("형식에 맞지 않는 닉네임입니다.");
				return;
			}
			$("#checkNicknameForm").submit();
		})

		let useBtn = document.getElementById("useBtn");

		console.log("${rs}");
		if ("${rs}" === "available") {
			useBtn.disabled = false;
		} else {
			useBtn.disabled = true;
		}

		useBtn.onclick = function() {
			let regexNickname = /[a-zA-Z0-9ㄱ-힣]{4,8}/;
			if (!regexNickname.test($("#user_nickname").val())) {
				alert("형식에 맞지 않는 닉네임입니다.");
				useBtn.disabled = true;
				return;
			}

			opener.document.getElementById("user_nickname").value = document.getElementById("user_nickname").value;
			self.close();
		}

		$("#cancelBtn").on("click", function() {
			self.close();
		})
	</script>

</body>
</html>