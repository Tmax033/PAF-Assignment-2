<%@page import="com.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<script src="Component/jquery-3.2.1.min.js"></script>
<script src="Component/Users.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">

<meta charset="ISO-8859-1">
<title>Users Page</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark primary-color">
		<a class="navbar-brand" href="#">Hospital Management System</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only"></span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#"></a></li>
				<li class="nav-item"><a class="nav-link" href="#"></a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"></a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-6">
				<form id="formUser" name="form-control" action="Users.jsp"
					method="post">
					<br> <br>
					<h2 class="text-center">User Management Page</h2>
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
						<input type="password" class="form-control" id="password"
							name="password" placeholder="Password" required="required">
					</div>

					<div class="form-group">
						<input id="btnSave" name="btnSave" type="button" value="Save"
							class="btn btn-primary">
					</div>
					<input type="hidden" id="hidUserIDSave" name="hidUserIDSave"
						value="">




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
		</div>
	</div>
</body>
</html>