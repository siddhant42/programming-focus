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
<title>Lambdas</title>
<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
</script>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/java.jsp" />
		</div>
		<div class="maincontent">
			Here is an example code which sort a list of string in order of
			length before java8.
<pre><code class="java">
// Before java8
List&lt;String&gt; words = Arrays.asList("Hello","world","this","is","java","programming");
Collections.sort(words, new Comparator&lt;String&gt;() {
public int compare(String s1, String s2) {
	return Integer.compare(s1.length(), s2.length());
	}
});
</code></pre>
			This code snippet is showing an implementation of anonymous
			classes.Although this is concrete implementation of anonymous
			class and fulfill the requirement of the problem.But the code
			is verbose which results in introducing new concept lambda
			expressions in java8.<br>
			In Java 8, the interfaces with a single abstract method are 
			special and deserve special treatment. These interfaces are
			now known as functional interfaces, and the language allows 
			to create instances of these interfaces using lambda expressions,
			or lambdas for short.Here is the example code for the same:<br>
<pre><code class="java">
// Lambda expression as function object (replaces anonymous class)
Collections.sort(words,
		(s1, s2) -> Integer.compare(s1.length(), s2.length()));
</code></pre>
			This code can be made shorter using <a href="/java/method-reference">Method Reference:</a><br>
<pre><code class="java">
Collections.sort(words, comparingInt(String::length));
</code></pre>
			This code even made more shorter and easier to understand using sort
			method of List interface:<br>
<pre><code class="java">
words.sort(comparingInt(String::length));
</code></pre>
		</div>
	</div>
</body>
</html>