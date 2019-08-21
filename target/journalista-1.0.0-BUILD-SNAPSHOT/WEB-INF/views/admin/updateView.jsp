<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/resources/bootstrap-4.3.1-dist/js/bootstrap.js"></script>
<link rel="stylesheet" href="/resources/bootstrap-4.3.1-dist/css/bootstrap.css" >


<div class="container">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6"><br>
			<div class="card">
				<h4 class="card-header">회원정보 수정</h4>
				<div class="card-body">
					<p class="card-text">
						<form role="form" action="/admin/userUpdate" method="post">
							<div class="form-group row">
								<label>회원번호</label>
								<div class="col-sm-10">
							      <input type="text" readonly class="form-control-plaintext" name="m_no" id="m_no" value="${member.m_no}">
							    </div>
							</div>
								<div class="form-group row">
							    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
							    <div class="col-sm-10">
							      <input type="text" readonly class="form-control-plaintext" name="email" id="email" value="${member.email}">
							    </div>
							  </div>
                            <div class="form-group">
                            	<label>닉네임</label>
                            	<input class="form-control" placeholder="닉네임을 입력해주세요" name="name" id="name" type="text" value="${member.name }"/>
                            </div>
                            <div class="form-group">
                            	<label>권한</label>
                            	<input class="form-control" name="auth" id="auth" type="text" value="${member.auth }"/>
                            </div>
                            <form action="userUpdate">
                            	<input type="submit" class="btn btn-success" value="수정">
                            </form>
                            <input type="button" value="돌아가기" class="btn btn-success" onclick="history.back(-1);">                                   
						</form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>