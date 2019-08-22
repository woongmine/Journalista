<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<style>
	.btn-like {
	  color: transparent;
	  text-shadow: 0 0 2px rgba(255,255,255,.7), 0 0 0 #000;
	}
	.btn-like:hover {
	  text-shadow: 0 0 0 #ea0;
	}
	.btn-unlike {
	  color: black;
	  text-shadow: 0;
	}
	.btn-unlike:hover {
	  color: transparent;
	  text-shadow: 0 0 0 #777;
	}
</style>
<script>
	//게시글 작성 로그인 체크
	function idcheck(){
		var value = $('#name').val();
		if (value == ""){
			alert("로그인해야 작성할 수 있습니다.");
			return false;
		}
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
	
	function category_request(){
		var url = "listPage?page=1" + "&perPageNum=" + "${pageMaker.cri.perPageNum}";
		url = url + "&category=request";
		location.href = url;
		
	}
	function category_report(){
		var url = "listPage?page=1" + "&perPageNum=" + "${pageMaker.cri.perPageNum}";
		url = url + "&category=report";
		location.href = url;
		
	}
	function category_etc(){
		var url = "listPage?page=1" + "&perPageNum=" + "${pageMaker.cri.perPageNum}";
		url = url + "&category=etc";
		location.href = url;
		
	}
	
	$(document).on('click', '#btnCategory', function(e){

		e.preventDefault();

		var url = "listPage?page=1" + "&perPageNum=" + "${pageMaker.cri.perPageNum}";

		url = url + "&category=" + $('#category').val();

		location.href = url;
	});
</script>


<div class="layer_center" style="width: 800px; margin-top: 0px;">

<c:forEach items="${boardlist}" var="boardlist">
<div class="card" style="margin-bottom:20px;">
	<c:set var="number_no" value='${boardlist.e_no }' />
	<input type="hidden" name="number" id="number${number_no }" value="${boardlist.e_no}">
	<h5 class="card-header">제목</h5>
	<c:set var="like_check" value='${boardlist.like_check }'/>
	<div class="card-body">
		<h5 class="card-title">내용</h5>
		<a>현재 이 기자의 평균 별점 : ${boardlist.score }점</a>
		<div align="right">
		<a href="#" class="btn btn-primary">댓글쓰기</a>
		<a>좋아요 : ${boardlist.like}</a>
		<input type="hidden" value="${boardlist.like_check }">
		<% 
		int like_check = (int)pageContext.getAttribute("like_check");
		if (like_check == 1) { %>
		<button id="btn-unlike" class="btn-unlike" onclick = "location.href = 'like?e_no=${boardlist.e_no}';">👍</button>
		<% } else { %>
		<button id="btn-like" class="btn-like" onclick = "location.href = 'like?e_no=${boardlist.e_no}';">👍</button>
		<% } %>
		</div>
	</div>
</div>
</c:forEach>
</div>
