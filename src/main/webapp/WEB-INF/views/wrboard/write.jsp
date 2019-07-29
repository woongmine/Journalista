<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<title>게시물 작성</title>
</head>
<body>
	<form method="post" action="/wrboard/write">
		<div>
			<label>제목</label> <input type="text" name="wr_title" />
		</div>

		<div>
			<label>작성자</label> <input type="text" name="name" value="${member.name}" readonly/>
			<input type="hidden" name="email" value="${member.email }"/>
		</div>

		  <div>
		    <label>내용</label>
		    <textarea rows="5" cols="50" name="wr_contents"></textarea>
		  </div>

		<div>
			<button type="submit">작성</button>
		</div>
	</form>

</body>
</html>