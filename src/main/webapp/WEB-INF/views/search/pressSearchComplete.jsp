<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<style>
	
	.pressSearchForm {
		
		width: 70%;
	}

</style>

<div class="pressSearchForm post">
<c:forEach items="${pressSearch}" var="press" begin="0" end="0">
<label>${press.press} 소속 ${fn:length(pressSearch)}명 </label>
</c:forEach>
<table>
<tr>
	<td>이름</td>
	<td>이메일</td>
	<td>평균 평점</td>
</tr>
<c:forEach items="${pressSearch}" var="press">
<tr>
	<td><a href="journalistDetails?j_no=${press.j_no}">${press.journal_name}</a></td>
	<td>${press.journal_email}</td>
	<td>${press.total_score}</td>
</tr>
</c:forEach>
</table>
</div>