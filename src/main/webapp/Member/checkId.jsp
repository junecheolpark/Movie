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
<title>ID 중복확인</title>
</head>
<body>
	<form id="checkIdForm" action="/checkIdProc.mem" method="get">
		<div class="container">
			<div class="row justify-content-center">
				<div class="row m-2 p-3">
					<div class="d-flex justify-content-center border-bottom">
						<h4>아이디 중복확인</h4>
					</div>
				</div>
				<div class="row p-3">
					<div class="col-8">
						<input type="text" class="form-control" id="user_id"
							name="user_id" value="${user_id}" placeholder="아이디 입력">
					</div>
					<div class="col-4">
						<button type="button" class="btn btn-outline-success" id="checkId">중복확인</button>
					</div>
				</div>
				<div class="row p-3">
					<div class="col-12 d-flex justify-content-center">
						<c:if test="${rs eq 'available'}">
							<span>사용 가능한 아이디입니다.</span>
						</c:if>
						<c:if test="${rs eq 'unavailable'}">
							<span>사용 불가한 아이디입니다.</span>
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
		$("#checkId").on("click", function() {
			let regexId = /^[a-zA-Z][\w]+@[a-zA-Z]+\.(com|net|co\.kr|or\.kr)$/;
			if (!regexId.test($("#user_id").val())) {
				alert("형식에 맞지 않는 아이디입니다.");
				return;
			}
			$("#checkIdForm").submit();
		})

		let useBtn = document.getElementById("useBtn");

		console.log("${rs}");
		if ("${rs}" === "available") {
			useBtn.disabled = false;
		} else {
			useBtn.disabled = true;
		}

		useBtn.onclick = function() {
			let regexId = /[a-zA-Z0-9]{6,12}/;
			if (!regexId.test($("#user_id").val())) {
				alert("형식에 맞지 않는 아이디입니다.");
				useBtn.disabled = true;
				return;
			}

			opener.document.getElementById("user_id").value = document
					.getElementById("user_id").value;
			self.close();
		}

		$("#cancelBtn").on("click", function() {
			self.close();
		})
	</script>

</body>
</html>