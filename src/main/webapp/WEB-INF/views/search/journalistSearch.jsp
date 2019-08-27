<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>

 .card table { 
	
	font-size: 10pt;

}

</style>

<div>
<form>
<div align="center">
	<label for="journalistSearch">기자 검색</label>
	<div class="input-group mb-3" style="width: 450px;">
		<div class="input-group-prepend">
			<span class="input-group-text">이름 검색</span>
		</div>
		<input type="text" class="form-control" id="journalistSearch" aria-describedby="basic-addon3">
	</div>
	<input type="button" value="검색">
</div>
</form>

<div class="row">
  <div class="col-sm-4">
    <div class="card" style="height: 300px;">
      <div class="card-body">
      	<table style="height: 170px;" font-size="10pt">
      		<tr>
      			<td rowspan="3">사진</td>
      			<td>이름 : </td>
      		</tr>
      		<tr>
      			<td>이메일 : </td>
      		</tr>
      		<tr>
      			<td>소속 : </td>
      		</tr>
      	</table>
      </div>
    </div>
  </div>
</div>

</div>
