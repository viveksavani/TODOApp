package com.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.todo.entities.Accounttype;
import com.todo.entities.Stocks;

@Component
public class AccountDao {

	@Autowired
	HibernateTemplate hibernateTemplate;
	
	public List<Accounttype> getAll() {
		List<Accounttype> list = hibernateTemplate.loadAll(Accounttype.class);
		return list;
	}

	public Accounttype getName(int id) {
		Accounttype s = hibernateTemplate.get(Accounttype.class, id);
		return s;
	}

}
