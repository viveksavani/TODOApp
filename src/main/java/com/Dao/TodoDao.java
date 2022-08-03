package com.Dao;

import java.io.Serializable;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;


import com.todo.entities.Todo;

@Component
public class TodoDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void save(Todo t) {
		 hibernateTemplate.saveOrUpdate(t);
	}
	
	public List<Todo> getAll(){
		List<Todo> list = hibernateTemplate.loadAll(Todo.class);
		return list;
	}
	
	@Transactional
	public void deletetodo(int id) {
		Todo todo = hibernateTemplate.get(Todo.class,id);
		hibernateTemplate.delete(todo);
	}
	
	public Todo getTodo(int id){
		Todo t = hibernateTemplate.get(Todo.class, id);
		return t;
	}
}
