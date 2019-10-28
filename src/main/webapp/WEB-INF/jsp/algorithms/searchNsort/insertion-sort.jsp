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
<title>Insertion Sort</title>
<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
</script>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/algorithms.jsp" />
		</div>
		<div class="maincontent">
		<h3>Insertion Sort</h3>
<pre><code class="java">
public class InsertionSort {
	public static void sort(int[] a) {
		if(a==null || a.length==0 || a.length==1) return;
		int n = a.length;
		for(int i=1;i&lt;n;i++) {
			int k = a[i];
			for(int j=i-1;j&gt;=0;j--) {
				if(a[j]>k) {
					a[j+1] = a[j];
					a[j] = k;
				}
				else break;
			}
		}
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