package com.studentdata.control;

import java.io.IOException;
import java.util.List;

import com.studentdata.dto.Student;
import com.studentdata.service.StudentService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/dashboard")
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Student> students;
		StudentService studentService = new StudentService();
		students = studentService.getAll();
		request.setAttribute("student", students);
		
		// forward request to the view
		RequestDispatcher dispathcer = request.getRequestDispatcher("dashboard.jsp");
		dispathcer.forward(request, response);
	}
}
