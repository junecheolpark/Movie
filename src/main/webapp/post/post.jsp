<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
.container {
	text-align: center;
	width: 1200px;
	height: 800px;
}

.form-select {
	display: inline-block;
	width: 100px;
}

.search-method {
	width: 100px;
	display: inline-block;
}

.list {
	width: 120px;
	display: inline-block;
}

.form-control {
	width: 300px;
	display: inline-block;
}

button {
	border: solid 1px black;
	line-height: normal;
}

.content-body {
	height: 700px;
	background-color: rgb(255, 254, 248);
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col">
				<h3>
					자유게시판<br />[공지]영화 추천이 자유게시판입니다.
				</h3>
			</div>
		</div>
		<div class="content-header">
			<div class="row">
				<div class="col-10"></div>
				<div class="col-2">
					<select class="form-select list"
						aria-label="Default select example">
						<option value="1" selected>목록 10개</option>
						<option value="2">목록 20개</option>
						<option value="3">목록 30개</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-1">
					<strong>글번호</strong>
				</div>
				<div class="col-5">
					<strong>제목</strong>
				</div>
				<div class="col-2">
					<strong>글쓴이</strong>
				</div>
				<div class="col-2">
					<strong>작성일</strong>
				</div>
				<div class="col-1">
					<strong>추천</strong>
				</div>
				<div class="col-1">
					<strong>조회</strong>
				</div>
			</div>
			<hr />
		</div>
		<div class="content-body">
			<!--내용-->
			<c:choose>
				<c:when test="${list.size() ==0 }">
					<div class="row">
						<div class="col">등록된 게시글이 없습니다.</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<div class="row">
							<div class="col-1">${dto.seq_post }</div>
							<div class="col-5">
								<a href="/detailPost.po?seq_post=${dto.seq_post}">${dto.p_title }</a>
							</div>
							<div class="col-2">${dto.user_nickname }</div>
							<div class="col-2">${dto.p_date }</div>
							<div class="col-1">추천횟수</div>
							<div class="col-1">
								<p>${dto.p_view_count }</p>
							</div>
						</div>
						<hr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="content-footer">
			<hr />
			<!--검색-->
			<div class="row">
				<div class="col-2">
					<button class="btn btn-secondary" id="btn_write">글쓰기</button>
				</div>
				<div class="col-8"></div>
				<div class="col-2">
					<button type="button" id="btn_my_post" class="btn btn-secondary">내글보기</button>
				</div>
			</div>
			<div class="row">
				<!--글 페이지 이동-->
				<div class="col-4"></div>
				<div class="col-4">
					<nav>
						<ul class="pagination justify-content-center">
							<c:if test="${naviMap.needPrev eq true}">
								<li class="page-item"><a class="page-link"
									href="/post.po?curPage=${naviMap.startNavi-1}">Prev</a></li>
								<%-- 현재 6페이지에 있는 상태에서 이전 버튼을 클릭했음 ->  5페이지로 이동 --%>
							</c:if>

							<c:forEach var="pageNum" begin="${naviMap.startNavi}"
								end="${naviMap.endNavi}" step="1">
								<li class="page-item"><a class="page-link"
									href="/post.po?curPage=${pageNum}">${pageNum}</a></li>
							</c:forEach>

							<c:if test="${naviMap.needNext eq true}">
								<li class="page-item"><a class="page-link"
									href="/post.po?curPage=${naviMap.endNavi+1}">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row">
				<!--글 페이지 이동-->
				<div class="col-2"></div>
				<div class="col-8">
					<select class="form-select search-method"
						aria-label="Default select example">
						<option selected>제목</option>
						<option value="1">내용</option>
						<option value="2">제목+내용</option>
						<option value="3">글쓴이</option>
					</select> <input type="text" class="form-control" />
					<button class="btn btn-secondary">검색</button>
				</div>
				<div class="col-2"></div>
			</div>
		</div>
	</div>

	<script>
		$("#btn_write").on("click", function() {
			location.href = "/write.po"
		})
		$("#btn_my_post").on("click",function(){
			$.ajax({
				url:"/myPostProc.po",
				type:"get",
				dataType:"json",
				success:function(data){
					$(".content-body").empty();
					if(data.length ==0){
						let div_row= $("<div>").attr("class","row");
						let div_col= $("<div>").attr("class","col").html("작성한 게시물이 없습니다.");
						div_row.append(div_col);
						$(".content-body").append(div_row);
					}else{
						for(let dto of data){
							let div_row= $("<div>").attr("class","row");
							let div_col1_1= $("<div>").attr("class","col-1");
							let div_col1_2= $("<div>").attr("class","col-1");
							let div_col1_3= $("<div>").attr("class","col-1");
							let div_col2_1= $("<div>").attr("class","col-2");
							let div_col2_2= $("<div>").attr("class","col-2");
							let div_col5= $("<div>").attr("class","col-5");
							let hr=$("<hr>");
							
							
							let a=$("<a>").attr("href","/detailPost.po?seq_board=${dto.seq_post}").html(dto.p_title);
							div_col5.append(a);
							
							console.log(dto.seq_post);
							div_row.append(div_col1_1.html(dto.seq_post),div_col5,div_col2_1.html(dto.user_nickname),
									div_col2_2.html(dto.p_date),div_col1_2.html("추천횟수dd"),div_col1_3.html(dto.p_view_count),hr);
							
							$(".content-body").append(div_row);
							
							
							
						}
					}
				},
				error:function(e){
					console.log(e);
				}
			
			})
		})
	</script>
</body>
</html>
