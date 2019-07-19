<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<% request.setCharacterEncoding("UTF-8"); %>

<div class="container">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6"><br>
			<div class="card">
				<h4 class="card-header">회원정보 수정</h4>
				<div class="card-body">
					<p class="card-text">
						<form role="form" action="/member/update" method="post">
							<div class="form-group row">
							    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
							    <div class="col-sm-10">
							      <input type="text" readonly class="form-control-plaintext" name="email" id="email" value="${member.email}">
							    </div>
							  </div>
							<div class="form-group">
                            	<label>비밀번호</label>
                            	<input class="form-control" placeholder="비밀번호" name="password" id="password" type="password" />
                            </div>
                            <!-- 
                            <div class="form-group">
                            	<label>비밀번호 확인</label>
                            	<input class="form-control" placeholder="비밀번호 확인" name="passwordCheck" id="passwordCheck" type="password" />
                            </div>
                            -->
                            <div class="form-group">
                            	<label>닉네임</label>
                            	<input class="form-control" placeholder="닉네임을 입력해주세요" name="name" id="name" type="text" />
                            </div>
                            <button class="btn btn-lg btn-success btn-block">수정</button>                        
                            <button class="btn btn-lg btn-success btn-block">탈퇴</button>
						</form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>