<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- Header -->
<header id="header">
	<h1>
		<a href="${contextPath}/">Journalista</a>
	</h1>
	<nav class="links">
		<ul>
			<li><a href="/eboard/listPage">eboard</a></li>
			<li class="nav-item dropdown">
 				<a class="dropdown-toggle" type="text" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">기자DB</a>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    				<a class="dropdown-item" href="/search/journalistSearch">기자정보</a>
   					<a class="dropdown-item" href="#">언론사정보</a>
  				</div>
			</li>
			<li><a href="/wrboard/listPage">건의게시판</a></li>
			<c:if test="${member.auth=='9'}">
			<li><a href="/admin/memberPage">ADMIN</a></li>
			</c:if>
		
		</ul>
	</nav>
	<nav class="main">
		<ul>
			<li class="search"><a class="fa-search" href="#search">Search</a>
				<form id="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form></li>
			<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
			<c:if test="${member.name==null}">
			<li class="login"><a class="fa-sign-in-alt" href="/member/login">Login</a></li>
			</c:if>
			<c:if test="${member.name!=null}">
			  <li class="search nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
    <div class="dropdown-menu">
      <div class="dropdown-item-text"> ${member.name} 님</div>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="../member/mypage"><i class="far fa-id-card"></i> My Page</a>
      <a class="dropdown-item" href="../member/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
  </li>
	
			</c:if>
		</ul>
	</nav>
</header>

<!-- Menu -->
<section id="menu">

	<!-- Search -->
	<section>
		<form class="search" method="get" action="#">
			<input type="text" name="query" placeholder="Search" />
		</form>
	</section>

	<!-- Links -->
	<section>
		<ul class="links">
			<li><a href="#">
					<h3>Comment</h3>
					<p>사용자들이 올린 한줄평들을 모아서 보기</p>
			</a></li>
			<li><a href="#">
					<h3>Junalist</h3>
					<p>기자 검색</p>
			</a></li>
			<li><a href="#">
					<h3>Board</h3>
					<p>기타 게시판</p>
			</a></li>
			<li><a href="#">
					<h3>Rank</h3>
					<p>조회순, 평점순, 좋아요 순으로 기자와 사용자들의 랭킹</p>
			</a></li>
		</ul>
	</section>

	<!-- Actions -->
	<c:if test="${member.name==null}">
	<section>
		<ul class="actions stacked">
			<li><a href="../member/login" class="button large fit">Log In</a></li>
		</ul>
	</section>
	</c:if>
	<c:if test="${member.name!=null}">
	<section>
		<ul class="actions stacked">
			<li><a href="../member/logout" class="button large fit">Log Out</a></li>
		</ul>
	</section>	
	</c:if>
</section>