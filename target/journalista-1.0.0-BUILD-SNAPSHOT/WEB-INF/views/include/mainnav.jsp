<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	
<!-- Sidebar -->
<section id="sidebar">

	<!-- Intro -->
	<!-- 
	<section id="intro">
		<a href="#" class="logo"><img src="${contextPath}/resources/images/logo.jpg" alt="" /></a>
		<header>
			<h2>Future Imperfect</h2>
		</header>
	</section>
 	-->
	<!-- Mini Posts -->
	<section>
		<div class="mini-posts">

			<!-- Mini Post -->
			<article class="mini-post">
				<header>
					<h3>
						<a href="single.html">Vitae sed condimentum</a>
					</h3>
					<time class="published" datetime="2015-10-20">October 20,
						2015</time>
					<a href="#" class="author"><img src="${contextPath}/resources/images/avatar.jpg" alt="" /></a>
				</header>
				<a href="single.html" class="image"><img src="${contextPath}/resources/images/pic04.jpg"
					alt="" /></a>
			</article>

			<!-- Mini Post -->
			<article class="mini-post">
				<header>
					<h3>
						<a href="single.html">Rutrum neque accumsan</a>
					</h3>
					<time class="published" datetime="2015-10-19">October 19,
						2015</time>
					<a href="#" class="author"><img src="${contextPath}/resources/images/avatar.jpg" alt="" /></a>
				</header>
				<a href="single.html" class="image"><img src="${contextPath}/resources/images/pic05.jpg"
					alt="" /></a>
			</article>

			<!-- Mini Post -->
			<article class="mini-post">
				<header>
					<h3>
						<a href="single.html">Odio congue mattis</a>
					</h3>
					<time class="published" datetime="2015-10-18">October 18,
						2015</time>
					<a href="#" class="author"><img src="${contextPath}/resources/images/avatar.jpg" alt="" /></a>
				</header>
				<a href="single.html" class="image"><img src="${contextPath}/resources/images/pic06.jpg"
					alt="" /></a>
			</article>

			<!-- Mini Post -->
			<article class="mini-post">
				<header>
					<h3>
						<a href="single.html">Enim nisl veroeros</a>
					</h3>
					<time class="published" datetime="2015-10-17">October 17,
						2015</time>
					<a href="#" class="author"><img src="${contextPath}/resources/images/avatar.jpg" alt="" /></a>
				</header>
				<a href="single.html" class="image"><img src="${contextPath}/resources/images/pic07.jpg"
					alt="" /></a>
			</article>

		</div>
	</section>

	<!-- Posts List -->
	<section>
		<ul class="posts">
			<li>
				<article>
					<header>
						<h3>
							<a href="single.html">Lorem ipsum fermentum ut nisl vitae</a>
						</h3>
						<time class="published" datetime="2015-10-20">October 20,
							2015</time>
					</header>
					<a href="single.html" class="image"><img src="${contextPath}/resources/images/pic08.jpg"
						alt="" /></a>
				</article>
			</li>
			<li>
				<article>
					<header>
						<h3>
							<a href="single.html">Convallis maximus nisl mattis nunc id
								lorem</a>
						</h3>
						<time class="published" datetime="2015-10-15">October 15,
							2015</time>
					</header>
					<a href="single.html" class="image"><img src="${contextPath}/resources/images/pic09.jpg"
						alt="" /></a>
				</article>
			</li>
			<li>
				<article>
					<header>
						<h3>
							<a href="single.html">Euismod amet placerat vivamus porttitor</a>
						</h3>
						<time class="published" datetime="2015-10-10">October 10,
							2015</time>
					</header>
					<a href="single.html" class="image"><img src="${contextPath}/resources/images/pic10.jpg"
						alt="" /></a>
				</article>
			</li>
			<li>
				<article>
					<header>
						<h3>
							<a href="single.html">Magna enim accumsan tortor cursus
								ultricies</a>
						</h3>
						<time class="published" datetime="2015-10-08">October 8,
							2015</time>
					</header>
					<a href="single.html" class="image"><img src="${contextPath}/resources//images/pic11.jpg"
						alt="" /></a>
				</article>
			</li>
			<li>
				<article>
					<header>
						<h3>
							<a href="single.html">Congue ullam corper lorem ipsum dolor</a>
						</h3>
						<time class="published" datetime="2015-10-06">October 7,
							2015</time>
					</header>
					<a href="single.html" class="image"><img src="${contextPath}/resources//images/pic12.jpg"
						alt="" /></a>
				</article>
			</li>
		</ul>
	</section>

	<!-- About -->
	<section class="blurb">
		<h2>About</h2>
		<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus
			nisl. Sed mattis nunc id lorem euismod amet placerat. Vivamus
			porttitor magna enim, ac accumsan tortor cursus at phasellus sed
			ultricies.</p>
		<ul class="actions">
			<li><a href="#" class="button">Learn More</a></li>
		</ul>
	</section>

</section>