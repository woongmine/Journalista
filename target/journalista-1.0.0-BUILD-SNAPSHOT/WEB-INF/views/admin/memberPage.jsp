<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<script>
	function checkAll() {
		if ($("#th_checkAll").is(':checked')) {
			$("input[name=checkRow]").prop("checked", true);
		} else {
			$("input[name=checkRow]").prop("checked", false);
		}
	}

	function memberDelete() {

		// 사용자 ID를 갖고 온다.
		var m_noArray = [];

		// name이 같은 체크박스의 값들을 배열에 담는다.

		$("input[name='checkRow']:checked").each(function(i) {
			m_noArray.push($(this).val());
		});

		// 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
		var allData = {
			"m_noArray" : m_noArray
		};

		$.ajax({
			url : "memberDelete",
			type : "post",
			data : allData,
			/* dataType : "text", */
			success : function(data) {
				console.log(m_noArray + ", 회원삭제완료");
				alert("회원삭제완료");
				location.reload();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);

			}
		});

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
		//매번 refresh 되므로 다른 페이지 removeClass 할 필요는 없음->Ajax 이용시엔 해야함
		$('#page' + thisPage).addClass('active');
	})

	function setPerPageNumSelect() {
		var perPageNum = '${pageMaker.cri.perPageNum}';
		var $perPageSel = $('#perPageSel');
		var thisPage = '${pageMaker.cri.page}';

		$perPageSel.val(perPageNum).prop("selected", true);
		$perPageSel.on('change', function() {
			window.location.href = "memberPage?page=" + thisPage
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
					var url = "memberPage?page=1" + "&perPageNum="
							+ "${pageMaker.cri.perPageNum}" + "&searchType="
							+ searchTypeVal + "&keyword="
							+ encodeURIComponent(keywordVal);
					window.location.href = url;
				})
	}
</script>


<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<div class="form-inline">
			<select id="searchTypeSel" name="searchType">
				<option value="">검색조건</option>
				<option value="n">이름</option>
				<option value="e">이메일</option>
				<option value="n_e">이름+이메일</option>
				<option value="a">권한</option>
			</select> <input class="form-control" type="text" id="keyword" name="keyword"
				value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />
			<button id="searchBtn" class="btn btn-primary">Search</button>
		<!-- perPageNum의 값을 정하는 select 박스 -->
		<select class="form-control" id="perPageSel" align="right">
			<option value="10">10</option>
			<option value="15">15</option>
			<option value="20">20</option>
		</select>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>


<table class="table" style="width: 50%" align="center" id="maintable">
	<thead class="thead-dark">
		<tr>
			<th scope="col"><input type="checkbox" name="checkAll"
				id="th_checkAll" onclick="checkAll();"></th>
			<th scope="col">회원번호</th>
			<th scope="col">이름</th>
			<th scope="col">이메일</th>
			<th scope="col">권한상태</th>
			<th scope="col">이메일 인증 상태</th>
			<th scope="col">수정</th>
		</tr>
		<c:forEach items="${allmember}" var="member">
			<c:set var="email_key" value="${member.email_key}" />
			<c:set var="m_no" value="${member.m_no}" />
			<tr scope="col">
				<td><input type="checkbox" name="checkRow"
					value="${member.m_no}"></td>
				<td>${m_no}</td>
				<td>${member.name}</td>
				<td>${member.email}</td>
				<td>${member.auth}</td>
				<td><c:choose>
						<c:when test="${ email_key eq 'Y' }">
							인증 완료
							</c:when>
						<c:otherwise>
							비인증 상태
							</c:otherwise>
					</c:choose></td>
				<td>
					<form action="updateView">
						<button type="submit" name="m_no" value="${m_no}"
							class="btn btn-secondary btn-sm">수정</button>
					</form>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7" align="right">
				<div class="btn-group" role="group" aria-label="Basic example">
					<button type="submit" class="btn btn-secondary" id="memberDelete"
						onclick="memberDelete();">삭제</button>
					<!-- 처음 목록 버튼 추가 -->
					<a href="/admin/memberPage" class="btn btn-secondary">검색 초기화</a>
				</div>
			</td>
		</tr>
</table>

<!-- 페이지 번호 -->
<div class="text-center">
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">

			<!-- prev 버튼 -->
			<li id="page-prev" class="page-item"><a class="page-link"
				href="memberPage${pageMaker.makeQuery(pageMaker.startPage-1)}"
				aria-label="Previous"> <span aria-hidden="true">«</span>
			</a></li>

			<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li id="page${idx}" class="page-item"><a class="page-link"
					href="memberPage${pageMaker.makeQuery(idx)}"> <!-- 시각 장애인을 위한 추가 -->
						<span>${idx}<span class="sr-only">(current)</span></span>
				</a></li>
			</c:forEach>

			<!-- next 버튼 -->
			<li id="page-next" class="page-item"><a class="page-link"
				href="memberPage${pageMaker.makeQuery(pageMaker.endPage + 1)}"
				aria-label="Next"> <span aria-hidden="true">»</span>
			</a></li>

		</ul>
	</nav>
</div>