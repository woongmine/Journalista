<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
@import url("https://fonts.googleapis.com/css?family=Lato:400,400i,700");

body {
  margin: 0;
  font-family: 'Lato', sans-serif;
}

.header {
  min-height: 30vh;
  background: #009FFF;
background: linear-gradient(to right, #ec2F4B, #009FFF);
  color: white;
  clip-path: ellipse(100vw 60vh at 50% 50%);
  display: flex;
  align-items: center;
  justify-content: center;
}
.details {
  text-align: center;
}

.profile-pic {
  height: 6rem;
  width: 6rem;
  object-fit: center;
  border-radius: 50%;
  border: 2px solid #fff;
}

.email p {
  display: inline-block;
}

.location svg {
  vertical-align: middle;
}

.stats {
  display: flex;
}

.stats .col-4 {
  width: 10rem;
  text-align: center;
}

.heading {
  font-weight: 400;
  font-size: 25px;
  margin: 1rem 0;
}

  </style>
  <title>마이페이지</title>
<!-- Content Wrapper. Contains page content -->
<section class="profile">
  <header class="header">
    <div class="details">
      <img src="https://www.w3schools.com/howto/img_avatar.png" alt="profile" class="profile-pic">
      <form action="../member/update/" method="get">
      <h1 class="heading">${member.name} <button type="submit" class="btn-sm btn-info">수정</button></h1>
      </form>
      <div class="email">

        <p>${member.email}</p>
      </div>
      <div class="stats">
        <div class="col-4">
          <h4>20</h4>
          <p>받은 좋아요</p>
        </div>
        <div class="col-4">
          <h4>10</h4>
          <p>내가 남긴 글</p>
        </div>
        <div class="col-4">
          <h4>100</h4>
          <p>Discussions</p>
        </div>
      </div>
    </div>
  </header>
</section>
여기에 댓글들 표시

<!-- /.content-wrapper -->