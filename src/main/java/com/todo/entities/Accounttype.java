package com.todo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Accounttype {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int a_id;
	private String name;
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Accounttype(int a_id, String name) {
		super();
		this.a_id = a_id;
		this.name = name;
	}

	public Accounttype() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Accounttype [a_id=" + a_id + ", name=" + name + "]";
	}
	
	
	
	
}
