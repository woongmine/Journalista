<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<style>

	.card table { 
		font-size: 10pt;
	}

/*
	.card img{
		position: absolute; top:0; left: 0;
		width: 100%;
		height: 100%;
	}
*/
</style>

<script>
	
	$('#searchBtn').on('click', function(){
		var keyword = $('#keyword').val();
		
		$.ajax({
			url: "journalistSearchComplete",
			type: "GET",
			data: keyword,
			success: function(data) {
				alert(keyword);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			}
		});
	});
	

	
	

</script>

<div>
<div align="center" id="search">
<form id="searchForm" action="journalistSearchComplete">
	<label for="journalistSearch">기자 검색</label>
	<div class="input-group mb-3" style="width: 450px;">
		<div class="input-group-prepend">
			<span class="input-group-text">이름 검색</span>
		</div>
		<input type="text" class="form-control" id="keyword" name="keyword" >
	</div>
	<input type="submit" id="searchBtn" value="검색">
</form>
</div>


</div>