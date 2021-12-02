<%@page import="com.studentdata.dto.Student"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- apply validation 
     apply error handling
      -->

<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://kit.fontawesome.com/9e363b886a.js"></script>
<link
	href="<%=request.getServletContext().getInitParameter("BASE_URL")%>/css/dashboard.css"
	rel="stylesheet">
</head>
<body>
	<%
	boolean isLoggedIn = (request.getSession().getAttribute("studentLoggedIn") == null) ? false : true;

	if (!isLoggedIn) {
		response.sendRedirect(request.getServletContext().getInitParameter("BASE_URL") + "/admin/login");
	}
	%>
	<nav class="navbar fixed-top  navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="dashboard">Persons</a>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="addstudent">Add
					Student</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="text" id="myInput"
				onkeyup="myFunction()" placeholder="Search" aria-label="Search">
			&nbsp;&nbsp;&nbsp;
		</form>
		<a
			href="<%=request.getServletContext().getInitParameter("BASE_URL")%>/admin/logout"><button
				class="btn btn-outline-danger my-2 my-sm-0">Logout</button></a>


	</nav>
	<%
	@SuppressWarnings("unchecked")
	List<Student> list = (List<Student>) request.getAttribute("student");
	String delete = (String) session.getAttribute("delete");
	String add = (String) session.getAttribute("add");
	String edit = (String) session.getAttribute("edit");
	if (delete != null && delete.equals("success")) {
	%>
	<div class="alert alert-success alert-dismissable" role="alert">
		Details deleted!<a href="#" class="close" data-dismiss="alert"
			aria-label="close">&nbsp;&#10007;</a>
	</div>
	<%
	session.removeAttribute("delete");
	}
	if (add != null && add.equals("success")) {
	%>
	<div class="alert alert-success alert-dismissable" role="alert">
		Student added!<a href="#" class="close" data-dismiss="alert"
			aria-label="close">&nbsp;&#10007;</a>
	</div>
	<%
	session.removeAttribute("add");
	}
	if (edit != null && edit.equals("success")) {
	%>
	<div class="alert alert-success alert-dismissable" role="alert">
		Student edited!<a href="#" class="close" data-dismiss="alert"
			aria-label="close">&nbsp;&#10007;</a>
	</div>
	<%
	session.removeAttribute("edit");
	}
	%>

	<br>
	<form action="deletestudent" method="post">
		<table id="myTable" class="table table-hover">
			<tr class="header">
				<th style="width: 10%;">User Name</th>
				<th style="width: 10%;">First Name</th>
				<th style="width: 10%;">Last Name</th>
				<th style="width: 10%;">Birthday</th>
				<th style="width: 10%;">Gender</th>
				<th style="width: 10%;">State</th>
				<th style="width: 10%;">Contact</th>
				<th style="width: 5%;"><input type="checkbox" id="checkboxall"></th>
			</tr>
			<%
			for (Student student : list) {
				int id = student.getId();
			%>
			<tr class="table-row">
				<td><a title="click to modify!!"
					style="text-decoration: none; color: black;"
					href="editstudent?id=<%=id%>"><%=student.getUsername()%></a></td>
				<td><a title="click to modify!!"
					style="text-decoration: none; color: black;"
					href="editstudent?id=<%=id%>"><%=student.getFirstname()%></a></td>
				<td><a title="click to modify!!"
					style="text-decoration: none; color: black;"
					href="editstudent?id=<%=id%>"><%=student.getLastname()%></a></td>
				<td><a title="click to modify!!"
					style="text-decoration: none; color: black;"
					href="editstudent?id=<%=id%>"><%=student.getBirthday()%></a></td>
				<td><a title="click to modify!!"
					style="text-decoration: none; color: black;"
					href="editstudent?id=<%=id%>"><%=student.getGender()%></a></td>
				<td><a title="click to modify!!"
					style="text-decoration: none; color: black;"
					href="editstudent?id=<%=id%>"><%=student.getState()%></a></td>
				<td><a title="click to modify!!"
					style="text-decoration: none; color: black;"
					href="editstudent?id=<%=id%>"><%=student.getContact()%></a></td>
				<td><input type="checkbox" name="id" class="checkboxid"
					value=<%=id%>></td>
			</tr>
			<%
			}
			%>
		</table>
		<button style="margin-left: 97.2%; margin-top: -20px;"
			class="btn btn-outline-danger" type="submit">
			<i class="far fa-trash-alt"></i>
		</button>
	</form>
	<script type="text/javascript"
		src="<%=request.getServletContext().getInitParameter("BASE_URL")%>/js/dashboard.js"></script>
</body>
</html>