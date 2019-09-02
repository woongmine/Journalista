<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
<section id="sidebar" style="width:400px; margin-left: 10px;">
	<section>
		<div class="card" style="width: 18rem;">
		 <img id="myImage" width="150px" height="150px" class="rounded-circle mx-auto" src="/profile/${member.m_no}.jpg" onError="this.src='/profile/default.jpg';" alt="${member.name}">
		  <div class="card-body">
		    <h5 class="card-title">${member.name}</h5>
		    <p class="card-text">${member.email}</p>
		  </div>
		  <ul class="list-group list-group-flush">
		    <li class="list-group-item">내가 쓴 글</li>
		    <li class="list-group-item">받은 좋아요</li>
		  </ul>
		  <div class="card-body">
		    <a href="#" class="card-link">임시링크</a>
		    <a href="#" class="card-link">임시 link</a>
		  </div>
		</div>
	</section>


</section>

<!-- /.content-wrapper -->