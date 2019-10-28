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
			<jsp:include page="/WEB-INF/jsp/data-structures.jsp" />
		</div>
		<div class="maincontent">
<pre><code class="java">
public class HistoGram {
	int findMax(int[] a){
		int max=Integer.MIN_VALUE;
		int currMax=Integer.MIN_VALUE;
		Stack&lt;Integer&gt; s = new Stack&lt;&gt;();
		int i=0;
		while(i&lt;a.length){
			if(s.isEmpty() || a[s.peek()]&lt;=a[i])
				s.push(i++);
			else {
				int tp = s.pop();
				currMax = a[tp] * (s.isEmpty()?i:i-s.peek()-1);
				if(max&lt;currMax)
					max = currMax;
			}}
		while(s.isEmpty()==false){
			int tp = s.pop();
			currMax = a[tp] * (s.isEmpty()?i:i-s.peek()-1);
			if(max&lt;currMax)
				max = currMax;
		}

		return max;
	}
	public static void main(String[] args) {
		HistoGram obj = new HistoGram();
		int[] a = {6,2,5,4,5,1,6};
		System.out.println(obj.findMax(a));
		int[][] a1= {
				{0 , 1,  1,  1,  1 },
				{1,  1,  0,  1,  0 },
				{1,  1,  1,  1,  0},
				{1,  1,  1,  1,  0},
				{1,  1,  0,  1,  1},
				{0,  0,  1,  1,  1}
		};
		System.out.println(obj.findMaxArea(a1));

	}
	private int findMaxArea(int[][] a) {
		int max=Integer.MIN_VALUE;
		int currMax=0;
		assert(a!=null);
		assert(a.length>0);
		for(int i=1;i&lt;a.length;i++){
			for(int j=0;j&lt;a[0].length;j++){
				if(a[i-1][j]!=0 &amp;&amp; a[i][j]!=0)
					a[i][j]+=a[i-1][j];
			}
		}
		for(int i=0;i&lt;a.length;i++){
			currMax=findMax(a[i]);
			if(max&lt;currMax)
				max = currMax;
		}
		return max;
	}
}
</code></pre>
		</div>
	</div>
</body>
</html>