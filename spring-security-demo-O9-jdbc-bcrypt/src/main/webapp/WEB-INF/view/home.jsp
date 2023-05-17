<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>

<head>
	<title>Luv2code Company Home Page</title>
</head>

<body>

	<h2>Luv2code Company Home Page</h2>

	<hr>
	<p>
	Welcome to the Luv2code Company Home Page
	</p>
	
	<hr>
	
	<!-- display user name and role -->
	
	<p>
		User: <security:authentication property="principal.username"/> 
		<br><br>
		Role(s): <security:authentication property="principal.authorities"/>
	</p>
	
	<security:authorize access="hasRole('MANAGER')">
		<!-- add a link to point to /leaders.. this is for managers -->
		<hr>
		<p>
			<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
			(Only for Manager peeps)
		</p>
	</security:authorize>
	
	<security:authorize access="hasRole('ADMIN')">
		<!-- Add a link to point the /systems ... this is for Admin -->
		<hr>
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
			(Only for Admin peeps)
		</p>
	</security:authorize>
	<hr>
	
	<!-- Add a Logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" method="POST" >
	
	<input type="submit" value="logout" />
	
	</form:form>
	
	
	
</body>


</html>