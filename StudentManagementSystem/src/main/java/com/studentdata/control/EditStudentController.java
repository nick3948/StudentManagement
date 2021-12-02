package com.studentdata.control;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import com.studentdata.dto.Student;
import com.studentdata.service.StudentService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/editstudent")
public class EditStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentService service = new StudentService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy");
		long now = System.currentTimeMillis();
		Date sqldate = new Date(now);
		StudentService service = new StudentService();
		Student student = new Student();
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String username = request.getParameter("username");
		String state = request.getParameter("state");
		String district = request.getParameter("district");
		String contact = request.getParameter("contact");
		Date date = Date.valueOf(birthday);
		String curryear = df.format(sqldate);
		String year = df.format(date);

		if (Integer.parseInt(year) > Integer.parseInt(curryear)) {
			request.getSession().setAttribute("year_in_edit", "fail");
			doGet(request, response);

		} else if (!(contact.matches("[0-9]+") && contact.length() == 10)) {
			request.getSession().setAttribute("contact_in_edit", "fail");
			doGet(request, response);
		} else {
			student.setFirstname(firstname);
			student.setLastname(lastname);
			student.setBirthday(date);
			student.setGender(gender);
			student.setUsername(username);
			student.setState(state);
			student.setDistrict(district);
			student.setContact(contact);
			String id = request.getParameter("id");
			int result = service.save(student, Integer.parseInt(id));
			if (result > 0) {
				request.getSession().setAttribute("edit", "success");
				response.sendRedirect(request.getServletContext().getInitParameter("BASE_URL") + "/admin/dashboard");
			} else {
				request.getSession().setAttribute("edit", "fail");
				response.sendRedirect(request.getServletContext().getInitParameter("BASE_URL") + "/admin/dashboard");
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher;
		String id = request.getParameter("id");
		Student student = new Student();

		student = service.getById(Integer.parseInt(id));
		request.setAttribute("student", student);
		dispatcher = request.getRequestDispatcher("student_edit.jsp");
		dispatcher.forward(request, response);
		return;
	}
}
