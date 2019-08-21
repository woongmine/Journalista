<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<head>
<style>
	.layer_left{
	  position:absolute;
	  top:50%;
	  transform:translate(0%, -50%)
	}
	
	.layer_center{
	  position:absolute;
	  top:38%;
	  left:60%;
	  transform:translate(-63%, -25%)
	}
	
	.btn-unlike {
	  color: transparent;
	  text-shadow: 0 0 2px rgba(255,255,255,.7), 0 0 0 #000;
	}
	.btn-unlike:hover {
	  text-shadow: 0 0 0 #ea0;
	}
	.btn-like {
	  color: black;
	  text-shadow: 0;
	}
	.btn-like:hover {
	  color: transparent;
	  text-shadow: 0 0 0 #777;
	}
	
	p, p a { 
		color: #aaa;
		text-decoration: none;
	}
	p a:hover,
	p a:focus {
		text-decoration: underline;
	}
	p + p { color: #bbb; margin-top: 2em;}
	.detail {position: absolute; text-align: right; right: 5px; bottom: 5px; width: 50%;}
	
	a[href*="intent"] {
		display:inline-block;
		margin-top: 0.4em;
	}

	/*  
	 * Rating styles
	 */
	.rating {
		width: 226px;
		margin: 0 auto 1em;
		font-size: 45px;
		overflow:hidden;
	}
	.rating input {
	  float: right;
	  opacity: 0;
	  position: absolute;
	}
	.rating a,
    .rating label {
			float:right;
			color: #aaa;
			text-decoration: none;
			-webkit-transition: color .4s;
			-moz-transition: color .4s;
			-o-transition: color .4s;
			transition: color .4s;
		}
	.rating label:hover ~ label,
	.rating input:focus ~ label,
	.rating label:hover,
			.rating a:hover,
			.rating a:hover ~ a,
			.rating a:focus,
			.rating a:focus ~ a		{
				color: orange;
				cursor: pointer;
			}
			.rating2 {
				direction: rtl;
			}
			.rating2 a {
				float:none
			}
	
</style>
</head>

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
<script>
function five_stars(){
	alert("별점 5개를 주셨습니다.");
}
function four_stars(){
	alert("별점 4개를 주셨습니다.");
}
function three_stars(){
	alert("별점 3개를 주셨습니다.");
}
function two_stars(){
	alert("별점 2개를 주셨습니다.");
}
function a_star(){
	alert("별점 1개를 주셨습니다.");
}

</script>

<div class="layer_center" style="width: 800px; margin-top: 0px;">

<c:forEach items="${like_list}" var="like_list">
<c:set var="like_check" value="${like_list.like_check }" />
<div class="card">
	<input type="hidden" name="e_no" id="e_no" value="${like_list.e_no}">
	<h5 class="card-header">제목</h5>
	<div class="card-body">
		<h5 class="card-title">내용</h5>
		<a>현재 이 기자의 평균 별점 : 4점</a>
		<div align="right">
		<a href="#" class="button small">댓글쓰기</a>
		<% int like_check = (int) pageContext.getAttribute("like_check"); 
			System.out.println(like_check);
		%>
		<% if (like_check == 1) { %>
		<button id="btn-like" class="btn-like">👍</button>
		<% } else {
			%>
		<button id="btn-unlike" class="btn-unlike">👍</button>
		<% } %>
		</div>
	</div>
</div>
</c:forEach>
</div>

<script>
$(".btn-unlike").click(function() {
	var e_no = $('#e_no').val();
	var url = "like?e_no=1";
	location.href = url;
})
$(".btn-like").click(function() {
	var e_no = $('#e_no').val();
	var url = "like?e_no=1";
	location.href = url;
})


</script>
