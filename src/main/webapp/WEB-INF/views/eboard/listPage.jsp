<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<style>
	.card {
		margin-bottom:20px;
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

</script>
<script>
	
	//댓글 쓰기 
	function inserttext(e_no){
		var ere_text=$("#ere_text"+e_no).val();
		if(ere_text == "" ){
			alert("댓글어딧나 어디있냔 말이다 개쉐리야~~~~~~!");
		}else{
		var param={
				ere_text : ere_text,
				e_no : e_no					
		};
		console.log(param);
		$.ajax({
			type: "post",
			url: "${path}/ereply/insert",
			data: param,
			success: function(){
				alert("댓글이 등록되었습니다.");
				listview2(e_no);
				
			}
		});	
		}
	}


//날짜 변환 함수
function changeDate(date) {
	date = new Date(parseInt(date));
	year = date.getFullYear();
	month = date.getMonth() + 1;
	day = date.getDate();
	hour = date.getHours();
	minute = date.getMinutes();
	second = date.getSeconds();
	strDate = (year-2000)+"."+month+"."+day+"  "+hour+":"+minute+":"+second;

	return strDate;
}

//댓글 삭제
function ereplydelete(ere_no,e_no) {
	var param = {
		ere_no : ere_no
	};
		$.ajax({
			type : "post",
			url : "${path}/ereply/replydelete",
			data : param,
			success : function() {
				 listview2(e_no);
			}
		});
}

function listview2(e_no){	
	console.log(e_no);
	var userId= "<%=session.getAttribute("userId")%>";
	console.log(userId);
	$.ajax({
			type : "get",
			data : e_no,
			url : "${path}/ereply/listJson?e_no="+e_no,
			success : function(result) {
				var output = "<table>";
				for ( var i in result) {
					if (result[i].email == userId) {							
						output += "<tr>";
						output += "<td style='color:#6E6E6E; font-size:10pt; '>"  + "<a style='color:#6E6E6E; font-size:11pt; font-weight: bolder;'>"+ result[i].name 
								+"</a>";
						output += " / " + changeDate(result[i].regdate)
								+ "<br>";
						output += result[i].ere_text + "</td>"
						output += "<td><a style='color:#6E6E6E; font-size:13pt;' class='far fa-trash-alt' onClick='javascript:ereplydelete("
								+ result[i].ere_no+","+e_no+
								 ")'></a></td>";
						output += "<tr>";
					

					} else {
						output += "<tr>";
						output += "<td colspan='2' style='color:#6E6E6E; font-size:10pt; '>"+ "<a style='color:#6E6E6E; font-size:11pt; font-weight: bolder;'>" + result[i].name 
								+ "</a>";
						output += " / " + changeDate(result[i].regdate)
								+ "<br>";
						output += result[i].ere_text + "<br></td>"
						output += "<tr>";
						
					}
				}
			output += "</table>";
			$("#listEreply"+e_no).html(output);
			}
		});
}
	
</script>

<div class="layer_center" id="top" style="width: 800px; margin-top: 0px;">
<c:forEach items="${boardlist}" var="boardlist">
<div class="card">
	<c:set var="number_no" value='${boardlist.e_no }' />
	<c:set var="score" value='${boardlist.score }'/>
	<input type="hidden" class="scrolling" name="number" id="number${number_no }" data-e_no="${boardlist.e_no }" value="${boardlist.e_no}">
	<h3 class="card-header">${boardlist.name } 기자 
	<% int score = (int)pageContext.getAttribute("score"); 
	   for(int i=1; i<=score; i++){ %>
		<i class="fas fa-star" style="color:orange; float:right;"></i>
	<% } %>
	</h3>
	<c:set var="like_check" value='${boardlist.like_check }'/>
	<div class="card-body">
		<h4 class="card-title"><a href="${boardlist.trackback }" target="_blank">기사 링크 :  ${boardlist.trackback }</a></h4>
		<h3>한줄평 : ${boardlist.evaluation }</h3>
		<a style="color:#6E6E6E; font-size:10pt; font-weight: bolder;">현재 이 기자의 평균 별점 : ${boardlist.total_score }점</a>
		<div align="right">
		<a class="icon solid fa-comment" onclick="listview(${boardlist.e_no})" style="color:#6E6E6E; font-size:10pt; font-weight: bolder;"> comment( ${boardlist.recnt} ) </a>
		<a style="color:#6E6E6E; font-size:10pt; font-weight: bolder;"> | </a>
		<input type="hidden" value="${boardlist.like_check }"style="color:#6E6E6E; font-size:10pt; font-weight: bolder;">
		<% 
		int like_check = (int)pageContext.getAttribute("like_check");
		if (like_check == 1) { %>
		<a href="like?e_no=${boardlist.e_no}" class="fas fa-heart" style="color:#6E6E6E; font-size:10pt; font-weight: bolder; color:red"></a>
		<% } else { %>
		<a href="like?e_no=${boardlist.e_no}" class="icon fa-heart" style="color:#6E6E6E; font-size:10pt; font-weight: bolder; "></a>
		<% } %>
		<a style="color:#6E6E6E; font-size:10pt; font-weight: bolder;">like ( ${boardlist.like} )</a>
		</div>
	</div>
		<div id="replytext${boardlist.e_no}" style="width: 700px; display: none;">		
				<br>
				<textarea rows="2" cols="60" id="ere_text${boardlist.e_no}" placeholder="댓글을 입력하세요."></textarea>
				<br>	
				<button type="button" class="button" id="btnEreply" onclick="inserttext(${boardlist.e_no})">댓글 작성</button>
      	<div id="listEreply${boardlist.e_no}" class="example01"  ></div>
    	</div>		
</div>
</c:forEach>
</div>
<a id="back-to-top" href="#" class="btn btn-lg back-top" role="button" title="Click to return on the top page" data-toggle="tooltip" data-placement="left"><span class="fas fa-chevron-up"></span></a>


<script>
var lastScrollTop = 0;
var easeEffect = 'easeInQuint';

$(window).scroll(function() {

	var currentScrollTop = $(window).scrollTop();
	
	if( currentScrollTop - lastScrollTop > 0 ){
		console.log("down-scroll");
		
	if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
		var lasteno = $(".scrolling:last").attr("data-e_no");
		console.log('last eno = ' + lasteno);
		$.ajax({
			type : 'post',
			url : 'infiniteScrollDown',
			headers : { 
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'json', 
			data : JSON.stringify({  
				e_no : lasteno
			}),
			success : function(data){
				
				var str = "";
				if(data != ""){
					$(data).each(
						function(){	
							var button = "";
							var score = "";
							console.log('likecheck : ' + this.like_check);
							if(this.like_check == 1) {
								button = "<a href= 'like?e_no="+this.e_no+"' class='fas fa-heart' style='color:#6E6E6E; font-size:10pt; font-weight: bolder;color:red' > </a>";
																													
								}
							else {
								button = "<a href= 'like?e_no="+this.e_no+"' class='icon fa-heart' style='color:#6E6E6E; font-size:10pt; font-weight: bolder;'> </a>";
								}
							if(this.score == 1) {
								score = "<i class='fas fa-star' style='color:orange; float:right;'></i>"
								}
							else if(this.score == 2) {
								score = "<i class='fas fa-star' style='color:orange; float:right;'></i><i class='fas fa-star' style='color:orange; float:right;'></i>"
								}
							else if(this.score == 3) {
								score = "<i class='fas fa-star' style='color:orange; float:right;'></i><i class='fas fa-star' style='color:orange; float:right;'></i></i><i class='fas fa-star' style='color:orange; float:right;'></i>"
								}
							else if(this.score == 4) {
								score = "<i class='fas fa-star' style='color:orange; float:right;'></i><i class='fas fa-star' style='color:orange; float:right;'></i></i><i class='fas fa-star' style='color:orange; float:right;'></i></i><i class='fas fa-star' style='color:orange; float:right;'></i>"
								}
							else if(this.score == 5) {
								score = "<i class='fas fa-star' style='color:orange; float:right;'></i><i class='fas fa-star' style='color:orange; float:right;'></i></i><i class='fas fa-star' style='color:orange; float:right;'></i></i><i class='fas fa-star' style='color:orange; float:right;'></i></i><i class='fas fa-star' style='color:orange; float:right;'></i>"
								}
							console.log(this);
							str +=	"<div class=" + "'card'" + ">" 
								+	"<input type=" + "'hidden'" + "class=" + "'scrolling'" + "data-e_no=" + this.e_no + " value=" + this.e_no + ">"
								+	"<h3 class=" + "'card-header'" + ">" + this.name + "기자</h3>"
								+	"<div class=" + "'card-body'" + ">"
								+	"<h4 class=" + "'card-title'" + "><a href='" + this.trackback + "target='_blank'> 기사 링크 + " + this.trackback + "</h4>"
								+	"<h3>한줄평" + this.evaluation + score + "</h3>"
								+	"<a> 현재 이 기자의 평균 별점 : " + this.score + "</a>"
								+	"<div align=" + "'right'" + ">"
								+	"<a class='icon solid fa-comment' onclick='listview("+this.e_no+")' style='color:#6E6E6E; font-size:10pt; font-weight: bolder;''> comment ( "+this.recnt+" ) </a>"
								+	"<a style='color:#6E6E6E; font-size:10pt; font-weight: bolder;'> | </a>"
								+	"<input type=" + "'hidden'" + "value=" + this.like_check + ">"						
								+	button
								+	"<a style='color:#6E6E6E; font-size:10pt; font-weight: bolder;'>like ( " + this.like + " )</a>"
								+	"</div>"
								+	"</div>"
								+	"<div id='replytext"+this.e_no+"' style='width: 700px; display: none;'>"		
								+	"<br>"
								+	"<textarea rows='2' cols='60' id='ere_text"+this.e_no+"' placeholder='댓글을 입력하세요.'></textarea>"
								+	"<br>"	
								+	"<button type='button' class='button' id='btnEreply' onclick='inserttext("+this.e_no+")'>댓글 작성</button>"
				      			+	"<div id='listEreply"+this.e_no+"' class='example01'  ></div>"
						 		+ 	"</div>"
						 		+ 	"</div>";
					 		
					});			
					$(".layer_center").append(str);
				
				}
				else{ 
					alert("더 불러올 데이터가 없습니다.");
				}

			}
		});
		
		//var position = $(".layer_center:first").offset();
		
		
		//$('html,body').stop().animate({scrollTop : position.top }, 600, easeEffect);
		}

	lastScrollTop = currentScrollTop;
}

});


function listview(e_no){	
		
		 	if($("#replytext"+e_no).is(":visible")){		 			
		 		$("#replytext"+e_no).slideUp('fast');
				}else{
					$("#replytext"+e_no).slideDown('fast');				
				} 
			listview2(e_no);
			}

/*탑버튼 액션*/
 */*
$(document).ready(function(){
    $(window).scroll(function () {
           if ($(this).scrollTop() > 50) {
               $('#back-to-top').fadeIn();
           } else {
               $('#back-to-top').fadeOut();
           }
       });
       // scroll body to 0px on click
       $('#back-to-top').click(function () {
           $('#back-to-top').tooltip('hide');
           return false;
       });
       
       $('#back-to-top').tooltip('show');

});
  */
</script>

