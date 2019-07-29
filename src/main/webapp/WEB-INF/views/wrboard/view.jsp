<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="listPage">
	<c:param name="num" value="num"></c:param>
</c:import>

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
			<a href="/wrboard/update?wr_no=${view.wr_no}" onclick="return checkmodify();">수정</a> 
			<a href="/wrboard/delete?wr_no=${view.wr_no}" onclick="return checkdrop();">삭제</a>
			<a href="/wrboard/listPage?num=1"> 목록보기</a>
		</div>
	</form>
</body>
</html>