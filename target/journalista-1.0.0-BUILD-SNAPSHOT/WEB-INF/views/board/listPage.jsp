<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <%@ page session="false" %> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<c:out value="${param.num }" />


	<table class="table" style="width: 60%" align="center">
		<thead class="thead-dark">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr scope="row">
					<td>${list.bno}</td>
					<td><a href="/board/view?bno=${list.bno}">${list.title}</a></td>
					<td>${list.writer}</td>
					<td><fmt:formatDate value="${list.regDate}"
							pattern="yy.MM.dd-hh.mm.ss" /></td>
					<td>${list.viewCnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<form align="center">
	<c:forEach begin="1" end="${pageNum}" var="num">
		<span> <a href="/board/listPage?num=${num}">${num}</a>
		</span>
	</c:forEach>
    <a href="/board/write">게시물 작성</a>
	<a href="/">홈으로</a>
	</form>
</body>
</html>