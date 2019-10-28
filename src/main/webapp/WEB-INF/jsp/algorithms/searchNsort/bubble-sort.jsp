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
<title>Bubble Sort</title>
<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
</script>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/algorithms.jsp" />
		</div>
		<h3>Bubble Sort</h3>
		<div class="maincontent">
<pre><code class="java">
public class BubbleSort {
	public static void sort(int[] a) {
		if(a==null || a.length==0 || a.length==1) return;
		int n = a.length,exchanges=0;
		for(int i=n-1;i&gt;0;i--) {
			boolean b = true;
			for(int j=0;j&lt;i;j++) {
				if(a[j]&gt;a[j+1]) {
					int swap = a[j];
					a[j]=a[j+1];
					a[j+1] = swap;
					exchanges++;
					b = false;
				}
			}
			if(b) break;
		}
		System.out.println("no of exchanges "+exchanges);
	}
	public static void main(String[] args) {
		// int[] a = {4,87,23,1,54};
		int[] b = {1,2,3,4,5};
		sort(b);
		ArrayPrint.print(b);
	}
}

</code></pre>
		</div>
	</div>
</body>
</html>