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
   <h3>Reverse a singly linked list iteratively</h3>
<pre><code class="java">
public class Reverse {
	static class Node{
		int data;
		Node next;
		public Node(int data){
			this.data=data;
			this.next=null;
		}
	}
	public static void main(String[] args) {
		Node head = new Node(1);
		head = insert(head,2);
		head = insert(head,3);
		head = insert(head,4);
		head = insert(head,5);
		head = insert(head,6);
		head = insert(head,7);
		head = insert(head,8);
		//head = insert(head,9);
		printNodes(head);
		System.out.println();
		Node rNode=new Reverse().reverseNodes(head, 3);
		printNodes(rNode);
	}
	private Node reverseNodes(Node head,int k) {
		if(head==null||head.next==null)
			return head;
		int p = k;
		Node p1=head,p2=head.next,p3=null;
		if(p2!=null) p3=p2.next;
		while(p&gt;1 &amp;&amp; p2!=null){
			p2.next=p1;
			p1=p2;
			p2=p3;
			if(p3!=null)
				p3=p3.next;
			p--;
		}
		head.next =  reverseNodes(p2,k);
		return p1;
	}
	private static Node insert(Node head,int data){
		Node tmp = head;
		while(tmp.next!=null)
			tmp = tmp.next;
		tmp.next = new Node(data);
		return head;
	}
	private static void printNodes(Node head) {
		while(head!=null){
			System.out.print(head.data+" ");
			head = head.next;
		}
	}
}

</code></pre>
		</div>
	</div>
</body>
</html>