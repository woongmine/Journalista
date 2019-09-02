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
	
	.pressName {
		
		width: 30%;
		
	}

</style>

<div class="pressSearchForm post">
	<label style="text-align: center;">언론사 검색</label>
	<form action="pressSearchComplete">
		<div style="margin: auto;">
		<c:forEach items="${press}" var="pressName">
			<button type="submit" class="button pressName" id="press_name" name="press_name" value="${pressName.press_name}">${pressName.press_name}</button>
		</c:forEach>
		</div>
	</form>
</div>