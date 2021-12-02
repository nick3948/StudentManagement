package com.studentdata.dto;

import java.sql.Date;

import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class Student {
	private int id;
	@NotNull(message = "First Name cannot be empty!")
	private String firstname;
	@NotNull(message = "Last Name cannot be empty!")
	private String lastname;
	@NotNull(message = "Please specify your gender!")
	private String gender;
	@NotNull(message = "Username cannot be empty!")
	@Size(min = 5, max = 10, message = "Username ")
	private String username;
	@NotNull
	@Size(min = 6, max = 100, message = "password must be min 6 characters!!")
	private String password;
	@NotNull(message = "Please select the state!")
	private String state;
	@NotNull(message = "Please select the district!")
	private String district;
	@NotNull(message = "Contact cannot be empty!")
	@Size(min = 10, max = 10, message = "contact must be 10 digits!!")
	private String contact;
	@NotNull(message = "Birthday cannot be empty!")
	@Future(message = "Impossible to register before birth!")
	private Date birthday;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date date) {
		this.birthday = date;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
}
