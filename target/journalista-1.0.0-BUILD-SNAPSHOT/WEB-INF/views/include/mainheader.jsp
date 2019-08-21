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
			<li><a href="/eboard/eboardsearch">기자 검색</a></li>
			<li><a href="/wrboard/listPage">건의게시판</a></li>
			<li><a href="/admin/memberPage">관리자페이지</a></li>
			<li><a href="#">Adipiscing</a></li>
		</ul>
	</nav>
	<nav class="main">
		<ul>
			<li class="search"><a class="fa-search" href="#search">Search</a>
				<form id="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form></li>
			<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
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
					<h3>Lorem ipsum</h3>
					<p>Feugiat tempus veroeros dolor</p>
			</a></li>
			<li><a href="#">
					<h3>Dolor sit amet</h3>
					<p>Sed vitae justo condimentum</p>
			</a></li>
			<li><a href="#">
					<h3>Feugiat veroeros</h3>
					<p>Phasellus sed ultricies mi congue</p>
			</a></li>
			<li><a href="#">
					<h3>Etiam sed consequat</h3>
					<p>Porta lectus amet ultricies</p>
			</a></li>
		</ul>
	</section>

	<!-- Actions -->
	<section>
		<ul class="actions stacked">
			<li><a href="#" class="button large fit">Log In</a></li>
		</ul>
	</section>

</section>