<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<% request.setCharacterEncoding("UTF-8"); %>
<div class="alert alert-success collapse" id="showalert" role="alert">
  축하합니다 당첨 회원번호는 <strong><span id="numPrint"></span></strong>번 입니다
</div>
  <div class="form-group">
    <label for="firstnum">시작숫자</label>
    <input type="text" class="form-control" id="firstnum" aria-describedby="emailHelp" placeholder="시작하는 회원번호">
  </div>
  <div class="form-group">
    <label for="lastnum">마지막 숫자</label>
    <input type="text" class="form-control" id="lastnum" placeholder="끝나는 회원번호">
  </div>
  <button type="button" id="numsub"class="btn btn-primary">당첨자 발표</button>
<script>
function randomNum(minimum, maximum){
	return Math.floor((Math.random() * (maximum - minimum + 1)) + minimum)
}
$('#numsub').click(function(){
	
	var firstnum = $('#firstnum').val();
	firstnum *= 1;
	var lastnum = $('#lastnum').val();
	lastnum *=1;
	var num = randomNum(firstnum, lastnum);
	console.log(typeof(firstnum));
	console.log(typeof(lastnum));
	$('#showalert').show();
	$('#numPrint').text(num);
	
});
</script>