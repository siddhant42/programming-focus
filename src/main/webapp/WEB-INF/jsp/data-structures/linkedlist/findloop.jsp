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
<title>loop in a linked list</title>
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
   <h3>Check if a loop exists in a given singly linked list</h3>
<pre><code class="java">
public class Findloop {
	static class Node {
		int data;
		Node next;

		public Node() {
			super();
		}
		public Node(int data) {
			super();
			this.data = data;
			next=null;
		}
	}
	public static void main(String[] args) {
		Node head=null;
		Node n1=new Node(1);
		Node n2=new Node(2);
		Node n3=new Node(3);
		Node n4=new Node(4);
		Node n5=new Node(5);
		head=n1;
		n1.next=n2;
		n2.next=n3;
		n3.next=n4;
	    n4.next=n5;
	   //n5.next=n3;
	   Findloop obj=new Findloop();
	   System.out.println(obj.find(head));
	   if(obj.loopstartingpoint(head)!=null){
	   System.out.println("starting point of the loop is");
	   System.out.println(obj.loopstartingpoint(head).data);
	   }	}
	boolean find(Node head){
		if(head==null){
			System.out.println("list is empty");
			return false;
		}
		Node l1=head,l2=head;
		while(l2!=null){
			l1=l1.next;
			l2=l2.next;
			if(l2!=null)
				l2=l2.next;
			if(l1==l2)
				return true;
		}
		return false;
	}
	Node loopstartingpoint(Node head){
		if(head==null){
			System.out.println("list is empty");
			return null;
		}
		Node l1=head,l2=head;
		while(l2!=null){
			l1=l1.next;
			l2=l2.next;
			if(l2!=null)
				l2=l2.next;
			if(l2==null){ 
				System.out.println("there is no loop in the given list");
				return null;}
			if(l1==l2) break;
		}
		while(head!=l1){
			head=head.next;
			l1=l1.next;
		}
		return l1;
	}
}

</code></pre>
		</div>
	</div>
</body>
</html>