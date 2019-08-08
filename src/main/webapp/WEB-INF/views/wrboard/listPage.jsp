<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<c:out value="${param.num }" />
<script>

	function idcheck(){
		var value = $('#name').val();
		if (value == ""){
			alert("로그인해야 작성할 수 있습니다.");
			return false;
			}
		}
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {

			var page = ((range - 2) * rangeSize) + 1;

			var range = range - 1;

			var url = "${pageContext.request.contextPath}/wrboard/listPage";

			url = url + "?page=" + page;

			url = url + "&range=" + range;

			location.href = url;

		}

	  //페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {

			var url = "${pageContext.request.contextPath}/wrboard/listPage";

			url = url + "?page=" + page;

			url = url + "&range=" + range;

			location.href = url;	

		}
		//다음 버튼 이벤트

		function fn_next(page, range, rangeSize) {

			var page = parseInt((range * rangeSize)) + 1;

			var range = parseInt(range) + 1;

			var url = "${pageContext.request.contextPath}/wrboard/listPage";

			url = url + "?page=" + page;

			url = url + "&range=" + range;

			location.href = url;

		}
		
		$(document).on('click', '#btnSearch', function(e){

			e.preventDefault();

			var url = "${pageContext.request.contextPath}/wrboard/listPage";

			url = url + "?searchType=" + $('#searchType').val();

			url = url + "&keyword=" + $('#keyword').val();

			location.href = url;

			console.log(url);

		});

</script>
	<form align="center" name="check">
	<div class="w100" style="padding-right:10px">
		<select class="form-control form-control-sm" name="searchType" id="searchType">
			<option value="request">요청</option>

			<option value="report">신고</option>

			<option value="etc">기타</option>
		</select>
	</div>
	<table class="table" style="width: 60%" align="center">
		<thead class="thead-dark">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr scope="row">
					<td>${list.wr_no}</td>
					<td><a href="/wrboard/view?wr_no=${list.wr_no}">${list.wr_title}</a></td>
					<td>${list.name}</td>
					<td><fmt:formatDate value="${list.wr_datetime}" pattern="yy.MM.dd-hh.mm.ss" /></td>
					<td>${list.wr_hit}</td>
					<td><input type="hidden" name="name" id="name" value="${member.name}"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<br/>
	    <a href="/wrboard/write" onclick="return idcheck();">게시물 작성</a>
		<a href="/">홈으로</a>
	</form>
	<!-- pagination{s} -->

	<div id="paginationBox" align="center">

		<ul class="pagination justify-content-center">

			<c:if test="${pagination.prev}">

				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>

			</c:if>

			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">

				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>

			</c:forEach>

			<c:if test="${pagination.next}">

				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>

			</c:if>

		</ul>

	</div>
	<!-- pagination{e} -->
	<!-- search{s} -->

	<div class="form-group row justify-content-center">
		<div class="w100" style="padding-right:10px">
			<select class="form-control form-control-sm" name="searchType" id="searchType">
				<option value="wr_title">제목</option>

				<option value="wr_contents">내용</option>

				<option value="name">닉네임</option>
			</select>
		</div>

		<div class="w300" style="padding-right:10px">
			<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
		</div>
		<div>
			<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
		</div>
	</div>

	<!-- search{e} -->

</body>
</html>