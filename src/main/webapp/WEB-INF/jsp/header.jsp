<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" type="text/css" 
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/main.css">
	<c:url value="/css/main.css" var="jstlCss" />
	<link href="${jstlCss}" rel="stylesheet" />
</head>
<body>
<div class="topnav" id="myTopnav">
  <a href="/" class="active">Programming-focus</a>
  <a href="/">Home</a>
  <a href="/java">Java</a>
  <a href="/data-structures">Data Structures</a>
  <a href="/algorithms">Algorithms</a>
  <a href="#about">About</a>
</div>
</body>
</html>