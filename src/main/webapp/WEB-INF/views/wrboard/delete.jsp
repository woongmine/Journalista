<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <%@ page session="false" %> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<script>
	function checkdrop(){
		var loginemail = $('#loginemail').val();
		var writeremail = $('#writeremail').val();
		if (loginemail != writeremail){
			alert("덤벼라 감히 나를 건드리다니.");
			return false;
			}
		}
</script>
<title>게시물 삭제</title>
</head>
<body>
	<form method="post">

		<input type="hidden" name="wr_no" value="${view.wr_no}" />
		<input type="hidden" id="loginemail" value="${member.email }"/>
		<input type="hidden" id="writeremail" value="${view.email }"/>
		<div>
			<label>제목</label> <input type="text" name="wr_title"
				value="${view.wr_title}" readonly="readonly" />
		</div>

		<div>
			<button type="submit" onclick="return checkdrop();">삭제</button>
		</div>

	</form>
</body>
</html>