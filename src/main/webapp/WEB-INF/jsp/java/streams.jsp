<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/header.jsp" />
<link rel="stylesheet" href="/css/default.css">
<script src="/js/highlight.pack.js"></script>
<script>
	hljs.initHighlightingOnLoad();
</script>
<script src="jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>Streams</title>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/java.jsp" />
		</div>
		<div class="maincontent">
Stream is an interface and basically represents a stream of data.We can
convert collections into stream and stream into collections and get desired
results. Operations performed through streams are very fast and optimized.
Although we encourage to use stream over collections but use it judiciously.
We can take more advantage if we use it properly.<br>
A stream pipeline consists of a source stream followed by zero or more
intermediate operations and one terminal operation.<br>
Each intermediate operation transforms the stream in some way,
like mapping each element to another,filtering elements etc.<br>
In java.util.stream package there is a generic Stream interface and three
specific primitive versions of this which all extends BaseStream interface:-<br>
IntStream,LongStream &amp; DoubleStream.<br>
Here are some examples with most commonly used functions:-<br>
Examples of method allMatch, anyMatch &amp; filter which takes Predicate as argument
can be seen <a href="/java/pattern-matching">here</a>
		</div>
		<div class="right">
		<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
		</script>
		</div>
	</div>
</body>
</html>