<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="icon"
	href="<%=request.getServletContext().getInitParameter("BASE_URL")%>/icons/icon.png">
<link
	href="<%=request.getServletContext().getInitParameter("BASE_URL")%>/css/login.css"
	rel="stylesheet">
</head>
<body>

	<div class="container">
		<form class="form-signin" role="form"
			action="<%=request.getServletContext().getInitParameter("BASE_URL") + "/admin/login"%>"
			method="post">
			<h2 class="form-signin-heading">Login</h2>
			<input name="username" type="text" class="form-control"
				placeholder="Username" required autofocus /> <input name="password"
				type="password" class="form-control" placeholder="Password" required />
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
				in</button>
		</form>
	</div>
	<!-- /container -->

</body>
</body>
</html>