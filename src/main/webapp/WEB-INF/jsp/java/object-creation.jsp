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
<title>Object Creation</title>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/java.jsp" />
		</div>
		<div class="maincontent">
There are 4 different ways through which we can create an object of
a class in java.
<h4>1.Using new keyword:</h4>
This is the most common way to create an object in java. According to a 
data aroung 99% of objects are created in this way.
<pre><code class="java">
MyObject obj = new MyObject();
</code></pre>
Here MyObject is class name, obj is object created and MyObject is constructor
of class MyObject used for creating a new object of MyObject class.
<h4>2.using Class.forName()</h4>
In this way class constuctor is called to create object
<pre><code class="java">
MyObject obj = (MyObject)Class.forName(com.test.MyObject).newInstance();
</code></pre>
Here com.test.MyObject is fully classified name of MyObject class whose object
is created with name obj
<h4>3.using clone() method</h4>
Object's clone() method can be used to create a new object that is a swallo copy
of existing object.In this way of creating object class constructor is not called
 More about swallo and deep copy can be checked 
 <a href="/java/swallo-deep-copy">here</a>
<pre><code class="java">
MyObject obj = new MyObject();
MyObject obj2 = (MyObject)obj.clone();	// checked cloneNotSupportedException
</code></pre> 
There are a lot of restrictions placed on clone() method and a lot more concept
can be checked in our article <a href="/java/clone-method">here</a>
<h4>3.using object serialization and deserialization</h4>
We can copy state of object in some file and it can be transferred over network
using serialization and deserialization.
<pre><code class="java">
 ObjectInputStream in=new ObjectInputStream(new FileInputStream("file.txt")); 
 MyObject obj = (MyObject) in.readObject();
</code></pre>
Here <strong>file.txt</strong> is the file in which object's state is saved.
In the process of serialization no constructor of the class is called.
More about serialization can be checked in our article <a href="/java/serialization">here</a>
		</div>
		<div class="right">
		<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
		</script>
		</div>
	</div>
</body>
</html>