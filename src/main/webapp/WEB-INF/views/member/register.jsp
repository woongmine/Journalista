<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String email = (String)session.getAttribute("email"); %>
<% String name = (String)session.getAttribute("name"); %>
<% String password = (String)session.getAttribute("password"); %>
<% String passwordCheck = (String)session.getAttribute("passwordCheck"); %>

<!DOCTYPE html>
<title>회원가입</title>

<script type="text/javascript">
	var isCheckEmail = 0;
	function checkEmail () {
		console.log("이메일체크들어감");
		var inputEmail = $('#email').val();
		console.log(inputEmail);
		$.ajax({
			async: true,
			type: "post",
			url: "emailCheck",
			data: inputEmail,
            dataType : "text",
            contentType: "application/json; charset=UTF-8",
			success: function (data) {
				if(data == "S") {
					console.log("사용가능이메일 들어감");
					console.log(data);
					alert("사용가능한 이메일입니다.");
					
					$("#inputEmail").addClass("has-success")
					$("#inputEmail").removeClass("has-error")
					
					$("#password").focus();
					isCheckEmail = 1;
				} else {
					console.log("사용불가능이메일 들어감");
					console.log(data);
					alert("이메일이 존재합니다. 다른 이메일을 입력해주세요.");
					
					$("#inputEmail").addClass("has-error")
					$("#inputEmail").removeClass("has-success")
					
					$("#email").focus();
				}
			},
			error: function(request,status,error) {
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
</script>

<div class="container">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6"><br>
			<div class="card">
				<h4 class="card-header">회원가입</h4>
				<div class="card-body">
					<p class="card-text">
						<form role="form" action="register" method="post">
							<div class="form-group" id="inputEmail">
								<label>이메일</label> 
								<% if (email == null) {
									%>
									<input class="form-control" style="margin-bottom: 5px;" placeholder="이메일" name="email" id="email" type="email" autofocus/> 
								<% } else {
									%>
									<input class="form-control" style="margin-bottom: 5px;" value="<%= email %>" name="email" id="email" type="email" /> 
								<%
								}
								 %>
								<input type="button" class="btn btn-secondary btn-sm" style="width: 20%;" value="중복확인" onclick="checkEmail();" />
							</div>
							<div class="form-group">
                            	<label>비밀번호</label>
                            	<% if (password == null) {
									%>
									<input class="form-control" style="margin-bottom: 5px;" placeholder="비밀번호" name="password" id="password" type="password" /> 
								<% } else if (password.equals("")){
									%>
									<input class="form-control" style="margin-bottom: 5px;" value="<%= password %>" name="password" id="password" type="password" autofocus/> 
								<%
								} else {
									%>
									<input class="form-control" style="margin-bottom: 5px;" value="<%= password %>" name="password" id="password" type="password"/> 
								<%
								}
								 %>
							</div>
                            <div class="form-group">
                            	<label>비밀번호 확인</label>
                            	<% if (passwordCheck == null) {
									%>
									<input class="form-control" style="margin-bottom: 5px;" placeholder="비밀번호 확인" name="passwordCheck" id="passwordCheck" type="password" /> 
								<% } else {
									%>
									<input class="form-control" style="margin-bottom: 5px;" value="<%= passwordCheck %>" name="passwordCheck" id="passwordCheck" type="password" /> 
								<%
								}
								 %>
                            </div>
                            <div class="form-group">
                            	<label>닉네임</label>
                            	
                            	<% if (name == null) {
									%>
									<input class="form-control" style="margin-bottom: 5px;" placeholder="닉네임" name="name" id="name" type="text" /> 
								<% } else if (name.equals("")){
									%>
									<input class="form-control" style="margin-bottom: 5px;" value="<%= name %>" name="name" id="name" type="text" autofocus/> 
								<%
								} else{
									%>
									<input class="form-control" style="margin-bottom: 5px;" value="<%= name %>" name="name" id="name" type="text" />
								<%
								}
								 %>
                            </div>
                            <div id="register_button">
                            <button type="submit" id="register" name="register" class="btn btn-lg btn-success btn-block" onclick="return loading();">회원가입</button>
                            
  							</div>
						</form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

<script>
function loading(){
	var str = "";
	str += "<span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span> 하는 중...";
	$("#register").attr('class','button fit');
	$("#register").append(str);
}

</script>
