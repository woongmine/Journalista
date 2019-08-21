<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>

<article class="post">

<div id="search_area" class="container">
	<form action="/eboardsearchComplete" method="get" id="searchForm">
		<div id="search_ctn" class="row">
		
			<div class="col-3"></div>
			
			<div class="col-6">
				<div class="form-inline form-group">
					<label class="form-horizontal">기자 이름 : &nbsp;&nbsp;</label> <input type="text" style="width: 15em; height: 2em;">
				</div>
				<hr>
				<div class="form-inline form-group">
					<label class="form-horizontal">기자 이메일 : &nbsp;</label><input type="text" style="width: 15em; height: 2em;">
				</div>
				<hr>
				<div class="form-inline form-group">
					<label class="form-horizontal">언론사 :</label>
					<br>
					<p>
					<input type="checkbox" id="p1" name="press" value="중앙일보"/>
					<label for="p1">중앙일보</label>&nbsp;
					<input type="checkbox" id="p2" name="press" value="조선일보"/>
					<label for="p2">조선일보</label>&nbsp;
					<input type="checkbox" id="p3" name="press" value="동아일보"/>
					<label for="p3">동아일보</label>&nbsp;
					<input type="checkbox" id="p4" name="press" value="한겨레"/>
					<label for="p4">한겨레</label>&nbsp;
					</p>
				</div>
				<hr>
				<input type="submit" value="검색하기">
			</div>
			
			<div class="col-3"></div>
			
		</div>
	</form>
</div>

</article>
