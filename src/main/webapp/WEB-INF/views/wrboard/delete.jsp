<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <%@ page session="false" %> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>게시물 삭제</title>
</head>
<body>
	<form method="post">

		<input type="hidden" name="wr_no" value="${view.wr_no}" />

		<div>
			<label>제목</label> <input type="text" name="wr_title"
				value="${view.wr_title}" readonly="readonly" />
		</div>

		<div>
			<button type="submit">삭제</button>
		</div>

	</form>
</body>
</html>