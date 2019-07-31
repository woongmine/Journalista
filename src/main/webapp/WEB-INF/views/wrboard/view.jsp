<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="listPage">
	<c:param name="num" value="num"></c:param>
</c:import>
<% int max = (int)session.getAttribute("max"); %>

<html>
<head>
<script>
	function checkmodify(){
		var loginemail = $('#loginemail').val();
		var writeremail = $('#writeremail').val();
		if (loginemail != writeremail){
			alert("본인만 게시물을 수정할 수 있습니다.");
			return false;
			}
		}

	function checkdrop(){
		var loginemail = $('#loginemail').val();
		var writeremail = $('#writeremail').val();
		if (loginemail != writeremail){
			alert("본인만 게시물을 삭제할 수 있습니다.");
			return false;
			}
		}

	function CheckNextPage(){
		var wr_no = $('#wr_no').val();
		var max = $('#max').val();
		if (wr_no == max){
			alert("다음 글이 없습니다.");
			return false;
			}
		}
	
	function CheckPrePage(){
		var wr_no = $('#wr_no').val();
		if (wr_no == 1){
			alert("이전 글이 없습니다.");
			return false;
			}
		}

</script>
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
			<input type="hidden" id="loginemail" value="${member.email }" />
			<input type="hidden" id="writeremail" value="${view.email }"/>
			<input type="hidden" id="wr_no" value="${view.wr_no }"/>
			<input type="hidden" id="max" value="<%= max %>"/>
			<a href="/wrboard/view?wr_no=${view.wr_no - 1}" onclick="return CheckPrePage();">이전글</a>
			<a href="/wrboard/view?wr_no=${view.wr_no - 1}" onclick="return CheckPrePage();">${pre.wr_title }</a>
			<a href="/wrboard/update?wr_no=${view.wr_no}" onclick="return checkmodify();">수정</a>
			<a href="/wrboard/delete?wr_no=${view.wr_no}" onclick="return checkdrop();">삭제</a>
			<a href="/wrboard/listPage?num=1"> 목록보기</a>
			<a href="/wrboard/view?wr_no=${view.wr_no + 1}" onclick="return CheckNextPage();">다음글</a>
			<a href="/wrboard/view?wr_no=${view.wr_no + 1}" onclick="return CheckNextPage();">${next.wr_title }</a>
		</div>
	</form>
	<form align="center" name="check">
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
					<td><input type="hidden" name="name" id="name" value="${member.name}"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

		<c:forEach begin="1" end="${pageNum}" var="num">
			<span> <a href="/wrboard/listPage?num=${num}">${num}</a>
			</span>
		</c:forEach>
		<br/>
	    <a href="/wrboard/write" onclick="return idcheck();">게시물 작성</a>
		<a href="/">홈으로</a>
	</form>
</body>
</html>