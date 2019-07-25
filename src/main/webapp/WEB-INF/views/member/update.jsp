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
                            <button class="btn btn-success">수정</button>                                                   
						</form>
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#withdrawalCK">탈퇴</button>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
<div class="modal fade" id="withdrawalCK" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">탈퇴확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        정말로 탈퇴하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
        <form method="post" action="/member/withdrawal">
        <input type="hidden" readonly class="form-control-plaintext" name="email" id="email" value="${member.email}">
       		<button type="submit" class="btn btn-primary">예</button>
        </form>
      </div>
    </div>
  </div>
</div>