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
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/data-structures.jsp" />
		</div>
		<div class="maincontent">
  
<pre><code class="java">
public class KthSmallest {
	public static void main(String[] args) {
		int[] a={3,5,8,15,21,25};
		int[] b={4,11,18,26,28};
		new KthSmallest().findSmallest(a,b,3);
	}

	private void findSmallest(int[] a, int[] b, int k) {
		 findSmallest(a,b,0,0,a.length-1,b.length-1,k);
	}

	private void findSmallest(int[] a, int[] b, int low1, int low2, int m, int n, int k) {
		if(low1&lt;0||low2&lt;0||low1&gt;m||low2&gt;n||k&gt;(m+n+2)) return;
		int i = (int)((double)(m-low1)/(m+n-low1-low2)*(k-1));
		int j = k-1-i;
		if(i&gt;=low1 &amp;&amp; i&lt;=m &amp;&amp; j&gt;=low2 &amp;&amp; j&lt;=n){
			int Ai_1 = (i==0)?Integer.MIN_VALUE:a[i-1];
			int Bj_1 = (j==0)?Integer.MIN_VALUE:b[j-1];
			int Ai = a[i];
			int Bj = b[j];
			if(Ai&lt;Bj &amp;&amp; Ai&gt;Bj_1){
				System.out.println("kth smallest element is "+Ai);
				return;
			}
			else if(Bj&lt;Ai &amp;&amp; Bj&gt;Ai_1){
				System.out.println("kth smallest element is "+Bj);
				return;
			}
			if(Ai&lt;Bj)
				findSmallest(a,b,low1+i+1,low2,m,j,k-i-1);
			else
				findSmallest(a,b,low1,low2-j-1,i,n,k-j-1);
		}
	}
}
</code></pre>
		</div>
		<div class="right">
		<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
		</script>
		</div>
	</div>
</body>
</html>