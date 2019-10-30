<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" 
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
<title>Programming-focus</title>
<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- 
	<spring:url value="/css/main.css" var="springCss" />
	<link href="${springCss}" rel="stylesheet" />
	 -->
<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />
	<script type="text/javascript"
		src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="container">
<div style="width:20%;float: left;">
<h2>Java</h2>
<jsp:include page="java.jsp" />
</div>
<div style="width:20%;float: left;">
<h2>Data Structures</h2>
<jsp:include page="data-structures.jsp" />
</div>
<div style="width:20%;float: left;">
<h2>Algorithms</h2>
<jsp:include page="algorithms.jsp" />
</div>
<div style="width:20%;float:right;">
<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
</script>
</div>
</div>
</body>

</html>
