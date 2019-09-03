<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/">JOURNALISTA 관리자</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="/">Home <span class="sr-only">(current)</span></a>
	  <a class="nav-item nav-link" href="/admin/memberPage">회원관리</a>
	  <a class="nav-item nav-link" href="/admin/wrboardPage">기타게시판관리</a>
	  <a class="nav-item nav-link" href="/admin/addmember">회원 추가</a>
	  <a class="nav-item nav-link" href="/admin/lotto">당첨자 발표</a>
    </div>
  </div>
</nav>