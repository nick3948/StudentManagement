<%@page import="com.studentdata.dto.Student"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
	boolean isLoggedIn = (request.getSession().getAttribute("adminLoggedIn") == null) ? false : true;

	if (!isLoggedIn) {
		response.sendRedirect(request.getServletContext().getInitParameter("BASE_URL") + "/admin/login");
	}
	%>
	<nav class="navbar fixed-top  navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="dashboard">Students</a>&nbsp;&nbsp;&nbsp;
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" title="click to add!!"
				href="student?act=add"><i class="fas fa-user-plus fa-1x"></i>
					Save </a></li>
			<li class="nav-item"><a class="nav-link" title="click to edit!"
				onclick="editFun()"><i class="fas fa-user-edit fa-1x"></i> Edit
			</a></li>
			<li class="nav-item"><a class="nav-link"
				title="click to delete!" onclick="deleteFun()"><i
					class="fas fa-user-minus fa-1x"></i> Delete</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input title="Search for students!!" onkeyup="myFunction()"
				class="form-control mr-sm-2" type="text" id="myInput"
				placeholder="Search" aria-label="Search"> &nbsp;&nbsp;&nbsp;
		</form>
		<a title="Dark/Light mode" class="btn btn-outline-secondary active"
			id="darkmodetoggle" onclick="modeFunction()"><i
			class="fas fa-adjust"></i></a>&nbsp;&nbsp;&nbsp;&nbsp; <a
			title="click to logout!"
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
	} else if (delete != null && delete.equals("fail")) {
	%>
	<div class="alert alert-warning alert-dismissable" role="alert">
		problem in deleting details!<a href="#" class="close"
			data-dismiss="alert" aria-label="close">&nbsp;&#10007;</a>
	</div>
	<%
	}
	session.removeAttribute("delete");
	if (add != null && add.equals("success")) {
	%>
	<div class="alert alert-success alert-dismissable" role="alert">
		Student added!<a href="#" class="close" data-dismiss="alert"
			aria-label="close">&nbsp;&#10007;</a>
	</div>
	<%
	} else if (add != null && add.equals("fail")) {
	%>
	<div class="alert alert-warning alert-dismissable" role="alert">
		problem in adding details!!<a href="#" class="close"
			data-dismiss="alert" aria-label="close">&nbsp;&#10007;</a>
	</div>
	<%
	}
	session.removeAttribute("add");
	if (edit != null && edit.equals("success")) {
	%>
	<div class="alert alert-success alert-dismissable" role="alert">
		Student edited!<a href="#" class="close" data-dismiss="alert"
			aria-label="close">&nbsp;&#10007;</a>
	</div>
	<%
	} else if (edit != null && edit.equals("fail")) {
	%>
	<div class="alert alert-warning alert-dismissable" role="alert">
		problem in editing details!!<a href="#" class="close"
			data-dismiss="alert" aria-label="close">&nbsp;&#10007;</a>
	</div>
	<%
	} else if (edit != null && edit.equals("checkmarks")) {
	%>
	<div class="alert alert-warning alert-dismissable" role="alert">
		Please select only one student!!<a href="#" class="close"
			data-dismiss="alert" aria-label="close">&nbsp;&#10007;</a>
	</div>
	<%
	}
	session.removeAttribute("edit");
	%>

	<br>
	<form id="dashboardlist" action="student">
		<table id="myTable" class="table table-hover">
			<tr class="header">
				<th style="width: 5%;">&nbsp;&nbsp; <input type="checkbox"
					id="checkboxall"></th>

				<th style="width: 10%;">First Name</th>
				<th style="width: 10%;">Last Name</th>
				<th style="width: 10%;">Birthday</th>
				<th style="width: 10%;">Gender</th>
				<th style="width: 10%;">State</th>
				<th style="width: 10%;">Contact</th>
			</tr>
			<%
			for (Student student : list) {
				int id = student.getId();
			%>
			<tr class="table-row">
				<td>&nbsp;&nbsp;&nbsp;<input type="checkbox" name="id"
					class="checkboxid" value=<%=id%>></td>
				<td><%=student.getFirstname()%></td>
				<td><%=student.getLastname()%></td>
				<td><%=student.getBirthday()%></td>
				<td><%=student.getGender()%></td>
				<td><%=student.getState()%></td>
				<td><%=student.getContact()%></td>
			</tr>
			<%
			}
			%>

		</table>
		<input type="hidden" id="queryparam" name="act" value="">
	</form>
	<script type="text/javascript">
		function myFunction() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
		function deleteFun() {
			document.getElementById("queryparam").value = "delete";
			document.getElementById("dashboardlist").submit();
		}
		function editFun() {
			document.getElementById("queryparam").value = "edit";
			document.getElementById("dashboardlist").submit();
		}
		console.log(sessionStorage.getItem('count'));
		window.onload = function myFunction() {
			if (sessionStorage.getItem('count') % 2 == 0) {
				document.body.style.backgroundColor = "#CDF0EA";
				document.body.style.color = "black";
			} else {
				document.body.style.backgroundColor = "black";
				document.body.style.color = "#03DAC6";
			}
		}
		var button = document.getElementById("darkmodetoggle");
		var count = 0;
		button.onclick = function() {
			count += 1;
			console.log(count);
			sessionStorage.setItem('count', count);
			if (sessionStorage.getItem('count') % 2 != 0) {
				document.body.style.backgroundColor = "black";
				document.body.style.color = "#03DAC6";
			} else {
				document.body.style.backgroundColor = "#CDF0EA";
				document.body.style.color = "black";
			}
		}
	</script>
	<script type="text/javascript"
		src="<%=request.getServletContext().getInitParameter("BASE_URL")%>/js/dashboard.js"></script>
</body>
</html>