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
<title>static-method</title>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/java.jsp" />
		</div>
		<div class="maincontent">
			<h2>Can we Overload or Override static methods in java ?</h2>
			Let's first introduce some concepts on it.
			<h3 style="color: green">Overloading:</h3>
			Overloading is a concept of Oops. And its just a method with same
			name and different signature mainly parameters.
			<h3 style="color: green">Overriding:</h3>
			Overriding is a concept of Oops. And in overriding method name and
			signature should be same. Moreover overriding is a runtime
			polymorphism. So, methods are assigned at runtime.
			<h3>Can we Overload static methods?</h3>
			Yes.We can overload static methods.Because we are declaring methods
			with The only difference is that it has same name but different
			parameters.
			<pre>
				<code class="java">
public class Test {

  public static void method1() {
  	System.out.println("inside method1");
  }
  public static void method2(String str) {
  	System.out.println("inside method2:"+str);
  }
}
</code>
			</pre>
			<h3>Can we override static methods?</h3>
			No. In overriding methods are assigned at runtime to an object. But
			static methods are class properties and defined in class memory area
			and can't be assigned to heap memory.And according to definition, all
			the information are available at compile time itself. So, it can't be
			assigned at runtime.
			<pre>
				<code class="java">
class Sup {

	  public static void method() {
	  	System.out.println("in super class method");
	  }
	  
	}
	class Sub extends Sup {
		public static void method() {
	  	System.out.println("in sub class method");
	  }
	}
public class Test1 extends Sup {
	public static void main(String[] args) {
		Sup obj = new Sub();
		obj.method();        //super class static method will be called
	}
}
</code>
			</pre>
			<h3>Output:</h3>
			<div style="background-color: grey;">in super class method</div>
			In the follwoing cases when static keyword is ommited we will get
			compile time error
			<pre>
				<code class="java">
class Sup {

	  public void method() {
	  	System.out.println("in super class method");
	  }
	  
	}
	class Sub extends Sup {
	//This static method cannot hide the instance method from Sup
		public static void method() {	//compile time error
	  	System.out.println("in sub class method");
	  }
	}
public class Test1 extends Sup {
	public static void main(String[] args) {
		Sup obj = new Sub();
		obj.method();        //super class static method will be called
	}
}
</code>
			</pre>
			<pre>
				<code class="java">
class Sup {

	  public static void method() {
	  	System.out.println("in super class method");
	  }
	  
	}
	class Sub extends Sup {
	//This instance method cannot override the static method from 
	 Sup
		public void method() {	//compile time error
	  	System.out.println("in sub class method");
	  }
	}
public class Test1 extends Sup {
	public static void main(String[] args) {
		Sup obj = new Sub();
		obj.method();        //super class static method will be called
	}
}
</code>
			</pre>
		</div>
	</div>
</body>
</html>