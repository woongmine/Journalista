<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<br>
	<!-- Main content -->
	<section class="content container-fluid">
		<form method="post">
			아이디:<input type="text" name="userId" /> <br /> 
			비밀번호:<input type="password" name="userPass" /> <br /> 
			<input type="submit" value="로그인" />
			<input type="button" value="메인으로" id="main" />
		</form>

	<script>
	document.getElementById("main").onclick = function( ){
		location.href="../";
	}
	</script>

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->