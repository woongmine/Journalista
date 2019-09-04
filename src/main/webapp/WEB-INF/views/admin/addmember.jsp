<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<% request.setCharacterEncoding("UTF-8"); %>
<div class="col-xl-5 accordion mx-auto" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          	관리자 추가
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
 <form method="post" action="/admin/addAdmin">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="adminid">ID</label>
      <input type="text" class="form-control" id="admin_id" name="admin_id" placeholder="ID" oninput="admincheckId()">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
      
    </div>
      <div class="form-group">
    <label for="journal_name">이름</label>
    <input type="text" class="form-control" id="admin_name" name="admin_name" placeholder="이름">
  </div>
  </div>
  <button type="submit" class="btn btn-primary" id="addAdminbtn" disabled="disabled">추가</button>
</form>
</div>
</div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          	기자 추가
        </button>
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
       <form method="post" action="/admin/addJournal">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control" id="journal_email" name="journal_email" placeholder="Email" oninput="journalCheckEmail()">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="journal_pass" name="journal_pass" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <label for="journal_name">이름</label>
    <input type="text" class="form-control" id="journal_name" name="journal_name" placeholder="이름">
  </div>
  <div class="form-group">
    <label for="journal_twit">트위터</label>
    <input type="text" class="form-control" id="journal_twit" name="journal_twit" placeholder="트위터">
  </div>
    <div class="form-group">
    <label for="journal_facebook">페이스북</label>
    <input type="text" class="form-control" id="journal_facebook" name="journal_facebook" placeholder="페이스북">
  </div>
  <div class="form-group">
    <label for="inputAddress2">언론사명</label>
    <select id="press" name="press" class="custom-select">
    	<option value="" selected="selected">언론사 선택</option>
    	<c:forEach items="${pressSearch}" var="press">
    	<option value="${press.press_name}">${press.press_name}</option>
    	</c:forEach>
    </select>
  </div>
  <div class="form-group">
    <label for="inputAddress2">부서명</label>
    <input type="text" class="form-control" id="journal_part" placeholder="사회부, 연예부, 스포츠부, 경제부, 국제부">
  </div>
  <button type="submit" class="btn btn-primary" id="addJournalbtn" disabled="disabled">추가</button>
</form>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingThree">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          	언론사 추가
        </button>
      </h2>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
         <form method="post" action="/admin/addPress">
  <div class="form-group">
    <label for="press_name">언론사명</label>
    <input type="text" class="form-control" id="press_name" name="press_name" oninput="presscheck()" placeholder="이름">
  </div>
    <div class="form-group">
    <label for="press_name">비밀번호</label>
    <input type="password" class="form-control" id="press_pass" name="press_pass" placeholder="이름">
  </div>
  <div class="form-group">
    <label for="press_type">성격</label>
    <input type="text" class="form-control" id="press_type" name="press_type" placeholder="일보,스포츠,주간">
  </div>
  <button type="submit" class="btn btn-primary" id="addPressbtn" disabled="disabled">추가</button>
</form>
      </div>
    </div>
  </div>
</div>
</div>

<!-- 스크립트 부분은 따로 떼서 .js 파일로 인크루드 시키기 -->
<script>
//다른 공백란 체크
$("#addAdminbtn").click(function(){
	if($("#password").val() == ""){
		alert("비밀번호를 채워주세요");
		return false;
	} else if($("#admin_name".val() == "")){
		alert("이름을 채워주세요");
		return false;
	}
});

$("#addJournalbtn").click(function(){
	if($("#journal_pass").val() == ""){
		alert("비밀번호를 채워주세요");
		return false;
	} else if($("#journal_name").val() == ""){
		alert("이름을 채워주세요");
		return false;
	}
});

$("#addPressbtn").click(function(){
	if($("#press_pass").val() == ""){
		alert("비밀번호를 채워주세요");
		return false;
	} else if($("#press_name").val() == ""){
		alert("이름을 채워주세요");
		return false;
	}
});
//관리자 아이디를 체크하여 가입버튼 비활성화, 중복확인
function admincheckId(){
	var inputed = $("#admin_id").val();
	$.ajax({
		url : "checkId",
		method : "post",
		data : {admin_id : inputed},
		success : function(data){
		if(inputed=="" && data == '0'){
			$("#addAdminbtn").prop("disabled",true);
			$("#addAdminbtn").css("background-color", "#aaaaaa");
			$("#admin_id").css("background-color", "#FFCECE");
		} else if (data == '0'){
			$("#admin_id").css("background-color", "#B0F6AC");
			$("#addAdminbtn").prop("disabled", false);
			$("#addAdminbtn").css("background-color", "#4CAF50");
		} else if (data == '1'){
			$("#addAdminbtn").prop("disabled",true);
			$("#addAdminbtn").css("background-color", "#aaaaaa");
			$("#admin_id").css("background-color", "#FFCECE");

		}
	}
});
}
function journalCheckEmail(){
	var inputed2 = $("#journal_email").val();
	$.ajax({
		url : "checkJournal",
		method : "post",
		data : {journal_email : inputed2},
		success : function(data){
		if(inputed2=="" && data == '0'){
			$("#addJournalbtn").prop("disabled",true);
			$("#addJournalbtn").css("background-color", "#aaaaaa");
			$("#journal_email").css("background-color", "#FFCECE");
		} else if (data == '0'){
			$("#journal_email").css("background-color", "#B0F6AC");
			$("#addJournalbtn").prop("disabled", false);
			$("#addJournalbtn").css("background-color", "#4CAF50");
		} else if (data == '1'){
			$("#addJournalbtn").prop("disabled",true);
			$("#addJournalbtn").css("background-color", "#aaaaaa");
			$("#journal_email").css("background-color", "#FFCECE");

		}
	}
});
}
function presscheck(){
	var inputed3 = $("#press_name").val();
	$.ajax({
		url : "checkPress",
		method : "post",
		data : {press_name : inputed3},
		success : function(data){
		if(inputed3=="" && data == '0'){
			$("#addPressbtn").prop("disabled",true);
			$("#addPressbtn").css("background-color", "#aaaaaa");
			$("#press_name").css("background-color", "#FFCECE");
		} else if (data == '0'){
			$("#press_name").css("background-color", "#B0F6AC");
			$("#addPressbtn").prop("disabled", false);
			$("#addPressbtn").css("background-color", "#4CAF50");
		} else if (data == '1'){
			$("#addPressbtn").prop("disabled",true);
			$("#addPressbtn").css("background-color", "#aaaaaa");
			$("#press_name").css("background-color", "#FFCECE");
		}
	}
});
}
</script>