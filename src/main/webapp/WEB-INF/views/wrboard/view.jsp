<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% int max = (int) session.getAttribute("max");%>
<% int min = (int) session.getAttribute("min");%>
<html>
<head>
<script>
	$(document).ready(function(){
		
		listReply2();
		
		//댓글 쓰기 
		$("#btnReply").click(function(){
			var re_text=$("#re_text").val();
			var wr_no="${view.wr_no}";
			if(re_text == ""){
				alert("입력할 댓글이 없습니다.");
			}else{
			var param={
					re_text : re_text,
					wr_no : wr_no					
			};			
			$.ajax({
				type: "post",
				url: "${path}/reply/insert",
				data: param,
				success: function(){
					listReply2();
				}
			});	
			}
		});
	});
	
	//댓글 목록2
	function listReply2(){
		var userId= "<%=session.getAttribute("userId")%>";
		console.log(userId);
		$.ajax({
					type : "get",
					url : "${path}/reply/listJson?wr_no=${view.wr_no}",
					success : function(result) {
						var output = "<table>";
						for ( var i in result) {
							if (result[i].email == userId) {
								console.log(userId);
								console.log(result[i].email);
								output += "<tr>";
								output += "<td>";
								output += "<div class='media'>";
								output += "<img width='45px' height='55px' class='img-fluid rounded-circle' src='/resources/images/profile/"+result[i].m_no+".jpg'"
								output += "onError=this.src='/resources/images/profile/default.jpg'>";
								
								output += "&nbsp; &nbsp; &nbsp;<div class='media-boby' style='color:#6E6E6E; font-size:10pt; '>" + "<a style='color:#6E6E6E; font-size:11pt; font-weight: bolder;'>"+result[i].name
										+ "</a>";
								output += " / " + changeDate(result[i].regdate)
										+ "<br>";
								output += result[i].re_text + "</div>"
								
								output += "<td><a style='color:#6E6E6E; font-size:13pt;'class='far fa-trash-alt' onClick='javascript:replydelete("
										+ result[i].re_no
										+ ")'></a></td>";
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
								output += result[i].re_text + "</div>"
								output += "</div>";
								output += "</td>";
								output += "</tr>";
							
							}
						}
						output += "</table>";
						$("#listReply").html(output);
					}
				});

	}


	//댓글 수정
	function replyupdate(re_no) {
		console.log(re_no);
		location.href = "${path}/reply/replyupdate?re_no=" + re_no;
	}

	//댓글 삭제
	function replydelete(re_no) {
		var param = {
			re_no : re_no
		};
			$.ajax({
				type : "post",
				url : "${path}/reply/replydelete",
				data : param,
				success : function() {
					listReply2();
				}
			});
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

	function delpageCheck() {
		var del = $('#delcheck').val();
		if (del == 1) {
			alert("삭제된 글입니다.");
			location.href = '/wrboard/listPage?num=1';
		}
	}

	function checkmodify() {
		var loginemail = $('#loginemail').val();
		var writeremail = $('#writeremail').val();
		if (loginemail != writeremail) {
			alert("본인만 게시물을 수정할 수 있습니다.");
			return false;
		}
	}

	//function checkdrop(){
	//	var loginemail = $('#loginemail').val();
	//	var writeremail = $('#writeremail').val();
	//	if (loginemail != writeremail){
	//		alert("본인만 게시물을 삭제할 수 있습니다.");
	//		return false;
	//		}
	//	}

	function CheckNextPage() {
		var wr_no = $('#wr_no').val();
		var max = $('#max').val();
		if (wr_no == max) {
			alert("다음 글이 없습니다.");
			return false;
		}
	}

	function CheckPrePage() {
		var wr_no = $('#wr_no').val();
		var min = $('#min').val();
		if (wr_no == min) {
			alert("이전 글이 없습니다.");
			return false;
		}
	}
</script>
<title>게시물 보기</title>
</head>
<body onload="delpageCheck();">
	<form method="post">
		<input type="hidden" id="delcheck" value="${view.wr_del }" />
		<div>
			<label style="margin-bottom:0px;">제목</label> <div name="wr_title">${view.wr_title }</div><br/>
		</div>

		<div>
			<label style="margin-bottom:0px;">작성자</label> <div name="name">${view.name }</div><br/>
		</div>

		<div>
			<label style="margin-bottom:0px;">작성날짜</label> <div name="wr_datetime"><fmt:formatDate value="${view.wr_datetime}" pattern="yy.MM.dd-hh.mm.ss" /></div>
			<br/>
		</div>

		<div>
			<label style="margin-bottom:0px;">내용</label>
			<div style="height:100px;" name="wr_contents" readonly="readonly">${view.wr_contents}</div><br/>
		</div>

	</form>
	<div id="replytext" style="width: 650px;">
			
			<br>
			<c:if test="${member.name != null}">
				<textarea rows="2" cols="60" id="re_text" placeholder="댓글을 입력하세요."></textarea>
			
				<button type="button" class="button" id="btnReply">댓글 작성</button>
			</c:if>	
				<br>
				<br>
				
				<div id="listReply" class="example01" ></div>
	
		
	</div>
	
	<!-- <div id="listReply"></div> -->
	<form align="center" name="check">
		<!-- 	<table class="table" style="width: 60%" align="center">
		<thead class="thead-dark">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr scope="row">
					<td>${list.wr_no}</td>
					<td><a href="/wrboard/view?wr_no=${list.wr_no}">${list.wr_title}</a></td>
					<td>${list.name}</td>
					<td><fmt:formatDate value="${list.wr_datetime}"
							pattern="yy.MM.dd-hh:mm:ss" /></td>
					<td>${list.wr_hit}</td>
					<td><input type="hidden" name="name" id="name" value="${member.name}"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
 -->
<div style="float:center;">
		<input type="hidden" id="loginemail" value="${member.email }" /> 
		<input type="hidden" id="writeremail" value="${view.email }" /> 
		<input type="hidden" id="wr_no" value="${view.wr_no }" /> 
		<input type="hidden" id="max" value="<%=max%>" /> 
		<input type="hidden" id="min" value="<%=min%>" /> 
		<a href="/wrboard/past?wr_no=${view.wr_no}"
		onclick="return CheckPrePage();"><i class="fas fa-chevron-left"></i>이전글</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/wrboard/update?wr_no=${view.wr_no}"
		onclick="return checkmodify();">수정<i class="fas fa-edit"></i></a> &nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/wrboard/delete?wr_no=${view.wr_no}"
		onclick="return checkdrop();">삭제<i class="fas fa-trash-alt"></i></a> &nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/wrboard/listPage?num=1"> 목록보기<i class="fas fa-list"></i></a> &nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/wrboard/next?wr_no=${view.wr_no}" onclick="return CheckNextPage();">다음글<i class="fas fa-chevron-right"></i></a>
	</div>
		<br /> <a href="/">홈으로</a>
	</form>
	
</body>
</html>