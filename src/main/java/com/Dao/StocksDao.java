package com.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.todo.entities.Stocks;
import com.todo.entities.Todo;

@Component
public class StocksDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public void save(Stocks s) {
		hibernateTemplate.saveOrUpdate(s);
	}

	public List<Stocks> getAll() {
		List<Stocks> list = (List<Stocks>) hibernateTemplate.find("from Stocks s where s.a_id=" + 1);
		return list;
	}
	
	

	public Stocks getStock(int id) {
		Stocks s = hibernateTemplate.get(Stocks.class, id);
		return s;
	}

	@Transactional
	public void deletestock(int id) {
		Stocks stock = hibernateTemplate.get(Stocks.class, id);
		hibernateTemplate.delete(stock);
	}

	public Double Profit() {
		List list = hibernateTemplate.find("select sum(profit) from Stocks where a_id=" + 1);
		return (Double) list.get(0);
	}
	
	public Double Totalbuy() {
		List list = hibernateTemplate.find("select sum(buytotal) from Stocks where profit is null and  a_id=" + 1);
		return (Double) list.get(0);
	}

	public Double mummyProfit() {
		List list = hibernateTemplate.find("select sum(profit) from Stocks where a_id=" + 2);
		return (Double) list.get(0);
	}
	
	public Double Totalbuymummy() {
		List list = hibernateTemplate.find("select sum(buytotal) from Stocks where profit is null and a_id=" + 2);
		return (Double) list.get(0);
	}

	public List<Stocks> getMummystock() {
		List<Stocks> list = (List<Stocks>) hibernateTemplate.find("from Stocks s where s.a_id=" + 2);
		return list;
	}

	public List<Stocks> getStockBySearch(String name) {

		String query = "" + "from Stocks s where " + "s.name like '%" + name + "%' " + "and a_id=" + 1;
		return (List<Stocks>) hibernateTemplate.find(query);
	}

	public List<Stocks> getStockBySearchMummy(String name) {

		String query = "" + "from Stocks s where " + "s.name like '%" + name + "%' " + "and a_id=" + 2;
		return (List<Stocks>) hibernateTemplate.find(query);
	}

}
