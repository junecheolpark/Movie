<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      crossorigin="anonymous"
    />
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
        height: 500px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col">
          <h3>자유게시판<br />[공지]영화 추천이 자유게시판입니다.</h3>
        </div>
      </div>
      <div class="content-header">
        <div class="row">
          <div class="col-10"></div>
          <div class="col-2">
            <select
              class="form-select list"
              aria-label="Default select example"
            >
              <option value="1" selected>목록 10개</option>
              <option value="2">목록 20개</option>
              <option value="3">목록 30개</option>
            </select>
          </div>
        </div>
        <div class="row">
          <div class="col-7"><strong>제목</strong></div>
          <div class="col-2"><strong>글쓴이</strong></div>
          <div class="col-1"><strong>작성일</strong></div>
          <div class="col-1"><strong>추천</strong></div>
          <div class="col-1"><strong>조회</strong></div>
        </div>
        <hr />
      </div>
      <div class="content-body">
        <!--내용-->
      </div>
      <div class="content-footer">
        <hr />
        <!--검색-->
        <div class="row">
          <div class="col-2">
            <button class="btn btn-secondary">글쓰기</button>
          </div>
          <div class="col-8"></div>
          <div class="col-2">
            <button class="btn btn-secondary">내글보기</button>
          </div>
        </div>
        <div class="row">
          <!--글 페이지 이동-->
          <div class="col-4"></div>
          <div class="col-4">
            <button class="btn btn-secondary">1,2,3,4,5,6,7</button>
          </div>
          <div class="col-4"></div>
        </div>
        <div class="row">
          <!--글 페이지 이동-->
          <div class="col-2"></div>
          <div class="col-8">
            <select
              class="form-select search-method"
              aria-label="Default select example"
            >
              <option selected>제목</option>
              <option value="1">내용</option>
              <option value="2">제목+내용</option>
              <option value="3">글쓴이</option>
            </select>
            <input type="text" class="form-control" />
            <button class="btn btn-secondary">검색</button>
          </div>
          <div class="col-2"></div>
        </div>
      </div>
    </div>
  </body>
</html>
