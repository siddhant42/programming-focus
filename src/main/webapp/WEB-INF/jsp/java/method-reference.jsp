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
<title>Method Reference</title>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/java.jsp" />
		</div>
		<div class="maincontent">
We use lambda expressions to create anonymous methods. Sometimes, however, 
a lambda expression does nothing but call an existing method. In those cases, 
it's often clearer to refer to the existing method by name. Method references 
enable you to do this; they are compact, easy-to-read lambda expressions for 
methods that already have a name.<br>
<h3>Kinds of Method References</h3>
There are 4 kinds of method references:
<table border="1">
<tbody>
<tr>
<td><strong>Kind</strong></td>
<td><Strong>Example</Strong></td>
</tr>
<tr>
<td>Static method reference</td>
<td>Integer::parseInt</td>
</tr>
<tr>
<td>Reference to an instance method of a particular object	</td>
<td>String::toLowerCase</td>
</tr>
<tr>
<td>Reference to an instance method of an arbitrary object of a particular type	</td>
<td>String::compareToIgnoreCase</td>
</tr>
<tr>
<td>Reference to a constructor	</td>
<td>TreeMap&lt;K,V&gt;::new</td>
</tr>
</tbody>
</table>
Let's say we have given a array of Person objects personArray and we have
to sort it.
<h4>Static Method Reference</h4>
To sort the array by age:<br>
<pre><code class="java">
class PersonAgeComparator implements Comparator&lt;Person&gt; {
	public int compare(Person a, Person b) {
    	return a.getAge().compareTo(b.getAge());
    }
}
// Without method reference
Arrays.sort(personArray, new PersonAgeComparator());
    
// With lambda expression
Arrays.sort(rosterAsArray,
  	(Person a, Person b) -> {
     	return a.getAge().compareTo(b.getAge());
    }
);
      
// With method reference
Arrays.sort(rosterAsArray, Person::compareByAge);
</code></pre>
<h4>Reference to an instance method</h4>
To sort the array by lastName:<br>
<pre><code class="java">
class PersonLastNameComparator implements Comparator&lt;Person&gt; {
	public int compare(Person a, Person b) {
    	return a.getLastName().compareTo(b.getLastName());
    }
}
// Without method reference
Arrays.sort(rosterAsArray, new PersonLastNameComparator());
        
// With lambda expression
Arrays.sort(rosterAsArray,
    (Person a, Person b) -> {
                return a.getLastName().compareTo(b.getLastName());
    }
);
// Reference to an instance method
ComparisonProvider myComparisonProvider = new ComparisonProvider();
Arrays.sort(rosterAsArray, myComparisonProvider::compareByName);
</code></pre>
<h4>Reference to an instance method of an arbitrary object of a particular type</h4>
<pre><code class="java">
// Reference to an instance method
// of an arbitrary object of a particular type
        
String[] stringArray = { "Barbara", "James", "Mary", "John",
    "Patricia", "Robert", "Michael", "Linda" };
Arrays.sort(stringArray, String::compareToIgnoreCase);
</code></pre>
<h4>Reference to a constructor:</h4>
<pre><code class="java">
// The method transferElements copies elements from one collection to
// another
public static &lt;T, SOURCE extends Collection&lt;T&gt;, DEST extends Collection&lt;T&gt;&gt;
    DEST transferElements(
        SOURCE sourceCollection,
        Supplier&lt;DEST&gt; collectionFactory) {
    
        DEST result = collectionFactory.get();
        for (T t : sourceCollection) {
            result.add(t);
        }
        return result;
}
// using lambda
Set&lt;Person&gt; rosterSetLambda =
    transferElements(roster, () -&gt; { return new HashSet&lt;&gt;(); });
//using method reference to a constructor of hashset
Set&lt;Person&gt; rosterSet = transferElements(
    roster, HashSet::new);
System.out.println("Printing rosterSet:");
rosterSet.stream().forEach(p -&gt; p.printPerson());
</code></pre>
Consider the class <i>Person</i> is as given below:
<pre><code class="java">
public class Person {
	private Integer age;
	private String firstName;
	private String lastName;
	private String emailAddress;
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public static int compareByAge(Person a,Person b) {
		return a.getAge().compareTo(b.getAge());
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