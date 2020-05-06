<%@page import="com.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="Component/jquery-3.2.1.min.js"></script>
<script src="Component/Users.js"></script>
<meta charset="ISO-8859-1">
<title>Users Page</title>
</head>
<body>
		
	<div class="container">
		<form id="formUser" name="form-control"  action="Users.jsp" method="post">
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