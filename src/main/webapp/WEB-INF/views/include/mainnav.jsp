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
		<div class="modal fade" id="Write_Modal" role="dialog">
		<div class="modal-dialog" style="top:70px;">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title">한 줄 평 남기기</h2>
		      </div>
		      <div class="modal-body" id="modal_body">
		      	<h3>기자 검색</h3>
		      	<div>
		      	<input type="text" style="width:78%; float:left;" id="name" placeholder="기자 이름을 검색해 주세요"><button style="float:right;">Search</button><br/>
		      	</div>
		      	<br/>
		      	<h3>기사 링크 붙여넣기</h3>
		      	<input type="text" style="width:100%;" id="trackback" placeholder="링크를 붙여넣어 주세요"><br/>
		      	<h3>한 줄 평</h3>
		      	<input type="text" style="width:100%; height:100px;" id="evaluation" placeholder="한 줄 평">
		      </div>
		      <div>
		      	<button type="button" id="next"class="btn btn-default" style="float:right;" onclick="return score();" data-target="#Score_Modal">&nbsp다음&nbsp</button>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- <div class="modal fade" id="Score_Modal" role="dialog">
		  <div class="modal-dialog" style="top:70px;">
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
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div> -->
		<div>
		<div>
		<button style="font-size:20px;"data-toggle="modal" data-target="#Write_Modal" class="button fit">한줄평 남기기</button>
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
	</div>
	</section>

</section>

<script>
function score() {
	var trackback = $("#trackback").val();
	console.log(trackback);
	var evaluation = $("#evaluation").val();
	console.log(evaluation);
	var score = "";
	score += "<div class=" + "'rating rating2'" + ">" 
		  + "<a href=" + "'/eboard/write?score=5&trackback=" + trackback + "&evaluation=" + evaluation + "'onclick=" + "'return five_stars();'" + ">★</a>"
		  + "<a href=" + "'/eboard/write?score=4&trackback=" + trackback + "&evaluation=" + evaluation + "'onclick=" + "'return four_stars();'" + ">★</a>"
		  + "<a href=" + "'/eboard/write?score=3&trackback=" + trackback + "&evaluation=" + evaluation + "'onclick=" + "'return three_stars();'" + ">★</a>"
		  + "<a href=" + "'/eboard/write?score=2&trackback=" + trackback + "&evaluation=" + evaluation + "'onclick=" + "'return two_stars();'" + ">★</a>"
		  + "<a href=" + "'/eboard/write?score=1&trackback=" + trackback + "&evaluation=" + evaluation + "'onclick=" + "'return a_star();'" + ">★</a>"
		  + "</div>";
	console.log(score);
	//var regist = "";
	//regist += "<button type=" + "'button'" + "style=" + "'float:right;'" + ">&nbsp등록&nbsp</button>";		
	
	$("#modal_body").append(score);
	$("#next").remove();
}
</script>