<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <%@ page session="false" %> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>게시물 수정</title>
</head>
<body>
	<form method="post">
		<input type="hidden" name="bno" value="${view.bno }">
		<div>
			<label>제목</label> <input type="text" name="title"
				value="${view.title }" />
		</div>

		<div>
			<label>작성자</label> <input type="text" name="writer"
				value="${view.writer }" readonly="readonly" />
		</div>

		<div>
			<label>작성날짜</label> <fmt:formatDate value="${view.regDate }" pattern="yy.MM.dd-hh.mm.ss"/>
			
			<!-- <input type="text" name="regDate"
				value="<fmt:formatDate value="${view.regDate}" pattern="yy.MM.dd-hh.mm.ss" />"
				readonly="readonly" /> -->
		</div>

		<div>
			<label>내용</label>
			<textarea rows="5" cols="50" name="content">${view.content }</textarea>
		</div>
		<div>
		    <button type="submit">수정</button>
		</div>
	</form>
</body>
</html>