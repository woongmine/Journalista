<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Content Wrapper. Contains page content -->
<script>
	$(function(){
	
		$("#findpw").click(function(){
			var email = $("#email").val();
			var name = $("#name").val();			
			var param={
					email : email,
					name : name					
			};	
			console.log(param);
			$.ajax({
				type: "post",
				url: "${path}/member/findpw",
				data: param,
				success: function(){
					
					alert("임시비밀번호 발송 완료");
					
				}
				});				
		});
	});
</script>
<div class="col-md-4 mx-auto">
<div class="card">
  <h5 class="card-header"><center><a href="/" style="font-size:30pt;">Journalista</a></center></h5>
  <div class="card-body mx-auto">
    <h5 class="card-title"><center>임시비밀번호발급</center></h5>
    <p class="card-text">
    <form method="post">
			<input type="email" name="email" id="email" placeholder="이메일" /><br />
			<input type="text" name="name" id="name" placeholder="이름"/><br />
			<hr>
				
		   	<input class="button fit" type="button" id="findpw" value="비밀번호발급"/>			
	</form>
	</p>
					
				
  </div>
</div>
</div>