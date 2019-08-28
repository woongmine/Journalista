<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<title>게시물 작성</title>
<link href="/resources/summernote/summernote-bs4.css" rel="stylesheet">
<script src="/resources/summernote/summernote-bs4.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
</head>
<body>
<div class="col-lg-10 mx-auto">
<div class="card">
  <h3 class="card-header"><center><a href="/wrboard/listPage">게시판</a></center></h3>
  <div class="card-body">
    <h5 class="card-title">WRITE</h5>
    <p class="card-text">
    <form method="post" action="/wrboard/write">
			<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
  </div>
  <input type="text" class="form-control" id="wr_title" name="wr_title" aria-label="subject" aria-describedby="inputGroup-sizing-sm">
</div>
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">카테고리</label>
  </div>
  <select class="custom-select" name="category" id="category">
    <option value="요청">요청</option>
    <option value="신고">신고</option>
    <option value="기타">기타</option>
  </select>
</div>
<textarea id="summernote" name="wr_contents" style="display:none"></textarea>
					<hr>
					<div class="row mx-auto">
					<div class="col">
					<a class="button large" href="./listPage">CANCEL</a>
					</div>
					<div class="d-flex justify-content-end">
					<button type="submit" class="button large" onclick="return checkblank();" id="submit" name="submit">WRITE</button>
					</div>
					</div>
  </div>
  </form>
</div>
</div>
<script src="/resources/js/editor.js"></script>
</body>
</html>