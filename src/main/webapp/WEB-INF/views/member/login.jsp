<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Content Wrapper. Contains page content -->
<script>
	$(document).ready(function() {
		$("#login").click(function() {
			var email = $("#email").val();
			var password = $("#password").val();
			if (email == "") {
				alert("아이디를 입력하세요");
				$("#email").focus();
				return;
			}
			if (password == "") {
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			}
		});
	});
</script>
<div class="col-md-4 mx-auto">
<div class="card">
  <h5 class="card-header"><center><a href="/" style="font-size:30pt;">Journalista</a></center></h5>
  <div class="card-body mx-auto">
    <h5 class="card-title">Login</h5>
    <p class="card-text">
    <form method="post">
			<input type="email" name="email" id="email" placeholder="이메일" /><br />
			<input type="password" name="password" id="password" placeholder="비밀번호"/><br />
			<div class="col-xs-8">
				<div class="checkbox icheck">
					<input type="checkbox" id="login1" name="useCookie" ><label class="login_interface" for="login1" style="color:#6E6E6E; font-size:10pt; font-weight: bolder;">자동로그인</label>
				</div>
			</div>
			<c:if test="${!empty msg and fn:length(msg) >0}">
				<div id="result" style="display: inline;">
					<font color=red>아이디와패스워드가 일치하지않습니다.</font>
				</div>
			</c:if>
			<c:if test="${!empty mag and fn:length(mag) >0}">
				<div id="result" style="display: inline;">
					<font color=red>탈퇴한 회원은 로그인 할 수 없습니다.</font>
				</div>
			</c:if>

		    	<input class="button fit" type="submit" id="login" value="로그인"/>			
					</form>
					</p>
					<hr>
					<div class="row mx-auto">
					<div class="col">
					<a class="login_interface" href="/member/register" style="color:#6E6E6E; font-size:12pt; font-weight: bolder; border-bottom:none;">회원가입</a>
					</div>
					<div class="col">
					<a class="login_interface" href="#" style="color:#6E6E6E; font-size:12pt; font-weight: bolder; border-bottom:none;">비밀번호 찾기</a>
					</div>
					</div>
  </div>
</div>
</div>