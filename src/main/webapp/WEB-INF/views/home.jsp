<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<h1>메인페이지</h1>


<!-- 로그인을 안했을 경우에는 로그인이 필요하다고 나옴 -->

<!-- 로그인을 했을 경우 사용자 이름이 나옴 -->
<c:if test="${member.name!=null}">
<p>${member.name}님 환영합니다.</p>
<form role="form" method="get" autocomplete="off" action="../member/logout">	
	<button type="submit" class="btn btn-dark">로그아웃</button>
</form>
</c:if>