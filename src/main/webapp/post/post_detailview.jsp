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
      #container {
        margin: auto;
        background-color: antiquewhite;
        width: 900px;
        height: 1000px;
      }
      #content-box {
        background-color: rgb(255, 254, 248);
        height: 500px;
        width: 800px;
        margin: auto;
        margin-top: 50px;
        border-radius: 15px;
      }

      #input-box {
        width: 800px;
        margin: auto;
      }
      #p_c_input {
        margin: auto;
        width: 600px;
        height: 80px;
        border-radius: 10px;
        resize: none;
      }
      #submit {
        width: 70px;
        height: 70px;
        border-radius: 10px;
      }
      .comment-box {
        margin: auto;
        background-color: white;
        width: 650px;
        height: 140px;
        border-radius: 10px;
      }

      #content {
        height: 400px;
      }
      .comment-text {
        height: 60px;
      }

      #profile {
        width: 80px;
        height: 80px;
      }
      #text {
        height: 40px;
      }
      #hate {
        width: 25px;
        height: 25px;
      }
      #like {
        width: 30px;
        height: 30px;
      }
      #report {
        width: 40px;
        height: 30px;
      }
      div {
        border: 1px solid black;
      }
      .click {
        background-color: rgb(211, 209, 209);
        border-radius: 20px;
        margin: 4px;
      }
      #user-box {
        text-align: center;
        width: 150px;
        margin: auto;
      }
    </style>
  </head>

  <body>
    <div id="container">
      <div id="content-box">
        <div class="row">
          <div class="col"><h4>title</h4></div>
        </div>
        <div class="row">
          <div class="col-2">닉네임</div>
          <div class="col-7"></div>
          <div class="col-3">작성일,조회수</div>
        </div>
        <div class="row">
          <div class="col-8">게시글번호</div>
          <div class="col">
            <div class="row">
              <div class="col-5 click">
                <img src="/img/like.png" alt="좋아요" id="like" />
                123
              </div>
              <div class="col-5 click">
                <img src="/img/hate.png" alt="싫어요" id="hate" />
                3211
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col" id="content">내용</div>
        </div>
        <div id="user-box">
          <div class="row">
            <div class="col">
              <button class="btn-warning btn">수정</button>
            </div>
            <div class="col">
              <button class="btn-danger btn">삭제</button>
            </div>
          </div>
        </div>
      </div>
      <br />
      <br />
      <br />
      <div id="input-box">
        <div class="row">
          <div class="col">공감순 높은평점순 낮은평점순 최신순</div>
        </div>
        <div class="row input">
          <div class="col-10">
            <textarea
              name="p_c_input"
              id="p_c_input"
              class="form-control"
              cols="50"
              rows="2"
              placeholder="댓글을 입력해주세요."
            ></textarea>
          </div>
          <div class="col-2">
            <button type="submit" id="submit" class="btn btn-info">
              리뷰<br />등록
            </button>
          </div>
        </div>
      </div>
      <br /><br />
      <div class="comment-box">
        <div class="row">
          <div class="col-2">
            <img src="/img/images.png" alt="profile" id="profile" />
          </div>
          <div class="col-10">
            <div class="row">
              <div class="col-2">닉네임</div>
              <div class="col-8"></div>
              <div class="col-2">
                <img src="/img/report.png" alt="reoirt" id="report" />
              </div>
            </div>
            <div class="row comment-text">
              <div class="col-10">텍스트</div>
              <div class="col-2"></div>
            </div>
            <div class="row">
              <div class="col-2">작성일</div>
              <div class="col-5"></div>
              <div class="col-2 click">
                <img src="/img/like.png" alt="좋아요" id="like" />
                123
              </div>
              <div class="col-2 click">
                <img src="/img/hate.png" alt="싫어요" id="hate" />
                3211
              </div>
            </div>
          </div>
        </div>
      </div>
      <br />
    </div>

    <script></script>
  </body>
</html>
