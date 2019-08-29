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
				color: orange;
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

function idcheck(){
	var value = $('#name').val();
	if (value == ""){
		alert("로그인해야 작성할 수 있습니다.");
		location.href='/member/login';
	}
}
</script>
<script>
var temp = "";

function Search() {
	var journal_name = $("#keyword").val();
	console.log("키워드 : "+journal_name);
	if (journal_name == "") {
		alert("검색어를 입력하세요!");
		$('#keyword').focus();
		return false;
	}
	else {
		$.ajax({
			type : 'post',
			url : "${path}/eboard/search_name?journal_name="+journal_name,
			data : journal_name,
			success : function(data){
				console.log(journal_name);
				var str = "";
				if(data != ""){
					$(data).each(
						function(){	
							str +=	"<button id='journalist' onclick='return Select(\""+ this.j_no + "\");'>"
								+	this.j_no + ". " + this.journal_name + ", "
								+	this.press
					 			+	"</button>";
					});	
					$(".search_name").append(str);
				}
				else{
					alert("검색된 이름이 없습니다.");
				}
			}
		});
	}
}

function Select(j_no) {
	console.log("select 들 : " + j_no);
	$.ajax({
		type : 'get',
		url : "${path}/eboard/search_no?j_no="+j_no,
		data : j_no,
		success : function(data){
			console.log(j_no);
			var select = "";
			var next = "";
			var next_button = "";
			if(data != ""){
				$(data).each(
					function(){	
						select +=	"<div>"
								+	"<a id='journal_name'>" + this.journal_name + "</a><a>, " + this.press + "</a>"
								+	"<br/>"
								+	"</div>";
						next += "<h3>기사 링크 붙여넣기 </h3>"
							 + "<input type='text' style='width:100%;' id='trackback' placeholder='링크를 붙여넣어 주세요'><br>"
							 + "<h3>한 줄 평</h3>"
							 + "<input type='text' style='width:100%; height:100px;' id='evaluation' placeholder='한 줄 평'><br>";
						next_button += "<button type='button' id='next' class='btn btn-default' style='float:right;' onclick='return score(\""+ this.j_no + "\");' data-target='#Score_Modal'>&nbsp다음&nbsp</button>";
						
					});	
				$(".search_name").empty();
				$(".search_name").append(select);
				$(".search_name").after("<br>");
				$(".modal-body").append(next);
				$(".modal-body").after(next_button);
			}
		}
	});
}
function score(j_no) {
	var evaluation = $("#evaluation").val();
	console.log("한줄평 : " + evaluation);
	if (evaluation == "") {
		alert("한 줄 평을 입력해주세요!");
		$('#evaluation').focus();
		return false;
	}
	$.ajax({
		type : 'post',
		url : "${path}/eboard/search_no?j_no="+j_no,
		data : j_no,
		success : function(data){
			console.log("찐막 : "+j_no);
			var select = "";
			var next = "";
			var next_button = "";
			if(data != ""){
				$(data).each(
					function(){
						var trackback = $("#trackback").val();
						console.log(trackback);
						var evaluation = $("#evaluation").val();
						console.log(evaluation);
						var name = this.journal_name;
						console.log("넘길 jr_name: " + name);
						var j_no = this.j_no;
						console.log("넘길 j_nㅐ: " + j_no);
						var score = "";
						score += "<div class=" + "'rating rating2'" + ">" 
							  + "<a href=" + "'/eboard/write?score=5&trackback=" + escape(trackback) + "&evaluation=" + evaluation + "&name=" + name + "&j_no=" + j_no + "'onclick=" + "'return five_stars();'" + ">★</a>"
							  + "<a href=" + "'/eboard/write?score=4&trackback=" + escape(trackback) + "&evaluation=" + evaluation + "&name=" + name + "&j_no=" + j_no + "'onclick=" + "'return four_stars();'" + ">★</a>"
							  + "<a href=" + "'/eboard/write?score=3&trackback=" + escape(trackback) + "&evaluation=" + evaluation + "&name=" + name + "&j_no=" + j_no + "'onclick=" + "'return three_stars();'" + ">★</a>"
							  + "<a href=" + "'/eboard/write?score=2&trackback=" + escape(trackback) + "&evaluation=" + evaluation + "&name=" + name + "&j_no=" + j_no + "'onclick=" + "'return two_stars();'" + ">★</a>"
							  + "<a href=" + "'/eboard/write?score=1&trackback=" + escape(trackback) + "&evaluation=" + evaluation + "&name=" + name + "&j_no=" + j_no + "'onclick=" + "'return a_star();'" + ">★</a>"
							  + "</div>";
						console.log(score);
						
						$("#modal_body").append(score);
						$("#next").remove();
					});
				
			}
		}
	});
}
</script>
<!-- Sidebar -->
<section id="sidebar" style="width:400px; margin-left: 10px;">
	<section>
	<input type="hidden" name="name" id="name" value="${member.name}">
		<div class="modal fade" id="Write_Modal" role="dialog">
		<div class="modal-dialog" style="top:70px;">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title">한 줄 평 남기기</h2>
		      </div>
		      <div class="modal-body" id="modal_body">
		      	<h3>기자 검색</h3>
		      	<div class="search_name">
		      	<input type="text" style="width:78%; float:left;" id="keyword" placeholder="기자 이름을 검색해 주세요">
		      	<button style="float:right;" onclick="return Search();">Search</button><br/>
		      	</div>
		      	
		      </div>
		      <div>
		      
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<div>
		<div>
		<button style="font-size:20px;"data-toggle="modal" data-target="#Write_Modal" class="button fit" onclick="return idcheck();">한줄평 남기기</button>
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

</script>
