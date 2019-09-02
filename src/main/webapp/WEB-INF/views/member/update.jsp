<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<% request.setCharacterEncoding("UTF-8"); %>
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#update" role="tab" aria-controls="update" aria-selected="true">회원정보 수정</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">프로필 사진</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#dropout" role="tab" aria-controls="dropout" aria-selected="false">탈퇴</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">

  <div class="tab-pane fade show active" id="update" role="tabpanel" aria-labelledby="update-tab">
	  <div class="col-md-8 mx-auto">
		<div class="row">
			<div class="col-md-8">
				<div class="card">
					<h4 class="card-header">회원정보 수정</h4>
					<div class="alert alert-danger collapse" role="alert" id="fillError">
					  <strong>에러!!</strong> 빈칸이 없도록 모두 채워주세요
					</div>
										<div class="alert alert-danger collapse" role="alert" id="passck">
					  <strong>에러!!</strong> 입력하신 두 패스워드가 일치하지 않습니다
					</div>
					<div class="alert alert-danger collapse" role="alert" id="passleng">
					  <strong>에러!!</strong> 패스워드가 8글자 이상이 아닙니다
					</div>
					<div class="alert alert-danger collapse" role="alert" id="nickleng">
					  <strong>에러!!</strong> 닉네임은 2글자 이상 8글자 이하로 작성해주세요
					</div>
					<div class="card-body">
						<p class="card-text">
							<form role="form" name="update" onsubmit="return validate();" action="/member/update" method="post">
								<div class="row mb-4">
	                            	<div class="col-sm-4"><label>비밀번호</label></div>
	                            	<div class="col-sm-8"><input class="form-control" placeholder="비밀번호" name="password" id="password" type="password" 
	                            	data-toggle="tooltip" data-placement="right" title="8글자 이상"/></div>
	                            </div>
	                             
	                            <div class="row mb-4">
	                            	<div class="col-sm-4"><label>비밀번호 확인</label></div>
	                            	<div class="col-sm-8"><input class="form-control" placeholder="비밀번호 확인" name="PasswordCheck" id="passwordCheck" type="password" /></div>
	                            </div>
	                            
	                            <div class="row mb-4">
	                            	<div class="col-sm-4"><label>닉네임</label></div>
	                            	<div class="col-sm-8"><input class="form-control" placeholder="닉네임을 입력해주세요" name="name" id="name" type="text" 
	                            	data-toggle="tooltip" data-placement="right" title="공백없이 2글자 이상 8글자 이하"/></div>
	                            </div>
	                            <hr>
	                            <div class="col-md-4 mx-auto"> 
	                            	<button class="button large">UPDATE</button>    
	                            </div>                                               
							</form>
					</div>
				</div>
		</div>
	</div>
	</div>
  </div>

  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
	  <div class="col-md-10 mx-auto">
		<div class="row">
			<div class="col-md-8">
				<div class="card">
					<h4 class="card-header">프로필 업로드</h4>
					<div class="card-body">
								<div class="input-group mb-3">
								  <div class="custom-file">
								    <input type="file" class="custom-file-input" id="inputGroupFile01" name="uploadFile" aria-describedby="inputGroupFileAddon01">
								    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
								  </div>
								</div>
								<h4>프로필로 사용될 이미지 파일만 업로드해주시기 바랍니다(2MB 이하)</h4>
	                            <hr>
	                            <div class="col-md-3 mx-auto"> 
	                            	<button class="button large" id="uploadBtn">UPLOAD</button>    
	                            </div>                                               
					</div>
				</div>
		</div>
	</div>
	</div>

  </div>
  <div class="tab-pane fade" id="dropout" role="tabpanel" aria-labelledby="dropout-tab">
	<div class="card border-danger mb-3 mx-auto" style="max-width: 18rem;">
	  <div class="card-header"><h4>탈퇴</h4></div>
	  <div class="card-body text-danger">
	    <h5 class="card-title">탈퇴된 이후에는 같은 이메일로 재가입하실 수 없습니다.</h5>
	    <p class="card-text">정말로 탈퇴 하시겠습니까?</p>
	  </div>
	  <hr>
      <div class="col-md-3 mx-auto">
 		<form role="form" name="withdrawal" action="/member/withdrawal" method="post">
      	<button class="button large">SUBMIT</button>  
      	</form>  
      </div>
      <br>
	</div>
  </div>
</div>

<script>
//부트스트랩
$('#inputGroupFile01').on('change',function(){
    //get the file name
    var fileName = $(this).val();
    //replace the "Choose a file" label
    $(this).next('.custom-file-label').html(fileName);
});
$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	});
	
function validate(){
	var passval = $('#password').val();
	var passckval = $('#passwordCheck').val();
	var nickval = $('#name').val();
	
	var nicklength = nickval.length;
	var passlength = passval.length;
	console.log(nicklength);
	//공백데이터
	if(!passval || !passckval || !nickval){
		console.log("공백")
		$('#fillError').show();
		return false;
	}
	//비밀번호 확인이랑 일치하지 않음
	if(passval != passckval){
		$('#passck').show();
		return false;
	}
	//패스워드 8글자 이상
	if(passlength <8 ){
		$('#passleng').show();
		return false;
	}
	//닉네임 길이 제한
	if(nicklength < 2 || nicklength >8){
		$('#nickleng').show();
		return false;
	}
	
	}
	
$(document).ready(function(){
	$("#uploadBtn").on("click", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		for(var i = 0; i < files.length; i++){
			formData.append("uploadFile",files[i]);	
		}
	$.ajax({
		url: '/member/upload',
		processData:false,
		contentType:false,
		data: formData,
		type:'POST',
		error:function(request,status,error){
	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	       },
		success: function(result){
			if(result=='1'){
				alert("이미지 파일이 아닙니다");
			}else if(result=='2'){
				alert("이미지 파일이 2MB보다 큽니다");
			}else if(result=='3'){
				location.reload();
			}
		}
	
	});
	
	});
});

</script>