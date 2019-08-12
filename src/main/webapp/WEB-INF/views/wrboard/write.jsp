﻿<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<script>
function checkblank(){
	var wr_title = $('#wr_title').val();
	var wr_contents = $('#wr_contents').val();
	var writer = $('#name').val();
	if (wr_title == "" || wr_contents == ""){
		alert("내용없음 올리지 마루여");
		return false;
		}
	else if(writer == ""){
		alert("않이 록으인 하세여;;");
		return false;
		}
	}
</script>
<title>게시물 작성</title>
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
		    <textarea rows="5" cols="50" id="wr_contents" name="wr_contents"></textarea>
		  </div>

		<div>
			<button type="submit" onclick="return checkblank();">작성</button>
		</div>
	</form>

</body>
</html>