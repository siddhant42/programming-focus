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
<title>Method Reference</title>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/java.jsp" />
		</div>
		<div class="maincontent">
We use lambda expressions to create anonymous methods. Sometimes, however, 
a lambda expression does nothing but call an existing method. In those cases, 
it's often clearer to refer to the existing method by name. Method references 
enable you to do this; they are compact, easy-to-read lambda expressions for 
methods that already have a name.<br>
<h3>Kinds of Method References</h3>
There are 4 kinds of method references:
<table border="1">
<tbody>
<tr>
<td><strong>Kind</strong></td>
<td><Strong>Example</Strong></td>
</tr>
<tr>
<td>Static method reference</td>
<td>Integer::parseInt</td>
</tr>
<tr>
<td>Reference to an instance method of a particular object	</td>
<td>String::toLowerCase</td>
</tr>
<tr>
<td>Reference to an instance method of an arbitrary object of a particular type	</td>
<td>String::compareToIgnoreCase</td>
</tr>
<tr>
<td>Reference to a constructor	</td>
<td>TreeMap&lt;K,V&gt;::new</td>
</tr>
</tbody>
</table>
<h4>Static Method Reference</h4>
		</div>
		<div class="right">
		<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
		</script>
		</div>
	</div>
</body>
</html>