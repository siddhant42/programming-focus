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
<title>Palindrome LinkedList</title>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/data-structures.jsp" />
		</div>
		<div class="maincontent">
   <h3>Check if a given singly linked list is palindrome</h3>
<pre><code class="java">
public class Palindrome {
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
		head = insert(head,4);
		head = insert(head,3);
		head = insert(head,2);
		head = insert(head,1);
		printNodes(head);
		System.out.println(new Palindrome().isPalRec(head));

	}
	Node p=null;
	private boolean isPalRec(Node head) {
		p=head;
		return isPal(head);
	}
	private boolean isPal(Node end) {
		if(end==null) return true;
		if(isPal(end.next) == false)
			return false;
		if(p.data!=end.data) 
			return false;
		else
			p=p.next;
		return true;
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
		<div class="right">
		<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
		</script>
		</div>
	</div>
</body>
</html>