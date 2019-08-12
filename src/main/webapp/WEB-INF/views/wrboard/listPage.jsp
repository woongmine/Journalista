<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<script>

	//게시글 작성 로그인 체크
	function idcheck(){
		var value = $('#name').val();
		if (value == ""){
			alert("로그인해야 작성할 수 있습니다.");
			return false;
		}
	}
	$(function() {
		//perPageNum select 박스 설정
		setPerPageNumSelect();
		//searchType select 박스 설정
		setSearchTypeSelect();

		//prev 버튼 활성화, 비활성화 처리
		var canPrev = '${pageMaker.prev}';
		if (canPrev !== 'true') {
			$('#page-prev').addClass('disabled');
		}

		//next 버튼 활성화, 비활성화 처리
		var canNext = '${pageMaker.next}';
		if (canNext !== 'true') {
			$('#page-next').addClass('disabled');
		}

		//현재 페이지 파란색으로 활성화
		var thisPage = '${pageMaker.cri.page}';
		$('#page' + thisPage).addClass('active');
	})

	function setPerPageNumSelect() {
		var perPageNum = '${pageMaker.cri.perPageNum}';
		var $perPageSel = $('#perPageSel');
		var thisPage = '${pageMaker.cri.page}';

		$perPageSel.val(perPageNum).prop("selected", true);
		$perPageSel.on('change', function() {
			window.location.href = "listPage?page=" + thisPage
					+ "&perPageNum=" + $perPageSel.val();
		})
	}

	function setSearchTypeSelect() {
		var $searchTypeSel = $('#searchTypeSel');
		var $keyword = $('#keyword');

		$searchTypeSel.val('${pageMaker.cri.searchType}')
				.prop("selected", true);
		//검색 버튼이 눌리면
		$('#searchBtn').on(
				'click',
				function() {
					var searchTypeVal = $searchTypeSel.val();
					var keywordVal = $keyword.val();
					//검색 조건 입력 안했으면 경고창 
					if (!searchTypeVal) {
						alert("검색 조건을 선택하세요!");
						$searchTypeSel.focus();
						return;
						//검색어 입력 안했으면 검색창
					} else if (!keywordVal) {
						alert("검색어를 입력하세요!");
						$('#keyword').focus();
						return;
					}
					var url = "listPage?page=1" + "&perPageNum="
							+ "${pageMaker.cri.perPageNum}" + "&searchType="
							+ searchTypeVal + "&keyword="
							+ encodeURIComponent(keywordVal);
					window.location.href = url;
				})
	}
	
	//카테고리
	$(document).on('click', '#btnCategory', function(e){

		e.preventDefault();

		var url = "listPage?page=1" + "&perPageNum=" + "${pageMaker.cri.perPageNum}";

		url = url + "&category=" + $('#category').val();

		location.href = url;
	});
</script>

<div class="w100" style="padding-right:10px; float:left;">
	<select class="form-control form-control-sm" name="category" id="category">
		<option value="all">전체게시판</option>
		
		<option value="request">요청게시판</option>

		<option value="report">신고게시판</option>

		<option value="etc">기타게시판</option>
	</select>
</div>
<div style="float:left;">
	<button class="btn btn-sm btn-primary" name="btnCategory" id="btnCategory">Go!</button></div>

<table class="table" style="width: 50%" align="center" id="maintable">
	<thead class="thead-dark">
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성일</th>
			<th scope="col">조회수</th>
		</tr>
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
<div class="text-center">
	<br/>
    <a href="/wrboard/write" onclick="return idcheck();">게시물 작성</a>
	<a href="/">홈으로</a>
</div>
<!-- 페이지 번호 -->
<div class="text-center">
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">

			<!-- prev 버튼 -->
			<li id="page-prev" class="page-item"><a class="page-link"
				href="listPage${pageMaker.makeQuery(pageMaker.startPage-1)}"
				aria-label="Previous"> <span aria-hidden="true">«</span>
			</a></li>

			<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li id="page${idx}" class="page-item"><a class="page-link"
					href="listPage${pageMaker.makeQuery(idx)}"> <!-- 시각 장애인을 위한 추가 -->
						<span>${idx}<span class="sr-only">(current)</span></span>
				</a></li>
			</c:forEach>

			<!-- next 버튼 -->
			<li id="page-next" class="page-item"><a class="page-link"
				href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}"
				aria-label="Next"> <span aria-hidden="true">»</span>
			</a></li>

		</ul>
	</nav>
</div>

<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<div class="form-inline">
			<select id="searchTypeSel" name="searchType">
				<option value="wr_title">제목</option>
				<option value="wr_contents">내용</option>
				<option value="name">닉네임</option>
			</select> 
			<input class="form-control" type="text" id="keyword" name="keyword"
				value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />
			<button id="searchBtn" class="btn btn-primary">Search</button>
		<!-- perPageNum의 값을 정하는 select 박스 -->
		</div>
		<div class="col-md-3"></div>
	</div>
</div>