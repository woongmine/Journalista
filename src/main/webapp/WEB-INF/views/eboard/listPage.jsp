<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% String login_email = (String)session.getAttribute("login_email"); %>
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
			alert("등록할 댓글이 없습니다.");
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
						output += "<td>";
						output += "<div class='media'>";
						output += "<img width='45px' height='55px' class='img-fluid rounded-circle' src='/resources/images/profile/"+result[i].m_no+".jpg'"
						output += "onError=this.src='/resources/images/profile/default.jpg'>";
						
						output += "&nbsp; &nbsp; &nbsp;<div class='media-boby' style='color:#6E6E6E; font-size:10pt; '>" + "<a style='color:#6E6E6E; font-size:11pt; font-weight: bolder;'>"+result[i].name
								+ "</a>";
						output += " / " + changeDate(result[i].regdate)
								+ "<br>";
						output += result[i].ere_text + "</td>"
						output += "<td><a style='color:#6E6E6E; font-size:13pt;' class='far fa-trash-alt' onClick='javascript:ereplydelete("
								+ result[i].ere_no+","+e_no+
								 ")'></a></td>";
						output += "</div>";
						output += "</td>";
						output += "</tr>";
					

					} else {
						output += "<tr>";
						output += "<td colspan='2'>";
						output += "<div class='media'>";
						output += "<img width='45px' height='55px' class='img-fluid rounded-circle' src='/resources/images/profile/"+result[i].m_no+".jpg'"
						output += "onError=this.src='/resources/images/profile/default.jpg'>";
						output += "&nbsp; &nbsp; &nbsp;<div class='media-boby' style='color:#6E6E6E; font-size:10pt; '>" + "<a style='color:#6E6E6E; font-size:11pt; font-weight: bolder;'>"+result[i].name
								+ "</a>";
						output += " / " + changeDate(result[i].regdate)
								+ "<br>";
						output += result[i].ere_text + "</div>"
						output += "</div>";
						output += "</td>";
						output += "</tr>";
						
					}
				}
			output += "</table>";
			$("#listEreply"+e_no).html(output);
			}
		});
}


</script>

<div class="layer_center" id="top" style="width: 870px; margin-top: 0px;">
<c:forEach items="${boardlist}" var="boardlist">
	<c:set var="number_no" value='${boardlist.e_no }' />
	<c:set var="score" value='${boardlist.score }'/>
	<c:set var="like_check" value='${boardlist.like_check }'/>
	<c:set var="writer_email" value='${boardlist.writer_email }'/>
	<input type="hidden" class="scrolling" name="number" id="number${number_no }" data-e_no="${boardlist.e_no }" value="${boardlist.e_no}">
	<article class="post">
		<header>
			<div class="title" style="padding-top: 60px;">
				<h2><a href="/search/journalistDetails?j_no=${boardlist.j_no }" title="기자 상세페이지로 이동">${boardlist.name } 기자</a></h2>
				<p style="font-size:15px;">${boardlist.press }, 평균 평점 : ${boardlist.total_score } </p>
			</div>
			<div class="meta" style="padding-top: 20px;">
				<p style="font-size:15px; color:black;"><fmt:formatDate value="${boardlist.e_datetime}" pattern="yyyy/MM/dd, HH:mm" /></p>
				<a class="author"><img width='45px' height='55px' class='img-fluid rounded-circle align-self-center' src="/resources/images/profile/${boardlist.m_no}" onError=this.src="/resources/images/profile/default.jpg"><span class='name'>${boardlist.writer_name}</span></a>
			</div>
		</header>
		LINK : <a style="color:#0040FF; font-size:20px;" href="${boardlist.trackback}" target="_blank"> ${boardlist.articletitle}</a>
		<br/>
		<p> </p>
		<p style="color:black;">${boardlist.evaluation }</p>
		<% String writer_email = (String)pageContext.getAttribute("writer_email");
		if (writer_email.equals(login_email)) {
			%>
		<a href="Delete?e_no=${boardlist.e_no }" style="color:red; font-size:15px; float:right;" title="삭제하기"><i class="fas fa-trash-alt"></i></a>
		<% }%>
		<% int score = (int)pageContext.getAttribute("score"); 
	   for(int i=1; i<=score; i++){ %>
		<i class="fas fa-star" style="color:orange; float:left;"></i>
	<% } %>
		<br/>
		<footer>
			<ul class="actions">
				<li></li>
			</ul>
			<ul class="stats">
			<% 
			int like_check = (int)pageContext.getAttribute("like_check");
			if (like_check == 1) { %>
			<a onclick = "return like_or_unlike(${boardlist.e_no});" id="like${boardlist.e_no }" class="fas fa-heart" style="color:#6E6E6E; font-size:10pt; font-weight: bolder; color:red"></a>
			<% } else { %>
			<a onclick = "return like_or_unlike(${boardlist.e_no});" id="like${boardlist.e_no }" class="icon fa-heart" style="color:#6E6E6E; font-size:10pt; font-weight: bolder; color:red"></a>
			<% } %>
			<a style="color:#6E6E6E; font-size:10pt; font-weight: bolder;">like </a>
			<a id="like_count${boardlist.e_no }">${boardlist.like }</a><a style="color:#6E6E6E; font-size:10pt; font-weight: bolder;"> </a>
			<a class="icon solid fa-comment" onclick="listview(${boardlist.e_no})" style="color:#6E6E6E; font-size:10pt; font-weight: bolder;"> comment ${boardlist.recnt} </a>
			</ul>
			
		</footer>
		<div id="replytext${boardlist.e_no}" style="width: 700px; display: none;">		
		<br>
		<textarea rows="2" cols="60" id="ere_text${boardlist.e_no}" placeholder="댓글을 입력하세요."></textarea>
		<br>	
		<button type="button" id="btnEreply" class="button" onclick="inserttext(${boardlist.e_no})">댓글 작성</button>
     	<div id="listEreply${boardlist.e_no}" class="example01"  ></div>
   	</div>
	</article>
</c:forEach>
<div class="card">
	</div>
</div>


<a id="back-to-top" href="listPage" class="btn btn-lg back-top" title="위로 가기" role="button" data-toggle="tooltip" data-placement="left"><span class="fas fa-chevron-up"></span></a>


<script>
function like_or_unlike(e_no){
	console.log(e_no);
	 $.ajax({
		    url: "like",
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: 'e_no=' + e_no,
		    success: function(data) {
				console.log("좋아요2222");
				console.log(data);
				str = "";
				if(data == 0){
					console.log("언라잌");
					$("#like"+e_no).attr('class','icon fa-heart');
					var like_count = $("#like_count"+e_no).text();
					console.log(like_count);
					$("#like_count"+e_no).text(like_count*1 - 1);
					}
				else if(data == 3){
					alert("로그인 해주세요");
					return false;
					}
				else {
					console.log("라잌");
					$("#like"+e_no).attr('class','fas fa-heart');
					var like_count = $("#like_count"+e_no).text();
					console.log(like_count);
					$("#like_count"+e_no).text(like_count*1 + 1);
					}
		    }
		  });

}

var lastScrollTop = 0;
var easeEffect = 'easeInQuint';

$(window).scroll(function() {

	var currentScrollTop = $(window).scrollTop();
	
	if( currentScrollTop - lastScrollTop > 0 ){
		console.log("down-scroll");
		
	if ($(window).scrollTop() + 1 >= $(document).height() - $(window).height()) {
		var e_no = $(".scrolling:last").attr("data-e_no");
		console.log('lasteno = ' + e_no);
		$.ajax({
			type : 'post',
			url : 'infiniteScrollDown',
			headers : { 
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'json', 
			data : JSON.stringify({  
				e_no : e_no
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
								button = "<a onclick = 'return like_or_unlike(" + this.e_no + ");' id='like" + this.e_no + "' class='fas fa-heart' style='color:#6E6E6E; font-size:10pt; font-weight: bolder; color:red' > </a>";
							}
							else {
								button = "<a onclick = 'return like_or_unlike(" + this.e_no + ");' id='like" + this.e_no + "' class='icon fa-heart' style='color:#6E6E6E; font-size:10pt; font-weight: bolder; color:red'> </a>";
								}
							if(this.score == 1) {
								score = "<i class='fas fa-star' style='color:orange; float:left;'></i>"
								}
							else if(this.score == 2) {
								score = "<i class='fas fa-star' style='color:orange; float:left;'></i><i class='fas fa-star' style='color:orange; float:left;'></i>"
								}
							else if(this.score == 3) {
								score = "<i class='fas fa-star' style='color:orange; float:left;'></i><i class='fas fa-star' style='color:orange; float:left;'></i></i><i class='fas fa-star' style='color:orange; float:left;'></i>"
								}
							else if(this.score == 4) {
								score = "<i class='fas fa-star' style='color:orange; float:left;'></i><i class='fas fa-star' style='color:orange; float:left;'></i></i><i class='fas fa-star' style='color:orange; float:left;'></i></i><i class='fas fa-star' style='color:orange; float:left;'></i>"
								}
							else if(this.score == 5) {
								score = "<i class='fas fa-star' style='color:orange; float:left;'></i><i class='fas fa-star' style='color:orange; float:left;'></i></i><i class='fas fa-star' style='color:orange; float:left;'></i></i><i class='fas fa-star' style='color:orange; float:left;'></i></i><i class='fas fa-star' style='color:orange; float:left;'></i>"
								}
							console.log(this);
							console.log(this.e_datetime);
							var date = new Date(this.e_datetime);
							function getFormatDate(date){
								var year = date.getFullYear();
								var month = (1 + date.getMonth());
								month = month >= 10 ? month : '0' + month;
								var day = date.getDate(); 
								day = day >= 10 ? day : '0' + day;
								var hour = date.getHours();
								var min = date.getMinutes();
								return  year + '/' + month + '/' + day + ', ' + hour + ':' + min;
							}
							var login_email= "<%=session.getAttribute("login_email")%>";
							var delete_button = "";
							if (login_email == this.writer_email) {
								delete_button = "<a href='Delete?e_no=" + this.e_no + "' style='color:red; font-size:15px; float:right;' title='삭제하기'><i class='fas fa-trash-alt'></i></a>";
								}
							date = getFormatDate(date);
							console.log(date);

							str +=	"<input type=" + "'hidden'" + "class=" + "'scrolling'" + "data-e_no=" + this.e_no + " value=" + this.e_no + ">"
								+	"<article class='post'>"
								+	"<header>"
								+	"<div class='title' style='padding-top: 60px;'>"
								+	"<h2><a href='/search/journalistDetails?j_no=" + this.j_no + "' title='기자 상세페이지로 이동'>" + this.name + "</a> 기자</h2>"
								+	"<p style='font-size:15px;'>" + this.press + ", 평균 평점 : " + this.total_score + "</p>"
								+	"</div>"
								+	"<div class='meta' style='padding-top: 20px;'>"
								+	"<p style='font-size:15px; color:black;'>" + date + "</p>"
								+	"<a class='author'> <img width='45px' height='55px' class='img-fluid rounded-circle align-self-center' src='/resources/images/profile/"+this.m_no+".jpg' onError=this.src='/resources/images/profile/default.jpg'>"+"<span class='name'>" + this.writer_name + "</span>" + "</a>"
								+	"</div>"
								+	"</header>"
								+	"LINK : <a style='color:#0040FF; font-size:20px;' href='" + this.trackback +"' target='_blanck'>" + this.articletitle + "</a>"
								+	"<br/>"
								+	"<p> </p>"
								+	"<p style='color:black;'>" + this.evaluation + "</p>"
								+	delete_button
								+	score
								+	"<br/>"
								+	"<footer>"
								+	"<ul class='actions'>"
								+	"<li></li>"
								+	"</ul>"
								+	"<ul class='stats'>"
								+	button
								+	"<a style='color:#6E6E6E; font-size:10pt; font-weight: bolder;'>like  </a>"
								+	"<a id='like_count"+ this.e_no + "'>" + this.like + "</a><a style='color:#6E6E6E; font-size:10pt; font-weight: bolder;'> </a> "
								+	"<a class='icon solid fa-comment' onclick='listview("+this.e_no+")' style='color:#6E6E6E; font-size:10pt; font-weight: bolder;''>comment "+this.recnt+" </a>"
								+	"</ul>"
								+	"</footer>"
								+	"<div id='replytext"+this.e_no+"' style='width: 700px; display: none;'>"		
								+	"<br>"
								+	"<textarea rows='2' cols='60' id='ere_text"+this.e_no+"' placeholder='댓글을 입력하세요.'></textarea>"
								+	"<br>"	
								+	"<button type='button' id='btnEreply' class='button' onclick='inserttext("+this.e_no+")'>댓글 작성</button>"
				      			+	"<div id='listEreply"+this.e_no+"' class='example01'  ></div>"
						 		+ 	"</div>"
						 		+ 	"</article>";
							
					 		
					});			
					$(".layer_center").append(str);
				
				}
				else{ 
					alert("더 불러올 데이터가 없습니다.");
				}

			}
		});
		
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

$(document).ready(function(){
    $(window).scroll(function () {
           if ($(this).scrollTop() > 50) {
               $('#back-to-top').fadeIn();
           } else {
               $('#back-to-top').fadeOut();
           }
       });
       // scroll body to 0px on click
       /*
       $('#back-to-top').click(function () {
           $('#back-to-top').tooltip('hide');
           return false;
       });
       $('#back-to-top').tooltip('show');
       */
});

</script>

