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
<title>weak-references</title>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/java.jsp" />
		</div>
		<div class="maincontent">
			Before starting for weak references Let's start with what we mean
			with strong references.
			<h2>Strong References:</h2>
			Strong references are references are ordinary java references. which
			we use daily.For example-<br>
			<pre>
				<code class="java">
String str = "java";
</code>
			</pre>
			creates a String object and stores a strong reference to it in the
			variable str.The important part about strong references -- the part
			that makes them "strong" -- is how they interact with the garbage
			collector. Specifically, if an object is reachable via a chain of
			strong references (strongly reachable), it is not eligible for
			garbage collection. As we don't want the garbage collector destroying
			objects we're working on, this is normally exactly what we want.<br>
			<h3>Problem with Strong Reference:</h3>
			One common problem with strong references is caching. Cache are used
			for ease and faster access. But if we are storing a lot of large
			objects in the cache then program may get outOfMemory error. Although
			most of the entries may not have the live key references.<br>
			Take an example of HashMap. If we are storing large objects in huge
			amount It may get outOfMemory one time. Because all the entries have
			strong references. Although all the entries may not been using at the
			same time.<br> With ordinary strong references, though, that
			reference itself will force the entry to remain in memory, which
			requires we (as a programmer) to somehow determine when the entry is
			no longer needed in memory and remove it from the cache, so that it
			becomes eligible for garbage collection.Hence,we are forced to
			duplicate the behavior of the garbage collector and manually
			determine whether or not an object should be in memory.
			<h2>Weak References:</h2>
			A weak reference is a reference that isn't strong enough to force an
			object to remain in memory. Weak references allow us to leverage the
			garbage collector's ability to determine reachability for us, so we
			don't have to do it ourself. <br>
		</div>
		<div class="right">
		<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
		</script>
		</div>
	</div>
</body>
</html>