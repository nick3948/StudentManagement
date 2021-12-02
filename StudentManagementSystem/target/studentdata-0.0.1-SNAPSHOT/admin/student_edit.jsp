<%@ page language="java" contentType="text/html;"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Edit Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="<%=request.getServletContext().getInitParameter("BASE_URL")%>/css/student_edit.css"
	rel="stylesheet">
</head>
<body>
	<%
	boolean isLoggedIn = (request.getSession().getAttribute("studentLoggedIn") == null) ? false : true;

	if (!isLoggedIn) {
		response.sendRedirect(request.getServletContext().getInitParameter("BASE_URL") + "/admin/login");
	}
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Students</a>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="dashboard">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="addstudent">Add
					Student</a></li>
		</ul>
		<a href="logout"><button
				class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button></a>
	</nav>

	<div class="div" align="center">
		<h1>Edit Form</h1>
		<br>
		<form action="editstudent?id=${student.id }" method="post">
			<table style="with: 80%">
				<tr>
					<td>First Name</td>
					<td><input type="text" class="form-control-sm"
						name="firstname" value=${student.firstname } required="required" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" value=${student.lastname }
						class="form-control-sm" name="lastname" required="required" /></td>
				</tr>
				<tr>
					<td>Birthday</td>
					<td><input type="date" value=${student.birthday }
						class="form-control-sm" name="birthday" required="required" /></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><input type="radio" name="gender" value="male"
						required="required" />&nbsp; Male<br> <input type="radio"
						name="gender" value="female" required="required" />&nbsp; Female</td>
				</tr>
				<tr>
					<td>User name</td>
					<td><input type="text" value=${student.username }
						class="form-control-sm" name="username" disabled="disabled"
						required="required" /></td>
				</tr>
				<tr>
					<td>Select State</td>
					<td><select style="width: 177px;" name="state" id="inputState"
						class="form-control">
							<option value="SelectState">${student.state }</option>
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
							<option disabled style="background-color: #aaa; color: #fff">UNION
								Territories</option>
							<option value="Andaman and Nicobar Islands">Andaman and
								Nicobar Islands</option>
							<option value="Chandigarh">Chandigarh</option>
							<option value="Delhi">Delhi</option>
					</select></td>
				</tr>
				<tr>
					<td>Select District</td>
					<td><select style="width: 177px;" name="district"
						id="inputDistrict" class="form-control">
							<option value="">${student.district }</option>
					</select></td>
				</tr>
				<tr>
					<td>Contact No</td>
					<td><input type="text" value=${student.contact }
						class="form-control-sm" name="contact" required="required" /></td>
				</tr>
			</table>
			<br> <input type="submit" class="btn btn-secondary btn-md"
				value="Register" />
		</form>
		<br>
	</div>
	<script type="text/javascript"
		src="<%=request.getServletContext().getInitParameter("BASE_URL")%>/js/student_edit.js"></script>
</body>
</html>
