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
<title>Pattern Matching</title>
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
		<div class="contentview">
			<h2>Pattern Matching in java 8</h2>
Before java 8 pattern matching was done using two classes namely Pattern
and Matcher<br>
</div>
<pre><code class="java">
//Before java 8
List&lt;String&gt; words = 
	Arrays.asList("Hello","world","this","is","java","programming");
Pattern pattern = Pattern.compile(".*o.*");
for(String word:words) {
Matcher matcher = pattern.matcher(word);
if(matcher.matches()) {
	System.out.println("found match:"+word);
	}
}
</code></pre>
In java8 there is a method in Pattern class called asPredicate() which 
returns a Predicate reference.And there are 3 methods in stream interface 
anyMatch,allMatch and filter method which takes Predicate as argument.
and we can use this predicate on intermediate methods of Stream for
pattern matching. Let's see first example of filter() method to
filter out words on given patterns.
<pre><code class="java">
Predicate wordFilter = Pattern.compile(".*o.*").asPredicate();
List&lt;String&gt; filteredList = 
	words.stream().filter(wordFilter).collect(Collectors.toList());
filteredList.forEach(x->system.out.println(word));
</code></pre>
Here filter method is taking wordFilter predicate to filter the word list
and then converted into list and return.<br>
The above code can be written in one line using lambda and 
<a href="/java/method-reference">Method Reference</a>
<pre><code class="java">
words.stream().filter(Pattern.compile(".*o.*").
		asPredicate()).forEach(System.out::println)
</code></pre>
Let's see now example of anyMatch() method of stream interface.
<i>anyMatch</i> accepts an argument of <i>Predicate</i> functional interface which has
only one abstract method <i>test</i> and we can use lambda or  
<a href="/java/method-reference">method reference</a> for it:
<pre><code class="java">
Predicate wordFilter = Pattern.compile(".*o.*").asPredicate();
boolean isFound = words.stream().anyMatch(wordFilter);
System.out.println(isFound);
</code></pre>
The output of the code above:
<pre><code>true</code></pre>
The output suggest that there is a match found for given regex in the words stream.
Now let's see our last method <i>allMatch</i>.As the name suggests, this method will 
return true only if all the word strings in a stream matches with the given regex.
<pre><code class="java">
Predicate wordFilter = Pattern.compile(".*o.*").asPredicate();
boolean isFound = words.stream().allMatch(wordFilter);
System.out.println(isFound);
</code></pre>
The output of the code above:
<pre><code>true</code></pre>
The output suggests that all the words in the stream doesn't match with the regex pattern
formed using <i>Pattern</i> compiled predicate.
		</div>
	</div>
</body>
</html>