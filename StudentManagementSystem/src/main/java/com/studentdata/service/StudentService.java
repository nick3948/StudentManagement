package com.studentdata.service;

import java.sql.SQLException;
import java.util.List;

import com.studentdata.dao.StudentDao;
import com.studentdata.dto.Student;

public class StudentService {
	StudentDao studentDao = new StudentDao();

	public int save(Student student, int id) {

		try {
			if (id == 0)
				return studentDao.save(student);
			else
				return studentDao.edit(student, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int delete(String[] studentIds) {

		try {
			return studentDao.delete(studentIds);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<Student> getAll() {

		try {
			return studentDao.getAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Student getById(int idStudent) {

		try {
			return studentDao.getById(idStudent);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean usernameExist(String username) {

		try {
			return studentDao.usernameExist(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
