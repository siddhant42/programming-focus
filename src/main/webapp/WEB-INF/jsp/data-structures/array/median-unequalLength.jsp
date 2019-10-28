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
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/data-structures.jsp" />
		</div>
		<div class="maincontent">
   <h3>Find the Median with two sorted and unequal length array</h3>
<pre><code class="java">
public class Median2 {
	public double findMedian(int[] a,int[] b){
		if(a.length&lt;=b.length)
			return findMedianRec(a,0,a.length-1,b,0,b.length-1);
		else return findMedianRec(b,0,b.length-1,a,0,a.length-1);
	}
	double findMedianRec(int[] a1,int l1,int h1,int[] a2,int l2,int h2) {
		int m = h1-l1;
		int n = h2-l2;
		int mid1 = (l1+h1)/2;
		int mid2 = (l2+h2)/2;
		if(m==-1) return medianSingle(a2,l2,h2);
		if(m == 0) {
			if(n==0){
				return MO2(a1[l1],a2[l2]);
			}
			else if((n+1)%2!=0) {
				return MO2(a2[mid2],(int)MO3(a1[l1],a2[mid2-1],a2[mid2+1]));
			}
			else {
				return MO3(a1[l1],a2[mid2],a2[mid2+1]);
			}
		}
		/*		else if(n==1) {
			if(m==1){
				return MO4(a1[l1],a1[h1],a2[l2],a2[h2]);
			}
			else if((m+1)%2!=0) {
				return MO3(a1[mid1],Math.max(a1[mid1-1],a2[l2]),Math.min(a1[mid1+1],a2[h2]));
			}
			else {
				return MO4(Math.max(a1[mid1-1],a2[l2]),a1[mid1],a1[mid1+1],Math.min(a2[h2],a1[mid1+2]));
			}
		}*/
		else if(m==1) {
			if(n==1){
				return MO4(a1[l1],a1[h1],a2[l2],a2[h2]);
			}
			else if((n+1)%2!=0) {
				return MO3(a2[mid2],Math.max(a2[mid2-1],a1[l1]),Math.min(a2[mid2+1],a1[h1]));
			}
			else {
				return MO4(Math.max(a2[mid2-1],a1[l1]),a2[mid2],a2[mid2+1],Math.min(a1[h1],a2[mid2+2]));
			}
		}

		double m1 = medianSingle(a1,l1,h1);
		double m2 = medianSingle(a2,l2,h2);
		if(m1==m2) return m1;
		else if(m1&lt;m2) {
			if((h2-l2+1)%2==0) h2 = mid2 + 1;
			else h2 = mid2;
			return findMedianRec(a1,mid1,h1,a2,l2,h2);
		}
		else {
			if((h1-l1+1)%2==0) h1 = mid1+1;
			else h1 = mid1;
			return findMedianRec(a1,l1,h1,a2,mid2,h2);
		}

	}
	private double medianSingle(int[] a,int l,int h) {
		int mid = (h+l)/2;
		if((h-l+1)%2==0) {
			return ((double)a[mid]+a[mid+1])/2;
		}
		else {
			return (double)a[mid];	
		}
	}
	private double MO2(int a,int b) {
		return ((double)a+b)/2;
	}
	private double MO3(int a,int b,int c) {
		if(a&lt;=b &amp;&amp; b&lt;=c) return b;
		else if(b&lt;=a &amp;&amp; a&lt;=c) return a;
		else return c;
	}
	private double MO4(int a,int b,int c,int d) {
		int max = Math.max(a, Math.max(b, Math.max(c, d)));
		int min = Math.min(a, Math.min(b, Math.min(c, d)));
		return ((a+b+c+d)-max-min)/2.0;
	}
	public static void main(String[] args) {
		Median2 obj = new Median2();
		int a1[] = {1, 3, 5, 11,12, 17};
		int a2[] = {9, 10, 11, 13, 14};
		//		int a1[] = {1,2,3,6};
		//	    int a2[] = {4,6,8,10};
		double med = obj.findMedian(a1, a2);
		System.out.println(BigDecimal.valueOf(med));
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