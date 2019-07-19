<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>회원가입</title>

<script type="text/javascript">
	var isCheckEmail = 0;
	function checkEmail () {
		var inputId = $("#email").val();
		$.ajax({
			async: false,
			type: "post",
			url: "/emailCheck",
			data: inputEmail,
			success: function (data) {
				if(data == "S") {
					alert("사용가능한 이메일입니다.");
					
					$("#inputEmail").addClass("has-success")
					$("#inputEmail").removeClass("has-error")
					
					$("#password").focus();
					isCheckEmail = 1;
				} else {
					alert("이메일이 존재합니다. 다른 이메일을 입력해주세요.");
					
					$("#inputEmail").addClass("has-error")
					$("#inputEmail").removeClass("has-success")
					
					$("#email").focus();
				}
			},
			error: function(req, status, errThrown) {
				alert("network error occur");
			}
		});
	}

</script>


<div class="container">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6"><br>
			<div class="card">
				<h4 class="card-header">Please Sign Up</h4>
				<div class="card-body">
					<p class="card-text">
						<form role="form" action="register" method="post">
							<div class="form-group" id="inputEmail">
								<label>이메일</label> 
								<input class="form-control" style="margin-bottom: 5px;" placeholder="이메일" name="email" id="email" type="email" /> 
								<input type="button" class="btn btn-secondary btn-sm" style="width: 20%;" value="중복확인" onclick="checkEmail();" />
							</div>
							<div class="form-group">
                            	<label>비밀번호</label>
                            	<input class="form-control" placeholder="비밀번호" name="password" id="password" type="password" />
                            </div>
                            <div class="form-group">
                            	<label>비밀번호 확인</label>
                            	<input class="form-control" placeholder="비밀번호 확인" name="passwordCheck" id="passwordCheck" type="password" />
                            </div>
                            <div class="form-group">
                            	<label>닉네임</label>
                            	<input class="form-control" placeholder="닉네임을 입력해주세요" name="name" id="name" type="text" />
                            </div>
                            <button class="btn btn-lg btn-success btn-block">회원가입</button>
						</form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>