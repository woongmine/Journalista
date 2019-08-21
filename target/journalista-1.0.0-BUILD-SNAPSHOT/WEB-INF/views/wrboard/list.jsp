<!--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>게시물 목록</title>
</head>
<body>

	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.wr_no}</td>
					<td><a href="/wrboard/view?wr_no=${list.wr_no}">${list.wr_title}</a></td>
					<td>${list.name}</td>
					<td><fmt:formatDate value="${list.wr_datetime}"
							pattern="yy.MM.dd-hh.mm.ss" /></td>
					<td>${list.wr_hit}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="/">홈으로</a>
</body>
</html>
-->