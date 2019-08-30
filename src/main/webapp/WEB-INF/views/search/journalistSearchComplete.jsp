<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<style>

	.card table { 
		font-size: 10pt;
	}

	h3 {
		align-content: center;
	}
	
</style>


<form action="journalistSearchComplete">
	<div id="journalistSearchMain">
		<div align="center" id="search">
			<label for="Search">기자 검색</label>
			<div class="input-group mb-3" style="width: 550px;">
				<input type="text" class="form-control" id="journal_name" name="journal_name" style="height: 45px;">
				<button type="submit" id="searchBtn" class="button small" style="height: 45px;">검색</button>
			</div>
		</div>
	</div>
</form>


<c:choose>
<c:when test="${fn:length(journal) == 0}">
<div align="center"><h3>조회결과가 없습니다.</h3></div>
</c:when>
<c:otherwise>
<div align="center"><h3>검색 결과 : ${fn:length(journal)}건</h3></div><br>
<div class="container">
<div class="row">
<c:forEach items="${journal}" var="journalset">
<c:set var="j_no" value="${journalset.j_no}" />
  <div class="col-sm-4">
    <div class="card" style="height: 300px;">
      <div class="card-body">
      	<table style="height: 280px;" font-size="10pt">
      		<tr style="width: 100px;">
      			<td rowspan="2" style="line-height: 0"><div><img alt="머머리" src="${contextPath}/resources/images/bald.jpg" width="90" height="90" class="rounded-circle"></div></td>
      			<td>이름 : ${journalset.journal_name}</td>
      		</tr>
      		<tr>
      			<td>소속 : ${journalset.press}</td>
      		</tr>
      		<tr>
      			<td colspan="2">이메일 : ${journalset.journal_email}</td>
      		</tr>
      		<tr>
      			<td colspan="2" align="center">
      				<form action="journalistDetails">
      					<button type="submit" name="j_no" value="${j_no}" class="button small">자세히 봐야 예쁘다 너도 그렇다</button>
      				</form>
      			</td>
      		</tr>
      	</table>
      </div>
    </div>
  </div>
  </c:forEach>
  </div>
</div>
 <a id="back-to-top" href="" class="btn btn-lg back-top" role="button" data-toggle="tooltip" data-placement="left"><span class="fas fa-chevron-up"></span></a>
  </c:otherwise>
 </c:choose>
 
 <script>
 
 $(document).ready(function(){
	    $(window).scroll(function () {
	           if ($(this).scrollTop() > 50) {
	               $('#back-to-top').fadeIn();
	           } else {
	               $('#back-to-top').fadeOut();
	           }
	       });
	       // scroll body to 0px on click
	       /*
	       $('#back-to-top').click(function () {
	           $('#back-to-top').tooltip('hide');
	           return false;
	       });
	       $('#back-to-top').tooltip('show');
	       */
	});
 
 </script>