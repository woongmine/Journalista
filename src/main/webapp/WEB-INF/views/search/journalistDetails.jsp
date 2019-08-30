<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	
<!-- Post -->
<article class="post">
	<header>
		<div class="title">
			<h2><a href="single.html">Magna sed adipiscing</a></h2>
			<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>
		</div>
		<div class="meta">
			<time class="published" datetime="2015-11-01">November 1, 2015</time>
			<a href="#" class="author"><span class="name">Jane Doe</span><img src="images/avatar.jpg" alt="" /></a>
		</div>
	</header>
	<a href="single.html" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
	<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
	<footer>
		<ul class="actions">
			<li><a href="single.html" class="button large">Continue Reading</a></li>
		</ul>
		<ul class="stats">
			<li><a href="#">General</a></li>
			<li><a href="#" class="icon solid fa-heart">28</a></li>
			<li><a href="#" class="icon solid fa-comment">128</a></li>
		</ul>
	</footer>
</article>