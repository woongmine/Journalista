<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <%@ page session="false" %> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="listPage">
	<c:param name="num" value="num"></c:param>
</c:import>

<html>
<head>
<title>게시물 보기</title>
</head>
<body>
	<form method="post">
		<div>
			<label>제목</label> <input type="text" name="wr_title"
				value="${view.wr_title }" readonly="readonly" />
		</div>

		<div>
			<label>작성자</label> <input type="text" name="name"
				value="${view.name }" readonly="readonly" />
		</div>

		<div>
			<label>작성날짜</label> <input type="text" name="wr_datetime"
				value="<fmt:formatDate value="${view.wr_datetime}" pattern="yy.MM.dd-hh.mm.ss" />"
				readonly="readonly" />
		</div>

		<div>
			<label>내용</label>
			<textarea rows="5" cols="50" name="wr_contents" readonly="readonly">${view.wr_contents}</textarea>
		</div>
		<div>
			<a href="/wrboard/update?wr_no=${view.wr_no}">수정</a> 
			<a href="/wrboard/delete?wr_no=${view.wr_no}">삭제</a>
			<a href="/wrboard/listPage?num=1"> 목록보기</a>
		</div>
	</form>
</body>
</html>