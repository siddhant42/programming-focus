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
public class KthLargest {
	public static void main(String[] args) {
		int[] a={3,5,8,15,21,25};
		int[] b={4,11,18,26,28};
		new KthLargest().finLargest(a,b,3);
	}

	private void finLargest(int[] a, int[] b,int k) {
		if((a==null||a.length==0) &amp;&amp; (b!=null &amp;&amp; k&lt;=b.length)){
			System.out.println(b[b.length-k]);
			return;
		}
		else if((b==null||b.length==0) &amp;&amp; (a!=null &amp;&amp; k&lt;=a.length)){
			System.out.println(a[a.length]-k);
			return;
		}
		else if(a!=null &amp;&amp; k&gt;a.length) return;
		else if(b!=null &amp;&amp; k&gt;b.length) return;
		else if(a==null &amp;&amp; b==null) return;
		int m=a.length;
		int n=b.length;
		findLargest(a,b,m-k,n-k,m-1,n-1,k);

	}

	private void findLargest(int[] a, int[] b, int i, int j, int m, int n, int k) {
		if(i&lt;=m &amp;&amp; j&lt;=n &amp;&amp; k&gt;=0){
			if(k==1){
				if(a[m]&lt;b[n]){
					System.out.println(b[n]);
					return;
				}
				else{
					System.out.println(a[m]);
					return;
				}
			}
			int mid1 = (i+m)/2;
			int mid2 = (j+n)/2;
			if(a[mid1]&lt;b[mid2])
				findLargest(a,b,mid1,j,m,mid2,k-(n-mid2));
			else
				findLargest(a,b,i,mid2,mid1,n,k-(m-mid1));
		}

	}
}

</code></pre>
		</div>
	</div>
</body>
</html>