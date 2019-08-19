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
<style>

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
<div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">한 줄 평 남기기</h4>
      </div>
      <div class="modal-body">
      	<input type="text" style="width:100%;" placeholder="링크를 붙여넣어 주세요"><br/>
     		<div class="rating rating2"><!--
				--><a href="/eboard/first_score?score=5" title="Give 5 stars" onclick="return five_stars();">★</a><!--
				--><a href="/eboard/first_score?score=4" title="Give 4 stars" onclick="return four_stars();">★</a><!--
				--><a href="/eboard/first_score?score=3" title="Give 3 stars" onclick="return three_stars();">★</a><!--
				--><a href="/eboard/first_score?score=2" title="Give 2 stars" onclick="return two_stars();">★</a><!--
				--><a href="/eboard/first_score?score=1" title="Give 1 star" onclick="return a_star();">★</a>
			</div>
        <!-- 
        <select id="score" name="score">
			<option value="" selected disabled hidden>별점 주기</option>
			<option value="2"  >★☆☆☆☆</option>
			<option value="4" >★★☆☆☆</option>
			<option value="6"  >★★★☆☆</option>
			<option value="8">★★★★☆</option>
			<option value="10"  >★★★★★</option>
		</select>
		 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<div class="layer_left">
<div>
<button data-toggle="modal" data-target="#myModal" class="btn btn-primary" style="margin-left:10px; width:350px; font-size:40px; margin-botton:20px;">한줄평 남기기</button>
</div>

<div class="w100" style="padding-right:10px; float:left;">
	<table class="table" align="center">
		<tr>
		<td><button style="width:150px;" class="btn btn-primary" onClick="location.href='listPage'">기자랭킹</button></td>
		<td><button style="width:150px;" class="btn btn-primary" onClick="return category_request();">조회수 랭킹</button></td>
		</tr>	
	</table>
	<br/>
	<div style="height:400px;">
	</div>
	<div style="margin-left:5px;" class="form-inline">
		<select id="searchTypeSel" name="searchType">
			<option value="" selected disabled hidden>선택하세요</option>
			<option value="wr_contents">기자 이름</option>
			<option value="wr_title">기사 제목</option>
			<option value="name">기사 내용</option>
		</select> 
		<input style="width:180px;" class="form-control" type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />
		<button style="width:70px; margin-right:20px;" id="searchBtn" class="btn btn-primary">Search</button>
	</div>
</div>
</div>
<div class="layer_center" style="width: 800px; margin-top: 100px;">

<div class="card">
	<h5 class="card-header">기사 제목</h5>
	<div class="card-body">
	  <h5 class="card-title">기사 내용</h5>
	  	<a>기사의 현재 별점 : 4점</a>
	  	<form method="post" action="/eboard/score">
	  	<div align="center">별점 주기</div>
	  	<div class="rating rating2"><!--
				--><a href="/eboard/first_score?score=5" title="Give 5 stars" onclick="return five_stars();">★</a><!--
				--><a href="/eboard/first_score?score=4" title="Give 4 stars" onclick="return four_stars();">★</a><!--
				--><a href="/eboard/first_score?score=3" title="Give 3 stars" onclick="return three_stars();">★</a><!--
				--><a href="/eboard/first_score?score=2" title="Give 2 stars" onclick="return two_stars();">★</a><!--
				--><a href="/eboard/first_score?score=1" title="Give 1 star" onclick="return a_star();">★</a>
		</div>
	  	<!-- 
	  	<select id="score" name="score">
			<option value="" selected disabled hidden>별점 주기</option>
			<option value="2"  >★☆☆☆☆</option>
			<option value="4" >★★☆☆☆</option>
			<option value="6"  >★★★☆☆</option>
			<option value="8">★★★★☆</option>
			<option value="10"  >★★★★★</option>
		</select>
		<button type="submit">등록하기</button>
		 -->
		</form>
		<div align="right">
		<a href="#" class="btn btn-primary">댓글쓰기</a>
		<a href="#" class="btn btn-primary">좋아요</a>
		</div>
	</div>
	 
</div>

<div class="card">
	<h5 class="card-header">기사 제목</h5>
	<div class="card-body">
	  <h5 class="card-title">기사 내용</h5>
	  	<a>기사의 현재 별점 : 4점</a>
	  	<form method="post" action="/eboard/score">
	  	<div align="center">별점 주기</div>
	  	<div class="rating rating2"><!--
				--><a href="/eboard/first_score?score=5" title="Give 5 stars" onclick="return five_stars();">★</a><!--
				--><a href="/eboard/first_score?score=4" title="Give 4 stars" onclick="return four_stars();">★</a><!--
				--><a href="/eboard/first_score?score=3" title="Give 3 stars" onclick="return three_stars();">★</a><!--
				--><a href="/eboard/first_score?score=2" title="Give 2 stars" onclick="return two_stars();">★</a><!--
				--><a href="/eboard/first_score?score=1" title="Give 1 star" onclick="return a_star();">★</a>
		</div>
		</form>
		<div align="right">
		<a href="#" class="btn btn-primary">댓글쓰기</a>
		<a href="#" class="btn btn-primary">좋아요</a>
		</div>
	</div>
	 
</div>

<div class="card">
	<h5 class="card-header">기사 제목</h5>
	<div class="card-body">
	  <h5 class="card-title">기사 내용</h5>
	  	<a>기사의 현재 별점 : 4점</a>
	  	<form method="post" action="/eboard/score">
	  	<div align="center">별점 주기</div>
	  	<div class="rating rating2"><!--
				--><a href="/eboard/first_score?score=5" title="Give 5 stars" onclick="return five_stars();">★</a><!--
				--><a href="/eboard/first_score?score=4" title="Give 4 stars" onclick="return four_stars();">★</a><!--
				--><a href="/eboard/first_score?score=3" title="Give 3 stars" onclick="return three_stars();">★</a><!--
				--><a href="/eboard/first_score?score=2" title="Give 2 stars" onclick="return two_stars();">★</a><!--
				--><a href="/eboard/first_score?score=1" title="Give 1 star" onclick="return a_star();">★</a>
		</div>
		</form>
		<div align="right">
		<a href="#" class="btn btn-primary">댓글쓰기</a>
		<a href="#" class="btn btn-primary">좋아요</a>
		</div>
	</div>
	 
</div>

<div class="card">
	<h5 class="card-header">기사 제목</h5>
	<div class="card-body">
	  <h5 class="card-title">기사 내용</h5>
	  	<a>기사의 현재 별점 : 4점</a>
	  	<form method="post" action="/eboard/score">
	  	<div align="center">별점 주기</div>
	  	<div class="rating rating2"><!--
				--><a href="/eboard/first_score?score=5" title="Give 5 stars" onclick="return five_stars();">★</a><!--
				--><a href="/eboard/first_score?score=4" title="Give 4 stars" onclick="return four_stars();">★</a><!--
				--><a href="/eboard/first_score?score=3" title="Give 3 stars" onclick="return three_stars();">★</a><!--
				--><a href="/eboard/first_score?score=2" title="Give 2 stars" onclick="return two_stars();">★</a><!--
				--><a href="/eboard/first_score?score=1" title="Give 1 star" onclick="return a_star();">★</a>
		</div>
		</form>
		<div align="right">
		<a href="#" class="btn btn-primary">댓글쓰기</a>
		<a href="#" class="btn btn-primary">좋아요</a>
		</div>
	</div>
	 
</div>
</div>