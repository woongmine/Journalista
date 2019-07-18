<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <%@ page session="false" %> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>게시물 작성</title>
</head>
<body>
	<form method="post" action="/board/reg">
		<div>
			<label>제목</label> <input type="text" name="title" />
		</div>

		<div>
			<label>작성자</label> <input type="text" name="writer" />
		</div>

		  <div>
		    <label>내용</label>
		    <textarea rows="5" cols="50" name="content"></textarea>
		  </div>

		<div>
			<button type="submit">작성</button>
		</div>
	</form>

</body>
</html>