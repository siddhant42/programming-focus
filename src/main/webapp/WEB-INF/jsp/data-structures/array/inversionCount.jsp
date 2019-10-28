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
Inversion Count for an array indicates how far (or close) 
the array is from being sorted. If array is already sorted 
then inversion count is 0. If array is sorted in reverse 
order that inversion count is the maximum.
Formally speaking, two elements a[i] and a[j] form an 
inversion if a[i] &gt; a[j] and i &lt; j
Example:
The sequence 2, 4, 1, 3, 5 has three inversions (2, 1), (4, 1), (4, 3).
  
<pre><code class="java">
public class InversionCount {
	public int mergerSort(int[] a) {
		return mergeSort(a,0,a.length-1);
	}
	private int mergeSort(int[] a,int low,int high) {
		if(low>=high) return 0;
		int mid = (low+high)/2;
		int count = mergeSort(a,low,mid);
		count+=mergeSort(a,mid+1,high);
		count+=merge(a,low,mid,high);
		return count;
	}
	private int merge(int[] a,int low,int mid,int high) {
		if(low>=high) return 0;
		int i=low,j=mid+1,k=0,count=0;
		int[] tmp = new int[high-low+1];
		while(i&lt;=mid &amp;&amp; j&lt;=high) {
			if(a[i]&lt;a[j]) {
				tmp[k++]=a[i++];
			}
			else {
				count += (mid-i+1);
				tmp[k++]=a[j++];
			}
		}
		while(i&lt;=mid)
			tmp[k++]=a[i++];
		while(j&lt;=high)
			tmp[k++]=a[j++];
		k=0;
		for(i=low;i&lt;=high;i++)
			a[i]=tmp[k++];
		return count;
	}
	public static void main(String[] args) {
		InversionCount obj = new InversionCount();
		int[] arr = {1, 20, 6, 4, 5};
		System.out.println(obj.mergerSort(arr));
	}
}
</code></pre>
		</div>
	</div>
</body>
</html>