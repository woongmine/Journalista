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
</head>
	<div id="wrapper" style="padding-left:2px;">
		<tiles:insertAttribute name="header" />
		<div id="main">
		<tiles:insertAttribute name="body"/>
		</div>
		<tiles:insertAttribute name="nav"/>
	</div>
<script src="${contextPath}/resources/assets/js/browser.min.js"></script>
<script src="${contextPath}/resources/assets/js/breakpoints.min.js"></script>
<script src="${contextPath}/resources/assets/js/util.js"></script>
<script src="${contextPath}/resources/assets/js/main.js"></script>
</html>
