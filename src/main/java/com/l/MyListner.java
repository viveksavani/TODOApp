package com.l;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.todo.entities.Todo;

public class MyListner implements ServletContextListener{

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	/*
	 * @Override public void contextDestroyed(ServletContextEvent sce) { }
	 * 
	 * @Override public void contextInitialized(ServletContextEvent sce) {
	 * System.out.println("context created.."); List<Todo> list = new
	 * ArrayList<Todo>(); ServletContext context = sce.getServletContext();
	 * context.setAttribute("list", list);
	 * 
	 * }
	 */
}
