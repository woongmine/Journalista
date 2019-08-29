<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<style>

	.card table { 
		font-size: 10pt;
	}

</style>

<script>

	function journalistSearch() {

		var journal_name = $('#journal_name').val();
		
		$.ajax({
			url: "journalistSearchComplete",
			data: journal_name,
            type: "POST",
			success: function(data) {
				
				var temp = document.write(data);
				var journalists = $('div.row').html();
				
				console.log(data);
				
				journalists += '</div>';
				$("div#journalistSearchMain").append(journalists);

			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
				console.log("에러 발생~~ " + textStatus + ", 에러코드: " + errorThrown + ", 정리" +  jqXHR.status + jqXHR.statusText + jqXHR.responseText + jqXHR.readyState);
				}
			});
		
	}

</script>

<div id="journalistSearchMain">
<div align="center" id="search">
	<label for="Search">기자 검색</label>
	<div class="input-group mb-3" style="width: 450px;">
		<div class="input-group-prepend">
			<span class="input-group-text">이름 검색</span>
		</div>
		<input type="text" class="form-control" id="journal_name" name="journal_name">
	</div>
	<button type="submit" id="searchBtn" onclick="journalistSearch()">검색</button>
</div><br>

<div class="row" id="journalists">
<c:forEach items="${journal}" var="journalset">
  <div class="col-sm-4">
    <div class="card" style="height: 300px;">
      <div class="card-body">
      	<table style="height: 170px;" font-size="10pt">
      		<tr height="150">
      			<td rowspan="3" width="120px"><div><img alt="머머리" src="${contextPath}/resources/images/bald.jpg" class="rounded-circle" width="120"></div></td>
      			<td>이름 : ${journalset.journal_name}</td>
      		</tr>
      		<tr>
      			<td>이메일 : ${journalset.journal_email}</td>
      		</tr>
      		<tr>
      			<td>소속 : ${journalset.press}</td>
      		</tr>
      	</table>
      </div>
    </div>
  </div>
  </c:forEach>
</div>



</div>