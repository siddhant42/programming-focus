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
<title>Merge Sort</title>
<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
</script>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/algorithms.jsp" />
		</div>
		<h3>Merge Sort</h3>
		<div class="maincontent">
<pre><code class="java">
public class MergeSort {
	public static void sort(int[] a) {
		if(a==null || a.length==0 || a.length==1) return;
		int low=0,high=a.length-1;
		sort(a,low,high);
	}
	private static void sort(int[] a,int low,int high) {
		if(low>=high) return;
		int mid = (low+high)/2;
		sort(a,low,mid);
		sort(a,mid+1,high);
		merge(a,low,mid,high);
	}
	public static void merge(int[] a,int low,int mid,int high) {
		int n1 = mid-low+1;
		int n2 = high-mid;
		int[] b = Arrays.copyOfRange(a, low, mid+1);
		int[] c = Arrays.copyOfRange(a, mid+1, high+1);
		
		int i=0,j=0,k = low;
		while (i&lt;n1 &amp;&amp; j&lt;n2) {
			if(b[i]&lt;c[j])
				a[k++] = b[i++];
			else
				a[k++] = c[j++];
		}
		while (i&lt;n1)
			a[k++] = b[i++];
		while (j&lt;n2)
			a[k++] = c[j++];
	}
	public static void main(String[] args) {
		int[] a = {4,87,23,1,54};
		sort(a);
		ArrayPrint.print(a);
	}
}

</code></pre>
		</div>
	</div>
</body>
</html>