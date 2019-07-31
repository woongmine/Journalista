<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>
<% request.setCharacterEncoding("UTF-8"); %>

<% int wr_no = (int)session.getAttribute("wr_no"); %>
<% String name = (String)session.getAttribute("name"); %>
<% String wr_title = (String)session.getAttribute("wr_title"); %>
<% String wr_contents = (String)session.getAttribute("wr_contents"); %>

<html>
<head>
<script>
	function check(){
		var value = $('#loginname').val();
		alert(value);
		}

	function checkmodify(){
		var loginemail = $('#loginemail').val();
		var writeremail = $('#writeremail').val();
		if (loginemail != writeremail){
			alert("덤벼라 감히 나를 건드리다니.");
			return false;
			}
		}
</script>
<title>게시물 수정</title>
</head>
<body>
	<form method="post">
		<input type="hidden" name="wr_no" value="<%= wr_no%>">
		<input type="hidden" id="loginemail" value="${member.email }"/>
		<input type="hidden" id="writeremail" value="${view.email }"/>
		<div>
			<label>제목</label> <input type="text" name="wr_title" value="<%= wr_title%>" />
		</div>

		<div>
			<label>작성자</label> <input type="text" name="name" value="<%= name%>" readonly />
		</div>
 		
		<div>
			<!-- <label>작성날짜</label> <fmt:formatDate value="${view.wr_datetime }" pattern="yy.MM.dd-hh.mm.ss"/>-->
			
			<!-- <input type="text" name="regDate"
				value="<fmt:formatDate value="${view.regDate}" pattern="yy.MM.dd-hh.mm.ss" />"
				readonly="readonly" /> -->
		</div>

		<div>
			<label>내용</label>
			<textarea rows="5" cols="50" name="wr_contents"><%= wr_contents%></textarea>
		</div>
		<div>
		    <button type="submit" onclick="return checkmodify();">수정</button>
		</div>
	</form>
</body>
</html>