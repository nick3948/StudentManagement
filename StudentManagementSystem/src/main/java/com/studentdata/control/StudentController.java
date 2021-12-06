package com.studentdata.control;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import com.studentdata.dto.Student;
import com.studentdata.service.StudentService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/student")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentService service = new StudentService();
	Student student = new Student();
	RequestDispatcher dispatcher;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String dashboardUrl = request.getServletContext().getInitParameter("BASE_URL") + "/admin/dashboard";
		String stuId = request.getParameter("id");
		String action = request.getParameter("act");
		int id = 0;
		if (stuId != null) {
			id = Integer.parseInt(stuId);
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy");
		long now = System.currentTimeMillis();
		Date currdate = new Date(now);
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String state = request.getParameter("state");
		String district = request.getParameter("district");
		String contact = request.getParameter("contact");
		String username = request.getParameter("username");
		Date date = null;
		try {
			date = Date.valueOf(birthday);
			String curryear = df.format(currdate);
			String year = df.format(date);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		student.setFirstname(firstname);
		student.setLastname(lastname);
		student.setBirthday(date);
		student.setGender(gender);
		student.setState(state);
		student.setDistrict(district);
		if (id == 0) {
			if (service.usernameExist(username)) {
				request.getSession().setAttribute("userexist", "fail");
			} else {
				student.setUsername(username);
			}
		}
		if (service.contactExist(contact)) {
			request.getSession().setAttribute("contactexist", "fail");
		} else {
			student.setContact(contact);
		}
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();
		Set<ConstraintViolation<Student>> constraintViolations = validator.validate(student);
		if (!constraintViolations.isEmpty()) {
			String errors = "<ul>";
			for (ConstraintViolation<Student> constraintViolation : constraintViolations) {
				if (action != null && action.equals("edit")) {
					if (constraintViolation.getPropertyPath().equals("username")) {
						;
					} else
						errors += "<li>" + constraintViolation.getPropertyPath() + " "
								+ constraintViolation.getMessage() + "</li>";
				} else if (action != null && action.equals("add")) {
					errors += "<li>" + constraintViolation.getPropertyPath() + " " + constraintViolation.getMessage()
							+ "</li>";
				}
			}
			errors += "</ul>";
			request.setAttribute("student", student);
			request.setAttribute("errors", errors);
			if (id == 0)
				request.getRequestDispatcher("student_add.jsp").forward(request, response);
			else
				request.getRequestDispatcher("student_edit.jsp").forward(request, response);
		} else {
			int result = service.save(student, id);
			System.out.println(result + " " + id);
			if (result == 1 && id == 0) {
				request.getSession().setAttribute("add", "success");
			} else if (result != 1) {
				request.getSession().setAttribute("add", "fail");
			}
			if (result == 1 && id > 0) {
				request.getSession().setAttribute("edit", "success");
			} else if (result != 1) {
				request.getSession().setAttribute("edit", "fail");
			}
			response.sendRedirect(dashboardUrl);
		}

//		if (id == 0) {
//			String username = request.getParameter("username");
//			if (service.usernameExist(username)) {
//				request.getSession().setAttribute("userexist", "fail");
//				response.sendRedirect("student_add.jsp");
//			} else {
//				student.setUsername(username);
//			}
//		}
//		if (Integer.parseInt(year) > Integer.parseInt(curryear)) {
//			request.getSession().setAttribute("year", "fail");
//			if (id == 0)
//				response.sendRedirect("student_add.jsp");
//			else
//				doGet(request, response);
//		} else if (!(contact.matches("[0-9]+") && contact.length() == 10)) {
//			request.getSession().setAttribute("contact", "fail");
//			if (id == 0)
//				response.sendRedirect("student_add.jsp");
//			else
//				doGet(request, response);
//		} else {
//			int result = service.save(student, id);
//			if (result == 1 && id == 0) {
//				request.getSession().setAttribute("add", "success");
//			} else if (result != 1) {
//				request.getSession().setAttribute("add", "fail");
//			}
//			if (result == 1 && id > 0) {
//				request.getSession().setAttribute("edit", "success");
//			} else if (result != 1) {
//				request.getSession().setAttribute("edit", "fail");
//			}
//			response.sendRedirect(dashboardUrl);
//		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String dashboardUrl = request.getServletContext().getInitParameter("BASE_URL") + "/admin/dashboard";
		String action = request.getParameter("act");
		if (action != null) {
			switch (action) {
			case "add":
				dispatcher = request.getRequestDispatcher("student_add.jsp");
				dispatcher.forward(request, response);
				break;

			case "edit":
				String[] studentEditId = request.getParameterValues("id");
				if (studentEditId != null) {
					if (studentEditId.length == 1) {
						int studentid = Integer.parseInt(studentEditId[0]);
						student = service.getById(studentid);
						request.setAttribute("student", student);
						dispatcher = request.getRequestDispatcher("student_edit.jsp");
						dispatcher.forward(request, response);
					} else {
						request.getSession().setAttribute("edit", "checkmarks");
						response.sendRedirect(dashboardUrl);
					}
				} else {
					response.sendRedirect(dashboardUrl);
				}
				break;

			case "delete":
				String[] studentDeleteIds = request.getParameterValues("id");
				if (studentDeleteIds != null) {
					int result = service.delete(studentDeleteIds);
					if (result > 0) {
						request.getSession().setAttribute("delete", "success");
					} else {
						request.getSession().setAttribute("delete", "fail");
					}
				}
				response.sendRedirect(dashboardUrl);
				break;

			default:
				break;
			}
		}
	}
}