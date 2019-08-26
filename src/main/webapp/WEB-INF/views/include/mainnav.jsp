<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
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
<!-- Sidebar -->
<section id="sidebar" style="width:400px; margin-left: 10px;">

	<section>
		<div class="modal fade" id="myModal" role="dialog">
		  <div class="modal-dialog" style="top:70px;">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="modal-title">한 줄 평 남기기</h4>
		      </div>
		      <div class="modal-body">
		      	<input type="text" style="width:100%;" placeholder="링크를 붙여넣어 주세요"><br/>
		     		<div class="rating rating2" style="width:300px; text-align: center;" >
			     		<a href="/eboard/first_score?score=5" title="Give 5 stars" onclick="return five_stars();">★</a>
						<a href="/eboard/first_score?score=4" title="Give 4 stars" onclick="return four_stars();">★</a>
						<a href="/eboard/first_score?score=3" title="Give 3 stars" onclick="return three_stars();">★</a>
						<a href="/eboard/first_score?score=2" title="Give 2 stars" onclick="return two_stars();">★</a>
						<a href="/eboard/first_score?score=1" title="Give 1 star" onclick="return a_star();">★</a>
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
		<div>
		<div>
		<button style="font-size:20px;"data-toggle="modal" data-target="#myModal" class="button fit">한줄평 남기기</button>
		</div>
		</div>
	</section>
	<section style="margin-top:10px; padding-top:10px;">
		<div class="w100">
		<table class="table">
			<tr>
			<td><button class="button fit" onClick="location.href='listPage'">기자랭킹</button></td>
			<td><button class="button fit" onClick="return category_request();">조회수 랭킹</button></td>
			</tr>	
		</table>
		<br/>
		<div style="height:300px;">
	</div>
	<div>
		<div style="width:40%; float:left;">
			<select id="searchTypeSel" name="searchType">
				<option value="" selected disabled hidden>선택하세요</option>
				<option value="wr_contents">기자 이름</option>
				<option value="wr_title">기사 제목</option>
				<option value="name">기사 내용</option>
			</select>
		</div>
		<div style="width:60%; float:right;">
			<input class="form-control" type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />
		</div>
	</div>
	<button id="searchBtn" class="button fit">Search</button>
</div>
	</section>

</section>