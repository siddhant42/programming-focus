<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<title>Overriding Hashcode and equals</title>
</head>
<body>
	<div id="container">
		<div class="menu">
			<jsp:include page="/WEB-INF/jsp/java.jsp" />
		</div>
		<div class="maincontent">
		<h2>Overriding equals</h2>
			Overriding the equals method seems simple, but there are many ways to
			get it wrong, and consequences can be dire. The easiest way to avoid
			problems is not to override the equals method, in which case each
			instance of the class is equal only to itself. This is the right
			thing to do if any of the following conditions apply:
			<ul>
				<li>Each instance of the class is inherently unique.</li>
				<li>There is no need for the class to provide a “logical
					equality” test.</li>
				<li>A superclass has already overridden equals, and the
					superclass behavior is appropriate for this class.</li>
				<li>The class is private or package-private, and we are certain
					that its equals method will never be invoked.</li>
			</ul>
			<h3>Reflexivity—</h3>
			The first requirement says merely that an object must be equal to
			itself. It’s hard to imagine violating this one unintentionally. If
			we were to violate it and then add an instance of this class to a
			collection, the contains method might well say that the collection
			didn’t contain the instance that we just added.
			<h3>Symmetry—</h3>
			The second requirement says that any two objects must agree on
			whether they are equal. Unlike the first requirement, it’s not hard
			to imagine violating this one unintentionally. <b>// Broken -
				violates symmetry!</b>
			<pre>
		<code class="java">
public final class CaseInsensitiveString {
	private final String s;
	public CaseInsensitiveString(String s) {
		this.s = Objects.requireNonNull(s);
	}
	// Broken - violates symmetry!
	@Override public boolean equals(Object o) {
		if (o instanceof CaseInsensitiveString)
			return s.equalsIgnoreCase(
					((CaseInsensitiveString) o).s);
		if (o instanceof String) // One-way interoperability!
			return s.equalsIgnoreCase((String) o);
		return false;
	}
	... // Remainder omitted
}
		</code>
	</pre>
			Let’s suppose that we have one case-insensitive string and one
			ordinary one:
			<pre>
		<code class="java">
CaseInsensitiveString cis = new CaseInsensitiveString("Polish");
String s = "polish";
		</code>
	</pre>
			As expected, cis.equals(s) returns true. But,s.equals(cis) returns
			false, a clear violation of symmetry. Suppose we put a
			case-insensitive string into a collection:
			<pre>
		<code class="java">
List&lt;CaseInsensitiveString&gt; list = new ArrayList&lt;&gt;();
list.add(cis);

		
		
		</code>
	</pre>
			What does list.contains(s) return at this point? Once we’ve violated
			the equals contract, we simply don’t know how other objects will
			behave when confronted with our object. To eliminate the problem,
			merely remove the ill-conceived attempt to interoperate with String
			from the equals method. Once we do this, we can refactor the method
			into a single return statement:
			<pre>
		<code class="java">
@Override public boolean equals(Object o) {
	return o instanceof CaseInsensitiveString &amp;&amp;
		((CaseInsensitiveString) o).s.equalsIgnoreCase(s);
}
</code>
	</pre>
			<h3>Transitivity—</h3>
			The third requirement of the equals contract says that if one object
			is equal to a second and the second object is equal to a third, then
			the first object must be equal to the third. Again, it’s not hard to
			imagine violating this requirement unintentionally. Let’s start with
			a simple immutable two-dimensional integer point class:
			<pre>
		<code class="java">
public class Point {
	private final int x;
	private final int y;
	public Point(int x, int y) {
		this.x = x;
		this.y = y;
	}
	@Override public boolean equals(Object o) {
		if (!(o instanceof Point))
			return false;
		Point p = (Point)o;
		return p.x == x &amp;&amp; p.y == y;
	}
	... // Remainder omitted
}
</code>
	</pre>
			Suppose we want to extend this class, adding the notion of color to a
			point:
			<pre>
		<code class="java">
public class ColorPoint extends Point {
	private final Color color;
	public ColorPoint(int x, int y, Color color) {
		super(x, y);
		this.color = color;
	}
	... // Remainder omitted
}
</code>
	</pre>
			How should the equals method look? Suppose we write an equals method
			that returns true only if its argument is another color point with
			the same position and color: <b>// Broken - violates symmetry!</b>
			<pre>
		<code class="java">
@Override 
public boolean equals(Object o) {
	if (!(o instanceof ColorPoint))
	return false;
	return super.equals(o) &amp;&amp; ((ColorPoint) o).color == color;
}
</code>
	</pre>
			The problem with this method is that we might get different results
			when comparing a point to a color point and vice versa. et’s create
			one point and one color point:
			<pre>
		<code class="java">
Point p = new Point(1, 2);
ColorPoint cp = new ColorPoint(1, 2, Color.RED);
</code>
	</pre>
			Then p.equals(cp) returns true, while cp.equals(p) returns false. we
			might try to fix the problem by having ColorPoint.equals ignore color
			when doing “mixed comparisons”: <b>// Broken - violates
				transitivity!</b>
			<pre>
		<code class="java">
@Override 
public boolean equals(Object o) {
	if (!(o instanceof Point))
		return false;
	// If o is a normal Point, do a color-blind comparison
	if (!(o instanceof ColorPoint))
		return o.equals(this);
	// o is a ColorPoint; do a full comparison
	return super.equals(o) &amp;&amp; ((ColorPoint) o).color == color;
}
</code>
	</pre>
			This approach does provide symmetry, but at the expense of
			transitivity:
			<pre>
		<code class="java">
ColorPoint p1 = new ColorPoint(1, 2, Color.RED);
Point p2 = new Point(1, 2);
ColorPoint p3 = new ColorPoint(1, 2, Color.BLUE);
</code>
	</pre>
			Now p1.equals(p2) and p2.equals(p3) return true, while p1.equals(p3)
			returns false, a clear violation of transitivity. Also, this approach
			can cause infinite recursion: Suppose there are two subclasses of
			Point, say ColorPoint and SmellPoint, each with this sort of equals
			method. Then a call to myColorPoint.equals(mySmellPoint) will throw a
			StackOverflowError.
			<pre>
		<code class="java">
// Broken - violates Liskov substitution principle (page 43)
@Override 
public boolean equals(Object o) {
	if (o == null || o.getClass() != getClass())
	return false;
	Point p = (Point) o;
	return p.x == x &amp;&amp; p.y == y;
}
</code>
	</pre>
			This has the effect of equating objects only if they have the same
			implementation class.This may not seem so bad, but the consequences
			are unacceptable.The Liskov substitution principle says that any
			important property of a type should also hold for all its subtypes.
			An instance of a subclass of Point is still a Point, and it still
			needs to function as one, but it fails to do so if we take this
			approach! Because 2 inherited class object will not be equal using
			this equals method. <br> While there is no satisfactory way to
			extend an instantiable class and add a value component, there is a
			fine workaround: “Favor composition over inheritance.” Instead of
			having ColorPoint extend Point, give ColorPoint a private Point field
			and a public view method (Item 6) that returns the point at the same
			position as this color point:
			<pre>
		<code class="java">
//Adds a value component without violating the equals contract
public class ColorPoint {
	private final Point point;
	private final Color color;
	public ColorPoint(int x, int y, Color color) {
		point = new Point(x, y);
		this.color = Objects.requireNonNull(color);
	}
	/**
	 * Returns the point-view of this color point.
	 */
	public Point asPoint() {
		return point;
	}
	@Override public boolean equals(Object o) {
		if (!(o instanceof ColorPoint))
			return false;
		ColorPoint cp = (ColorPoint) o;
		return cp.point.equals(point) &amp;&amp; cp.color.equals(color);
	}
	... // Remainder omitted
}
</code>
	</pre>
			There are some classes in the Java platform libraries that do extend
			an instantiable class and add a value component. For example,
			java.sql.Timestamp extends java.util.Date and adds a nanoseconds
			field. The equals implementation for Timestamp does violate symmetry
			and can cause erratic behavior if Timestamp and Date objects are used
			in the same collection or are otherwise intermixed. The Timestamp
			class has a disclaimer cautioning programmers against mixing dates
			and timestamps.
			<h3>Consistency—</h3>
			The fourth requirement of the equals contract says that if two
			objects are equal, they must remain equal for all time unless one (or
			both) of them is modified. In other words, mutable objects can be
			equal to different objects at different times while immutable objects
			can’t. When we write a class, think hard about whether it should be
			immutable (Item 17). If we conclude that it should, make sure that
			our equals method enforces the restriction that equal objects remain
			equal and unequal objects remain unequal for all time. <br>
			Whether or not a class is immutable, do not write an equals method
			that depends on unreliable resources.
			<h3>Non-nullity—</h3>
			It says that all objects must be unequal to null. While it is hard to
			imagine accidentally returning true in response to the invocation
			o.equals(null), because it will through NullPointerException first. <br>
			Many classes have equals methods that guard against it with an
			explicit test for null:
			<pre>
		<code class="java">
@Override 
public boolean equals(Object o) {
	if (o == null)
	return false;
...
}
</code>
	</pre>
			This test is unnecessary. To test its argument for equality, the
			equals method must first cast its argument to an appropriate
			type.Before doing the cast, the method must use the instanceof
			operator to check that its argument is of the correct type:
			<pre>
		<code class="java">
@Override 
public boolean equals(Object o) {
	if (!(o instanceof MyType))
	return false;
	MyType mt = (MyType) o;
...
}
</code>
	</pre>
			If this type check were missing and the equals method were passed an
			argument of the wrong type, the equals method would throw a
			ClassCastException, which violates the equals contract. But the
			instanceof operator is specified to return false if its first operand
			is null, regardless of what type appears in the second operand. <br>
			<h4>Putting it all together, here’s a recipe for a high-quality
				equals method:</h4>
			<ul>
				<li><b>Use the == operator to check if the argument is a
						reference to this object.</b></li>
				<li><b>Use the instanceof operator to check if the argument
						has the correct type</b></li>
				<li><b>Cast the argument to the correct type.</b></li>
				<li><b>For each “significant” field in the class, check if
						that field of the argument matches the corresponding field of this
						object</b></li>
			</ul>
			after writing our equals method, check these three parameters: Is it
			symmetric? Is it transitive? Is it consistent? Not just check write
			unit test cases for these cases. <br> Nowadays best way to
			create equals &amp; hashcode is to use lombok project or Google-
			AutoValue.
			<h2>Overriding Hashcode</h2>
			<b>We must override hashCode in every class that overrides equals.</b>
			If we fail to do so, It will broke the general contract between hashcode
			and equals.Here is the contract:<br>
			<ul>
			<li>When the hashCode method is invoked on an object repeatedly during an
			execution of an application, it must consistently return the same value,
			provided no information used in equals comparisons is modified. This value
			need not remain consistent from one execution of an application to another.</li>
			<li>If two objects are equal according to the equals(Object) method, then 
			calling hashCode on the two objects must produce the same integer result.</li>
			<li>If two objects are unequal according to the equals(Object) method, it is not
			required that calling hashCode on each of the objects must produce distinct
			results. However, the programmer should be aware that producing distinct
			results for unequal objects may improve the performance of hash tables.</li>
			</ul>
			<b>The key provision that is violated when you fail to override hashCode is
			the second one: equal objects must have equal hash codes.</b>			
			For example, suppose you attempt to use instances of the PhoneNumber class
			as keys in a HashMap:
<pre><code class="java">
Map&lt;PhoneNumber, String&gt; m = new HashMap&lt;&gt;();
m.put(new PhoneNumber(707, 867, 5309), "Jenny");
</code></pre>
			At this point, you might expect m.get(new PhoneNumber(707, 867, 5309)) to
			return "Jenny", but instead, it returns null.<br>
			Fixing this problem is as simple as writing a proper hashCode method for
			PhoneNumber.<br>
<pre><code class="java">
// The worst possible legal hashCode implementation - never use!
@Override 
public int hashCode() { 
	return 42; 
}
</code></pre>
			It’s legal because it ensures that equal objects have the same hash code. It’s
			atrocious because it ensures that every object has the same hash code. Therefore,
			every object hashes to the same bucket, and hash tables degenerate to linked lists.<br>
			A good hash function tends to produce unequal hash codes for unequalinstances. 
			This is exactly what is meant by the third part of the hashCode contract.<br>
			One of the proper way of generating hashcode is like this:
<pre><code class="java">
//Typical hashCode method
@Override 
public int hashCode() {
int result = Short.hashCode(areaCode);
result = 31 * result + Short.hashCode(prefix);
result = 31 * result + Short.hashCode(lineNum);
return result;
}
</code></pre>
			The value 31 was chosen because it is
			an odd prime. If it were even and the multiplication overflowed, information
			would be lost, because multiplication by 2 is equivalent to shifting. The 
			advantage of using a prime is less clear, but it is traditional. A nice property 
			of 31 is that the multiplication can be replaced by a shift and a subtraction 
			for better performance on some architectures: 31 * i == (i &lt;&lt; 5) - i. Modern 
			VMs do this sort of optimization automatically.<br>
			Because this method returns the result of a simple deterministic computation
			whose only inputs are the three significant fields in a PhoneNumber instance, it is
			clear that equal PhoneNumber instances have equal hash codes. This method is, in
			fact, a perfectly good hashCode implementation for PhoneNumber, on par with
			those in the Java platform libraries. It is simple, is reasonably fast, and does a
			reasonable job of dispersing unequal phone numbers into different hash buckets.<br>
			<b>Do not be tempted to exclude significant fields from the hash code computation 
			to improve performance.</b> While the resulting hash function may runfaster, its poor 
			quality may degrade hash tables’ performance to the point where they become unusable.<br>
			<b>Don’t provide a detailed specification for the value returned by hashCode,
			so clients can’t reasonably depend on it; this gives you the flexibility to
			change it.</b>
		</div>
		<div class="right">
		<script data-ad-client="ca-pub-8533921061363804" 
	async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">
		</script>
		</div>
	</div>
</body>
</html>