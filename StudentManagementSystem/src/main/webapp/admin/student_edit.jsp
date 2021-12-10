<%@page import="java.util.List"%>
<%@page import="com.studentdata.dto.Student"%>
<%@ page language="java" contentType="text/html;"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Student Edit Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="<%=request.getServletContext().getInitParameter("BASE_URL")%>/css/student_edit.css"
	rel="stylesheet">

<style>
.button {
	width: 120px;
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
	Student student = (Student) request.getAttribute("student");
	@SuppressWarnings("unchecked")
	List<String> error = (List<String>) request.getAttribute("errors");
	if (error != null && error.size() > 0) {
	%>
	<div class="alert alert-danger alert-dismissable" align="center"
		role="alert">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&nbsp;&#10007;</a>
		<%
		for (String s : error) {
		%>
		<ul style="list-style: none;">
			<li><%=s%></li>
		</ul>
		<%
		}
		%>
	</div>
	<%
	}
	%>
	<div class="div" align="center">
		<h1>Edit Student Details</h1>
		<br>
		<form action="student?act=edit&id=<%=student.getId()%>" method="post">
			<table style="with: 80%">
				<tr>
					<td>First Name</td>
					<td><input type="text" class="form-control-sm"
						name="firstname" value="<%=student.getFirstname()%>" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" value="<%=student.getLastname()%>"
						class="form-control-sm" name="lastname" /></td>
				</tr>
				<tr>
					<td>Birthday</td>
					<td><input type="date" value="<%=student.getBirthday()%>"
						class="form-control-sm" name="birthday" required="required" /></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><input type="radio" name="gender" value="male" />&nbsp;
						Male<br> <input type="radio" name="gender" value="female" />&nbsp;
						Female</td>
				</tr>
				<tr>
					<td>Select State</td>
					<td><select required="required" style="width: 177px;"
						name="state" id="inputState" class="form-control"
						onchange="getCity(this.value)">
							<option value="">Select state</option>
							<%
							@SuppressWarnings("unchecked")
							List<Student> list = (List<Student>) request.getAttribute("statedrop");

							for (Student state : list) {
							%>
							<option value="<%=state.getS_id()%>"><%=state.getState()%></option>
							<%
							}
							%>
					</select></td>
				</tr>
				<tr>
					<td>Select City</td>
					<td id="city"><select required="required"
						style="width: 177px;" class="form-control">
							<option value="">Select state</option>
					</select></td>
				</tr>
				<tr>
					<td>Contact No</td>
					<td><input type="text" value="<%=student.getContact()%>"
						class="form-control-sm" name="contact" required="required" /></td>
				</tr>
			</table>
			<br> <br> <input type="submit" class="button" value="Save" />
		</form>
		<br>
	</div>
	<script>
		window.onload = function myFunction() {
			if (sessionStorage.getItem('count') % 2 == 0) {
				document.body.style.backgroundColor = "#DEEDF0";
				document.body.style.color = "black";
			} else {
				document.body.style.backgroundColor = "black";
				document.body.style.color = "#03DAC6";
			}
		}
		function getCity(s_id) {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("city").innerHTML = this.responseText;
				}
			};
			xhttp.open("GET", "student?sid=" + s_id, true);
			xhttp.send();
		}
	</script>
	<script type="text/javascript"
		src="<%=request.getServletContext().getInitParameter("BASE_URL")%>/js/student_edit.js"></script>
</body>
</html>