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