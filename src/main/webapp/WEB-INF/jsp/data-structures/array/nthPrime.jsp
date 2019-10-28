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
<title>Unequal Length Median</title>
<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
</script>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/data-structures.jsp" />
		</div>
		<div class="maincontent">
   <h3>Find the nth Prime</h3>
<pre><code class="java">
public class NthPrime {
	public static void main(String[] args) {
		int n=180;
		int[] primes = new NthPrime().find(n);
		for(int i=0;i&lt;n;i++)
			System.out.println(primes[i]);
	}

	private int[] find(int n) {
		int[] primes = new int[n];
		int count=0;
		boolean flag=true;
		primes[count++]=2;
		for(int i=3;i&lt;Integer.MAX_VALUE;i+=2){
			if(count==n) return primes;
			flag = true;
			for(int j=0;j&lt;count;j++){
				int p = primes[j];
				if(p*p&lt;=i &amp;&amp; i%p==0){
					flag = false;
					break;
				}
			}
			if(flag) primes[count++]=i;
		}
		return primes;
	}
}

</code></pre>
		</div>
	</div>
</body>
</html>