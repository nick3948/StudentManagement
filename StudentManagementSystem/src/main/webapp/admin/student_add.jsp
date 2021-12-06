<%@ page language="java" contentType="text/html;"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Student Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link
	href="<%=request.getServletContext().getInitParameter("BASE_URL")%>/css/student_add.css"
	rel="stylesheet">

<style>
.button {
	width: 140px;
	height: 45px;
	font-family: 'Roboto', sans-serif;
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: #000;
	background-color: #fff;
	border: none;
	border-radius: 45px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
}

.button:hover {
	background-color: #396EB0;
	color: #fff;
	transform: translateY(-5px);
}
</style>
</head>
<body>
	<%
	boolean isLoggedIn = (request.getSession().getAttribute("adminLoggedIn") == null) ? false : true;

	if (!isLoggedIn) {
		response.sendRedirect(request.getServletContext().getInitParameter("BASE_URL") + "/admin/login");
	}
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Students</a>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="dashboard">Dashboard</a></li>
			<li class="nav-item"><a class="nav-link" href="student?act=add">Add
					Student</a></li>
		</ul>
		<a href="logout"><button
				class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button></a>
	</nav>
	<%
	String contact = (String) session.getAttribute("contactexist");
	String year = (String) session.getAttribute("year");
	String userexist = (String) session.getAttribute("userexist");
	if (year != null && year.equals("fail")) {
	%>
	<div class="alert alert-danger alert-dismissable" role="alert">
		Invalid Birth year!<a href="#" class="close" data-dismiss="alert"
			aria-label="close">&nbsp;&#10007;</a>
	</div>
	<%
	session.removeAttribute("year");
	}
	if (contact != null && contact.equals("fail")) {
	%>
	<div class="alert alert-danger alert-dismissable" role="alert">
		 contact number already exist!<a href="#" class="close" data-dismiss="alert"
			aria-label="close">&nbsp;&#10007;</a>
	</div>
	<%
	session.removeAttribute("contactexist");
	}
	if (userexist != null && userexist.equals("fail")) {
	%>
	<div class="alert alert-danger alert-dismissable" role="alert">
		User_name already exist!<a href="#" class="close" data-dismiss="alert"
			aria-label="close">&nbsp;&#10007;</a>
	</div>
	<%
	session.removeAttribute("userexist");
	}
	%>
	${errors }
	<div class="div" align="center">
		<h1>Save Student Details</h1>
		<br>
		<form action="student?act=add" method="post">
			<table style="with: 80%">
				<tr>
					<td>First Name</td>
					<td><input type="text" class="form-control-sm" value="${student.firstname }"
						name="firstname"  /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input value="${student.lastname }" type="text" class="form-control-sm" name="lastname"
						 /></td>
				</tr>
				<tr>
					<td>Birthday</td>
					<td><input value="${student.birthday }" type="date" class="form-control-sm" name="birthday"
						 /></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><input style="" type="radio" name="gender" value="male"
						 />&nbsp; Male<br> <input type="radio"
						name="gender" value="female"  />&nbsp; Female</td>
				</tr>
				<tr>
					<td>User name</td>
					<td><input value="${student.username }" type="text" class="form-control-sm" name="username"
						 /></td>
				</tr>
				<tr>
					<td>Select State</td>
					<td><select style="width: 177px;" 
						name="state" id="inputState" class="form-control">
							<option value="SelectState">Select State</option>
							<option value="Andra Pradesh">Andra Pradesh</option>
							<option value="Goa">Goa</option>
							<option value="Haryana">Haryana</option>
							<option value="Himachal Pradesh">Himachal Pradesh</option>
							<option value="Jammu and Kashmir">Jammu and Kashmir</option>
							<option value="Karnataka">Karnataka</option>
							<option value="Kerala">Kerala</option>
							<option value="Madya Pradesh">Madya Pradesh</option>
							<option value="Maharashtra">Maharashtra</option>
							<option value="Manipur">Manipur</option>
							<option value="Mizoram">Mizoram</option>
							<option value="Nagaland">Nagaland</option>
							<option value="Orissa">Orissa</option>
							<option value="Punjab">Punjab</option>
							<option value="Rajasthan">Rajasthan</option>
							<option value="Sikkim">Sikkim</option>
							<option value="Tamil Nadu">Tamil Nadu</option>
							<option value="Telangana">Telangana</option>
					</select></td>
				</tr>
				<tr>
					<td>Select District</td>
					<td><select style="width: 177px;" name="district"
						id="inputDistrict" class="form-control">

					</select></td>
				</tr>
				<tr>
					<td>Contact No</td>
					<td><input value="${student.contact }" type="text" class="form-control-sm" name="contact"
						 /></td>
				</tr>
			</table>
			<br> <br> <input type="submit" class="button" value="Save" />
		</form>
		<br>
	</div>
	<script>
	window.onload = function myFunction() {
		if (sessionStorage.getItem('count') % 2 == 0) {
			document.body.style.backgroundColor = "#CDF0EA";
			document.body.style.color = "black";
		} else {
			document.body.style.backgroundColor = "black";
			document.body.style.color = "#03DAC6";
		}
	}
	</script>

	<script type="text/javascript"
		src="<%=request.getServletContext().getInitParameter("BASE_URL")%>/js/student_add.js"></script>
</body>
</html>