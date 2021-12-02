package com.studentdata.control;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String adminUsername = "admin";
	final String adminPassword = "1234@";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Forward to the view
		RequestDispatcher dispathcer = request.getRequestDispatcher("login.jsp");
		dispathcer.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username, password;
		username = request.getParameter("username");
		password = request.getParameter("password");

		if (adminUsername.equals(username) && adminPassword.equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("adminLoggedIn", username);
			// Redirect to get method
			response.sendRedirect(request.getServletContext().getInitParameter("BASE_URL") + "/admin/dashboard");
		} else {
			// Redirect to get method
			response.sendRedirect(request.getRequestURL().toString());
		}

	}

}
