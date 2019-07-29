<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <%@ page session="false" %> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<!--<c:out value="${param.num }" />-->
<script>
	//function check(){
	//	alert("111");
	//	alert(func.name.value);
	//	if (func.name.value == null){
	//		alert("로그인해야 작성할 수 있습니다.");
	//		return false;
	//		}
	//	}
</script>
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

	<form align="center" name="func">
		<c:forEach begin="1" end="${pageNum}" var="num">
			<span> <a href="/wrboard/listPage?num=${num}">${num}</a>
			</span>
		</c:forEach>
		<br/>
		<input type="hidden" name="name" id="name" value="${member.name }">
	    <a href="/wrboard/write">게시물 작성</a>
		<a href="/">홈으로</a>
</form>
</body>
</html>