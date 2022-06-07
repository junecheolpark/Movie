<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- Latest compiled and minified CSS -->
    <!-- <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css"
      integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
      crossorigin="anonymous"
    /> -->

    <!-- Optional theme -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css"
      integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ"
      crossorigin="anonymous"
    />

    <!-- Latest compiled and minified JavaScript -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"
      integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
      crossorigin="anonymous"
    ></script>
    <link
      href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <style>
      #submit {
        border-radius: 13px;
        width: 70px;
        height: 40px;
      }
      .container {
        margin: auto;
        margin-top: 30px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <form action="/" method="post" enctype="multipart/form-data">
        <div class="row">
          <div class="col">
            <h2>게시글 작성</h2>
            <hr />
          </div>
        </div>
        <div class="row">
          <div class="col-10">
            <input
              type="text"
              class="form-control"
              id="title"
              name="title"
              placeholder="제목을 입력해 주세요."
            />
          </div>
          <div class="col-2">
            <button type="submit" id="submit" class="btn btn-primary">
              등록
            </button>
          </div>
        </div>
        <br />
        <div class="row">
          <div class="col">
            <div id="summernote" name="summernote">안녕하세요</div>
          </div>
        </div>
      </form>
    </div>
    <script>
      $("#summernote").summernote({
        placeholder: "내용을 작성하세요",
        height: 550,
        maxHeight: 800,
        disableResizeEditor: true,
      });
    </script>
  </body>
</html>
