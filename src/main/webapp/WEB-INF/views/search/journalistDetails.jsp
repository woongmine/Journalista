<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	
<style type="text/css">

		#node1
		{
		}
		
		#node2
		{
			float: left;
			width: 300px;
		}
		
		#node3, #node4, #node5, #node6, #node7
		{
			float: left;
			width: 650px;
			height: 50px;
		}

	</style>
	
<div class="card">
	
	<h3 class="card-header">${journalistDetail.journal_name}기자 </h3>
	
	<div class="card-body">
		<div id="node1">
			<div id="node2"><img alt="머머리" src="${contextPath}/resources/images/bald.jpg" class="rounded-circle"></div><!-- #node3 end -->
			<div id="node3">이메일 : ${journalistDetail.journal_email}</div><!-- #node4 end -->
			<div id="node4">소속 : ${journalistDetail.press}</div><!-- #node6 end -->
			<div id="node5">평점 평균 : ${journalistDetail.total_score}</div><!-- #node7 end -->
			<div id="node6">트위터 : ${journalistDetail.journal_twit}</div><!-- #node8 end -->
			<div id="node7">페이스북 : ${journalistDetail.journal_facefook}</div><!-- #node9 end -->
		</div>
	</div>
	<div>
		<div>&nbsp;&nbsp;최근 게시물</div><br>
		<table>
		<tr>
			<th>한줄평</th>
			<th>주소</th>
			<th>평점</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${journalistDetailsSub}" var="journalistDetailContents">
		<tr>
			<td>${journalistDetailContents.evaluation}</td>
			<td><a href="${journalistDetailContents.trackback}" target="_blank">기사링크</a></td>
			<td>${journalistDetailContents.score}</td>
			<td><fmt:formatDate value="${journalistDetailContents.e_datetime}" pattern="yyyy.MM.dd" /></td>
		</tr>
		</c:forEach>
		</table>
	</div>
	<input type="button" value="뒤로가기" onclick="history.back(-1);">

</div>