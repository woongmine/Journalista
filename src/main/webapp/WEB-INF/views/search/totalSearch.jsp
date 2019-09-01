<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<style>

	.commentdetail {
		
		height: 130px;
		width: 450px;
	}

</style>

<div id="comment">
	<div><h2>&nbsp;&nbsp;COMMENT</h2></div>
	<c:choose>
	<c:when test="${fn:length(totalEboard)!=0}">
	<label>&nbsp;&nbsp;총 검색 결과 ${fn:length(totalEboard)} 건</label>
	<c:forEach items="${totalEboard}" var="eboard" begin="0" end="2">
		<hr style="margin: 10px;" width="50%">
		<div class="commentdetail">
			<div>&nbsp;&nbsp;한줄평 : ${eboard.evaluation}</div>
			<div>&nbsp;&nbsp;${eboard.name} 기자</div>
			<div>&nbsp;&nbsp;score : ${eboard.score}</div>
			<div>&nbsp;&nbsp;<a href="${eboard.trackback}">기사 링크</a></div>
		</div>
	</c:forEach>
	<hr style="margin: 10px;" width="50%">
	</c:when>
	<c:otherwise>
		<hr style="margin: 10px;" width="50%">
		<label>&nbsp;&nbsp;검색 결과가 없습니다.</label>
	</c:otherwise>
	</c:choose>
	<c:if test="${fn:length(totalEboard) > 4}">
		<a href="" style="text-align: right;">더 보기</a>
	</c:if>
</div>

<br>

<div id="journalist">
	<div><h2>&nbsp;&nbsp;JOURNALIST</h2></div>
	<c:choose>
	<c:when test="${fn:length(totalJournalist)!=0}">
		<label>&nbsp;&nbsp;총 검색 결과 ${fn:length(totalJournalist)} 건</label>
		<c:forEach items="${totalJournalist}" var="journalist" begin="0" end="2">
		<hr style="margin: 10px;" width="50%">
		<div class="journalistdetail">
			<div>&nbsp;&nbsp;이름 : <a href="journalistDetails?j_no=${journalist.j_no}">${journalist.journal_name}</a></div>
			<div>&nbsp;&nbsp;이메일 : ${journalist.journal_email}</div>
			<div>&nbsp;&nbsp;소속 : ${journalist.press}</div>
		</div>
	</c:forEach>
	<hr style="margin: 10px;" width="50%">
	</c:when>
	<c:otherwise>
		<hr style="margin: 10px;" width="50%">
		<label>&nbsp;&nbsp;검색 결과가 없습니다.</label>
	</c:otherwise>
	</c:choose>
	<c:if test="${fn:length(totalJournalist) > 4}">
		<a href="" style="text-align: right;">더 보기</a>
	</c:if>
</div>

<br>

<div id="board">
	<div><h2>&nbsp;&nbsp;BOARD</h2></div>
	<c:choose>
	<c:when test="${fn:length(totalWrboard)!=0}">
		<label>&nbsp;&nbsp;총 검색 결과 ${fn:length(totalWrboard)} 건</label>
		<c:forEach items="${totalWrboard}" var="board" begin="0" end="2">
		<hr style="margin: 10px;" width="50%">
		<div class="journalistdetail">
			<div>&nbsp;&nbsp;작성자 : ${board.name}</div>
			<div>&nbsp;&nbsp;제목 : ${board.wr_title}</div>
			<div>&nbsp;&nbsp;글내용 : ${board.wr_contents}</div>
		</div>
	</c:forEach>
	<hr style="margin: 10px;" width="50%">
	</c:when>
	<c:otherwise>
		<hr style="margin: 10px;" width="50%">
		<label>&nbsp;&nbsp;검색 결과가 없습니다.</label>
	</c:otherwise>
	</c:choose>
	<c:if test="${fn:length(totalWrboard) > 4}">
		<a href="" style="text-align: right;">더 보기</a>
	</c:if>
</div>