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
<title>reverse iteratively</title>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/data-structures.jsp" />
		</div>
		<div class="maincontent">
   <h3>Reverse a singly linked list recursively</h3>
<pre><code class="java">
public class Reverse3 {
	static class Node {
		int data;
		Node next;
		public Node(int data) {
			super();
			this.data = data;
		}
	}
	public void printList(Node head) {
		while(head!=null) {
			System.out.print(head.data+" ");
			head = head.next;
		}
	}
	public Node reverse(Node head) {
		if(head == null || head.next==null) {
			return head;
		}
		Node tmp = head.next;
		Node p = reverse(head.next);
		tmp.next = head;
		head.next = null;
		return p;
	}
	public static void main(String[] args) {
		Reverse3 obj = new Reverse3();
		Node head = new Node(1);
		head.next  = new Node(2);
		head.next.next  = new Node(3);
		head.next.next.next = new Node(4);
		head.next.next.next.next = new Node(5);
		obj.printList(head);
		System.out.println();
		Node p = obj.reverse(head);
		obj.printList(p);
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