package com.studentdata.control;

import java.io.IOException;

import com.studentdata.service.StudentService;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/deletestudent")
public class DeleteStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		String[] studentids = request.getParameterValues("id");
		StudentService service = new StudentService();
		int result = service.delete(studentids);
		if (result > 0) {
			request.getSession().setAttribute("delete", "success");
			try {
				response.sendRedirect(request.getServletContext().getInitParameter("BASE_URL") + "/admin/dashboard");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			request.getSession().setAttribute("delete", "fail");
			try {
				response.sendRedirect(request.getServletContext().getInitParameter("BASE_URL") + "/admin/dashboard");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		doPost(request, response);
	}
}
