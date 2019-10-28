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
<title>Quick Sort</title>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/algorithms.jsp" />
		</div>
		<div class="maincontent">
		<h3>Quick Sort</h3>
<pre><code class="java">
public class QuickSort {
	static int count = 0;
	public static void sort(int[] a) {
		if(a==null || a.length==0 || a.length==1) return;
		int low=0,high=a.length-1;
		sort(a,low,high);
	}
	public static void sort(int[] a,int low,int high) {
		if(low&gt;=high) return;
		count++;
		int pivot = a[low];
		int lb = low,ub = high;
		while(lb&lt;ub) {
			while(a[lb]&lt;=pivot &amp;&amp; lb&lt;high)
				lb++;
			while(a[ub]&gt;=pivot &amp;&amp; ub&gt;low)
				ub--;
			if(ub==low) return;
			if(lb&lt;ub) {
				int swap = a[lb];
				a[lb] = a[ub];
				a[ub] = swap;
			}
		}
		int swap = a[low];
		a[low] = a[ub];
		a[ub] = swap;
		sort(a,low,ub-1);
		sort(a,ub+1,high);
	}
	public static void main(String[] args) {
		//int[] a = {4,87,23,1,54};
		int[] a = {7,10,4,3,20,15,18,25,30,1};
		sort(a);
		System.out.println(count);
		ArrayPrint.print(a);
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