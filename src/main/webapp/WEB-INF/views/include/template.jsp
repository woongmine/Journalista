<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <tiles:insertAttribute name="header" />
    <tiles:insertAttribute name="nav" />
    <div id="container">
       <tiles:insertAttribute name="body" ignore="true"/>
    </div>
    <tiles:insertAttribute name="footer" />
</body>
</html>
