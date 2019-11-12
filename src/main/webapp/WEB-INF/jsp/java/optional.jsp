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
<title>Optional</title>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/java.jsp" />
		</div>
		<div class="maincontent">
			With using Optional class null-reference has become very much
			easey and manageable.Optional class holds a generic
			placeholder for the class for which we will be getting object.
			But as the name suggests it is optional means it may or may not
			contain real objects.There are 3 static methods in Optional using
			which we can create optional object.
<pre><code class="java">
Optional&lt;Integer&gt; i1 = Optional.empty();
</code></pre>
			It will create an empty optional class, means it will not contain
			any object for holding class (here its Integer class).<br>
<pre><code class="java">
Integer i2 = new Integer(5);
Optional&lt;Integer&gt; op1 = Optional.of(i2);
</code></pre>
			well what is advantage here using Optional? when we will be getting
			the value of op1 using op.get() it will through NullPointerException
			if i2 will be null.
<pre><code class="java">
public class Test {
	static Integer sum(Optional&lt;Integer&gt; a,Optional&lt;Integer&gt; b) {
		return Integer.sum(a.orElse(0),b.orElse(0));
	}
	public static void main(String[] args) {
		Integer value1 = null;
		Integer value2 = 5;
		Optional&lt;Integer&gt; v1 = Optional.ofNullable(value1);
		Optional&lt;Integer&gt; v2 = Optional.ofNullable(value2);
		Optional&lt;Integer&gt; v3 = Optional.empty();
		System.out.println(sum(v1,v2));	// output- 5
		System.out.println(sum(v2,v3));	// output- 5
	}
}
</code></pre>
Optional.ofNullable can take null values as arguments without throwing
any exception. Here orElse method is used in calculating sum of two integers.
orElse method is used to set default value if the value of the optional reference
is empty or not present which can be checked using <code>Optional.isPresent()</code>
method.
<h3>Example of isPresent() method</h3>
isPresent() method is used to check if some object is present or not corresponding 
to holding reference type.
<pre><code class="java">
Integer i1 = null;
Optional&lt;Integer&gt; op1 = Optional.ofNullable(i1);
System.out.println(op1.isPresent())	// false

Integer i2 = new Integer(6);
op1 = Optional.ofNullable(i2);
System.out.println(op1.isPresent())	// true

op1 = Optional.empty();
System.out.println(op1.isPresent())	//false
</code></pre>
<h3>Example of get() and orElse() methods</h3>
get method is used to get the value of object containing the holding reference.
orElse method is used to set some default value if the value of the holding
reference is empty. example of orElse can be seen above in sum() method.
<pre><code class="java">
Integer i1 = new Integer(5);
Optional&lt;Integer&gt; op1 = Optional.of(i1);
System.out.println(op1.get())	// 5
</code></pre>
<h3>Example of ifPresent() method</h3>
ifPresent() method takes consumer as an argument which will be executed only if there
is some value present in the holding reference of optional. otherwise it will be 
empty and will not through any exception.
<pre><code class="java">
Integer i1 = new Integer(2);
Integer i2 = null;
Optional&lt;Integer&gt; op1 = Optional.ofNullable(i1);
Optional&lt;Integer&gt; op2 = Optional.ofNullable(i2);
op1.ifPresent(x->System.out.println(x));	// output- 2
//using method reference
op1.ifPresent(System.out::println);
op2.ifPresent(System.out::Println);	// will not print anything
</code></pre>
There are 3 more methods map,filter &amp; flatmap whose functionality works same as 
we have used in <a href="/java/streams">Streams</a>
		</div>
		<div class="right">
		<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
		</script>
		</div>
	</div>
</body>
</html>