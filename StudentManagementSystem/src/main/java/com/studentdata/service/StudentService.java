package com.studentdata.service;

import java.sql.SQLException;
import java.util.List;

import com.studentdata.dao.StudentDao;
import com.studentdata.dto.Student;

public class StudentService {
	StudentDao studentDao = new StudentDao();

	public int save(List<Student> list, int id) {

		try {
			if (id == 0)
				return studentDao.add(list);
			else
				return studentDao.edit(list.get(0), id);
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

	public List<Student> getById(String[] studentEditId) {

		try {
			return studentDao.getById(studentEditId);
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

	public boolean contactExist(String contact, int id) {

		try {
			return studentDao.contactExist(contact, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<Student> getAllState() {

		try {
			return studentDao.getAllStates();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Student> getCityByState(int s_id) {

		try {
			return studentDao.getCityByState(s_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getStateName(int state) {
		try {
			return studentDao.getStateName(state);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getCityName(int city) {
		try {
			return studentDao.getCityName(city);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
