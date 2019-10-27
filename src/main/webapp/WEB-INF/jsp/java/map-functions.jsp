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
Map interface in java 8 has introduced some new functions.Let's see them
one by one through example.<br>
Suppose there is a list of words coming through file and we want to check
frequency of each word and save in map.<br>
Before java8 we have following function which can solve this problem:
<pre><code class="java">
//Before java 8
public static void findFrequency(List&lt;String&gt; words) {
		Map&lt;String,Integer&gt; map = new HashMap&lt;&gt;();
		for(String word : words) {
			if(map.get(word)==null) {
				map.put(word, 1);
			}
			else {
				map.put(word, map.get(word)+1);
			}
		}
		System.out.println(map);
	}
</code></pre>
As we can clearly see that If there is no mapping for the given word, we have
to first map it and then increment the value for each word in else statement.
We can solve this requirement in more concisely and in short with java 8.<br>
<!-- Example of computeIfPresent method can also be seen<a href="/java/computIfAbsentExample">here</a> -->
<pre><code class="java">
// java 8
public static void findFrequency(List&lt;String&gt; words) {
	Map&lt;String,Integer&gt; map = new HashMap&lt;&gt;();
	words.forEach(word->{
	map.putIfAbsent(word, 0);
	map.computeIfPresent(word, (w,prev)->prev+1);
});
	System.out.println(map);
	}
</code></pre>
As we can see again although the if-else statement is not required here.But before applying
computeIfPresent we have to check the key already exist.We can do this operation more concisely
using compute() method.<!-- Examples of compute method can also be seen <a href="/java/compute">here</a> -->
<pre><code class="java">
public static void findFrequency(List&lt;String&gt; words) {
	Map&lt;String,Integer&gt; map = new HashMap&lt;&gt;();
	words.forEach(word->{
	map.compute(word, (k,v)->v==null?1:v+1);
	});
	System.out.println(map);
}
</code></pre>
Again we can see that although this code solves our problem. But we have to use a ternary operator
which is same like if-else which checks if key is not present then counts as 1 otherwise increment
value by 1. Let's check our last method merge() from Map interface.
<!-- Examples of merge method can also be seen <a href="/java/merge">here</a> -->
<pre><code class="java">
public static void findFrequency(List&lt;String&gt; words) {
	Map&lt;String,Integer&gt; map = new HashMap&lt;&gt;();
	words.forEach(word->{
	map.merge(word,1, (prev,a)->prev+a);
	});
	System.out.println(map);
}
</code></pre>
We can see that in merge method if the specified key is not already associated with a value or is 
associated with null,it associates with given non-null value.Otherwise,it replaces the associated 
value with the results of the given remapping function.It removes the key if the value is still
null.Default implementation of merge function is given below:
<pre><code class="java">
 V oldValue = map.get(key);
 V newValue = (oldValue == null) ? value :
              remappingFunction.apply(oldValue, value);
 if (newValue == null)
     map.remove(key);
 else
     map.put(key, newValue);
</code></pre>
		</div>
	</div>
</body>
</html>