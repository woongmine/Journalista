<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<tiles:insertAttribute name="top" />
<html>
<head>
<title>Journalista</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${contextPath}/resources/assets/css/main.css" />
	<style type="text/css">

        .sspinner-border {position:absolute; top:-4px; left:0; z-index:99;  background:rgba(0, 0, 0, 0.5);}
        .loading strong {display:block; position:relative; top:50%; margin:-75px auto 0 auto; width:200px; height:50px; padding:0 30px;

        border-radius: 10px;

        -webkit-border-radius: 10px;

        -moz-border-radius: 10px;

		box-sizing:border-box;

        background:#fff;

        color:#000; font-size:16px; line-height:50px; text-align:center;

        }

    </style>
</head>
	<div id="wrapper" style="padding-left:2px;">
		<tiles:insertAttribute name="header" />
		<div id="main">
		<tiles:insertAttribute name="body"/>
		</div>
		<tiles:insertAttribute name="nav"/>
	</div>
	<div class="spinner-border" style="position:absolute; top:50%; left:50%;" role="status">
  <span class="sr-only">Loading...</span>
</div>
<div class="spinner-border text-primary" role="status">
  <span class="sr-only">Loading...</span>
</div>
<script src="${contextPath}/resources/assets/js/browser.min.js"></script>
<script src="${contextPath}/resources/assets/js/breakpoints.min.js"></script>
<script src="${contextPath}/resources/assets/js/util.js"></script>
<script src="${contextPath}/resources/assets/js/main.js"></script>
<script type="text/javascript">

		$(document).ready(function() {

		    $('.spinner-border').show();

		});

		 

		$(window).on('load', function() {

		    $('.spinner-border').hide();

		});

</script>
</html>
