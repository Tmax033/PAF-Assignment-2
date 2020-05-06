<%@page import="com.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="Component/jquery-3.2.1.min.js"></script>
<script src="Component/Users.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<form id="formUser" name="formUser" action="Users.jsp" method="post">
			<h2 class="text-center">
				<b>Register</b>
			</h2>
			<div class="form-group has-error">
				<input type="text" class="form-control" id="userID" name=userID
					placeholder="ID" required="required" disabled>
			</div>
			
			<div class="form-group has-error">
				<input type="text" class="form-control" id="fName" name="fName"
					placeholder="First Name" required="required">
			</div>
			<div class="form-group has-error">
				<input type="text" class="form-control" id="lName" name="lName"
					placeholder="Last Name" required="required">
			</div>
			<div class="form-group has-error">
				<input type="text" class="form-control" id="email" name="email"
					placeholder="Email" required="required">
			</div>
			<div class="form-group has-error">
				<input type="text" class="form-control" id="nic" name="nic"
					placeholder="NIC Number" required="required">
			</div>
			<div class="form-group has-error">
				<input type="text" class="form-control" id="phone" name="phone"
					placeholder="Phone Number" required="required">
			</div>
			<div class="form-group has-error">
				<input type="password" class="form-control" id="password" name="password"
					placeholder="Password" required="required">
			</div>
			
			<div class="form-group">
				<input id="btnSave" name="btnSave" type="button" value="Save"class="btn btn-primary">
			</div>
			<input type="hidden" id="hidUserIDSave" name="hidUserIDSave" value="">
			
			
			

		</form>
		
			<div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
			

		<br>
			<div id="divDoGrid">
		
				<%
					Users user = new Users();
					out.print(user.readUser());
				%>
			</div>
				
		</div>
	
</body>
</html>