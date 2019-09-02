<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<script> 

	function press(f){
		if(f.keyCode == 13){ //javascript에서는 13이 enter키를 의미함
			keyword.submit(); //formname에 사용자가 지정한 form의 name입력 } 
		} 
	}
	
</script>


<!-- Header -->
<header id="header">
	<h1>
		<a href="${contextPath}/">Journalista</a>
	</h1>
	<nav class="links">
		<ul>
			<li><a href="/eboard/listPage">comment</a></li>
			<li class="nav-item dropdown">
 				<a class="dropdown-toggle" type="text" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">journalist</a>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    				<a class="dropdown-item" href="/search/journalistSearch">Journalist</a>
   					<a class="dropdown-item" href="/search/pressSearch">Press</a>
  				</div>
			</li>
			<li><a href="/wrboard/listPage">board</a></li>
			<c:if test="${member.auth >= '8'}">
			<li><a href="/admin/memberPage">ADMIN</a></li>
			</c:if>
		
		</ul>
	</nav>
	<nav class="main">
		<ul>
			<li class="search"><a class="fa-search" href="#search">Search</a>
				<form id="search" method="get" action="/search/totalSearch">
					<input type="text" name="keyword" id="keyword" placeholder="Search" onkeypress="JavaScript:press(this.form)"/>
				</form></li>
			<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
			<c:if test="${member.name==null}">
			<li class="login"><a class="fa-sign-in-alt" href="/member/login">Login</a></li>
			</c:if>
			<c:if test="${member.name!=null}">
			  <li class="search nav-item dropdown">
			  
    <div class="nav-link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img width="45px" height="55px" class="img-fluid rounded-circle" src="/profile/${member.m_no}.jpg" onError="this.src='/profile/default.jpg';" alt="${member.name}"></div>
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
		<form class="search" method="get" action="/search/totalSearch">
			<input type="text" name="keyword" id="keyword" placeholder="Search" onkeypress="JavaScript:press(this.form)"/>
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