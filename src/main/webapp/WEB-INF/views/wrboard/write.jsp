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
	<form method="post" action="/wrboard/write">
		<div>
			<label>제목</label> <input type="text" id="wr_title" name="wr_title" />
		</div>
		<div>
			<label>카테고리</label>
			<select name="category" id="category">
			
			<option value="요청">요청</option>
	
			<option value="신고">신고</option>
	
			<option value="기타">기타</option>
			</select>
		</div>
		<div>
			<input type="hidden" name="email" value="${member.email }"/>
		</div>

		  <div>
		    <label>내용</label>
		    <textarea id="summernote" rows="5" cols="50" name="wr_contents"></textarea>
		  </div>

		<div>
			<button type="submit" id="submit" onclick="return checkblank();" name="submit" class="btn btn-primary pull-right">글쓰기</button>
		</div>
	</form>
<script src="/resources/js/editor.js"></script>
</body>
</html>