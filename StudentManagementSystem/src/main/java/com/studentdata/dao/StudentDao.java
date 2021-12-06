package com.studentdata.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.studentdata.dbconnection.DBManager;
import com.studentdata.dto.Student;

public class StudentDao {
	Connection con = DBManager.getconfig();

	private final String insertQuery = "INSERT INTO `person`.`details` (`firstname`, `lastname`,`birthday`, `gender`, `username`, `state`,`district`, `contact`) VALUES (?,?,?,?,?,?,?,?)";
	private final String updateQuery = "update person.details set firstname=?, lastname=?, birthday=?, gender=?, state=?, district=?,contact=? where id=?";
	private final String deleteQuery = "DELETE FROM details WHERE id=?";
	private final String selectAllQuery = "SELECT * FROM details";
	private final String selectByIdQuery = "SELECT * FROM details WHERE id=?";
	private final String checkUser = "select * from details";

	public int add(Student student) throws SQLException {

		// Insert
		PreparedStatement ps = con.prepareStatement(insertQuery);
		ps.setString(1, student.getFirstname());
		ps.setString(2, student.getLastname());
		ps.setDate(3, student.getBirthday());
		ps.setString(4, student.getGender());
		ps.setString(5, student.getUsername());
		ps.setString(6, student.getState());
		ps.setString(7, student.getDistrict());
		ps.setString(8, student.getContact());
		int result = ps.executeUpdate();
		return result;

	}

	public List<Student> getAll() throws SQLException {
		List<Student> studentsList = new ArrayList<>();
		PreparedStatement ps = con.prepareStatement(selectAllQuery);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Student s = new Student();
			s.setId(rs.getInt(1));
			s.setFirstname(rs.getString(2));
			s.setLastname(rs.getString(3));
			s.setBirthday(rs.getDate(4));
			s.setGender(rs.getString(5));
			s.setUsername(rs.getString(6));
			s.setState(rs.getString(7));
			s.setDistrict(rs.getString(8));
			s.setContact(rs.getString(9));
			studentsList.add(s);
		}
		return studentsList;
	}

	public Student getById(int idStudent) throws SQLException {
		PreparedStatement ps = con.prepareStatement(selectByIdQuery);
		ps.setInt(1, idStudent);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Student student = new Student();
			student.setId(rs.getInt(1));
			student.setFirstname(rs.getString(2));
			student.setLastname(rs.getString(3));
			student.setBirthday(rs.getDate(4));
			student.setGender(rs.getString(5));
			student.setUsername(rs.getString(6));
			student.setState(rs.getString(7));
			student.setDistrict(rs.getString(8));
			student.setContact(rs.getString(9));
			return student;
		}
		return null;
	}

	public int edit(Student student, int id) throws SQLException {
		PreparedStatement ps = con.prepareStatement(updateQuery);
		ps.setString(1, student.getFirstname());
		ps.setString(2, student.getLastname());
		ps.setDate(3, student.getBirthday());
		ps.setString(4, student.getGender());
		ps.setString(5, student.getState());
		ps.setString(6, student.getDistrict());
		ps.setString(7, student.getContact());
		ps.setInt(8, id);
		int result = ps.executeUpdate();
		return result;

	}

	public int delete(String[] studentids) throws NumberFormatException, SQLException {
		int result = 0;
		for (String id : studentids) {
			PreparedStatement ps = con.prepareStatement(deleteQuery);
			ps.setInt(1, Integer.parseInt(id));
			result += ps.executeUpdate();
		}
		return result;
	}

	public boolean usernameExist(String username) throws SQLException {
		PreparedStatement ps = con.prepareStatement(checkUser);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			if (rs.getString(6).equals(username)) {
				return true;
			}
		}
		return false;
	}

	public boolean contactExist(String contact) throws SQLException {
		PreparedStatement ps = con.prepareStatement(checkUser);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			if (rs.getString(9).equals(contact)) {
				return true;
			}
		}
		return false;
	}

}