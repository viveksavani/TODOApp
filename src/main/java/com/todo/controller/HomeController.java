package com.todo.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.Dao.AccountDao;
import com.Dao.StocksDao;
import com.Dao.TodoDao;
import com.todo.entities.Accounttype;
import com.todo.entities.Stocks;
import com.todo.entities.Todo;

@Controller
public class HomeController {

	@Autowired
	ServletContext context;

	@Autowired
	TodoDao todoDao;

	@Autowired
	StocksDao stocksDao;

	@Autowired
	AccountDao accountDao;

	@RequestMapping("/home")
	public String home(Model m) {

		String page = "home";
		m.addAttribute("page", page);

		/* List<Todo> list = (List<Todo>) context.getAttribute("list"); */
		List<Todo> list = (List<Todo>) todoDao.getAll();
		System.out.println(list + "getall list");
		m.addAttribute("todos", list);
		return "home";
	}

	@RequestMapping("/add")
	public String add(Model m) {
		Todo t = new Todo();
		m.addAttribute("page", "add");
		m.addAttribute("todo", t);
		return "home";
	}

	@RequestMapping(value = "/saveTodo", method = RequestMethod.POST)
	public String saveTodo(Model m, @ModelAttribute("todo") Todo t) {
		t.setTodoDate(new Date());
		System.out.println(t);
		todoDao.save(t);
		/*
		 * List<Todo> list = (List<Todo>) context.getAttribute("list"); list.add(t);
		 */
		m.addAttribute("msg", "successfully added");
		return "home";
	}

	@RequestMapping("delete/{id}")
	public RedirectView delete(@PathVariable("id") int id, HttpServletRequest request) {
		todoDao.deletetodo(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}

	@RequestMapping("/update/{id}")
	public String update(@PathVariable("id") int id, Model m) {

		Todo todo = todoDao.getTodo(id);
		System.out.println(todo + "todo");
		m.addAttribute("todo", todo);
		return "update";
	}

	/*
	 * @RequestMapping("/stock") public String stock(Model m) {
	 * 
	 * String page = "stock"; List<Stocks> stocks = stocksDao.getAll();
	 * System.out.println(stocks); Double sum = stocksDao.Profit();
	 * System.out.println(sum + "sum"); Double buyprice = stocksDao.Totalbuy();
	 * System.out.println(buyprice + "buyprice"); m.addAttribute("stocks", stocks);
	 * m.addAttribute("sum", sum); m.addAttribute("buyprice",buyprice);
	 * m.addAttribute("page", page); return "stock"; }
	 */
	
	
	@RequestMapping(value = { "stock", "/{page}" }, method = RequestMethod.GET)
	public ModelAndView showUser(@PathVariable(required = false, name = "page") String page, HttpServletRequest request,
			HttpServletResponse response,Model m) {
		ModelAndView mv = new ModelAndView();
		PagedListHolder<Stocks> userList;
		
		Double sum = stocksDao.Profit();
		System.out.println(sum + "sum");
		Double buyprice = stocksDao.Totalbuy();
		System.out.println(buyprice + "buyprice");
		m.addAttribute("sum", sum);
		m.addAttribute("buyprice", buyprice);
		m.addAttribute("pages", "stock");
		
		if (page == null) {
			userList = new PagedListHolder<Stocks>();
			List<Stocks> usersList = stocksDao.getAll();
			System.out.println(usersList);
			// Setting the source for PagedListHolder
			userList.setSource(usersList);
			userList.setPageSize(8);
			// Setting PagedListHolder instance to session
			request.getSession().setAttribute("userList", userList);
		} else if (page.equals("prev")) {
			// get the user list from session
			userList = (PagedListHolder<Stocks>) request.getSession().getAttribute("userList");
			// switch to previous page
			userList.previousPage();
		} else if (page.equals("next")) {
			userList = (PagedListHolder<Stocks>) request.getSession().getAttribute("userList");
			// switch to next page
			userList.nextPage();
		} else {
			int pageNum = Integer.parseInt(page);
			userList = (PagedListHolder<Stocks>) request.getSession().getAttribute("userList");
			// set the current page number
			// page number starts from zero in PagedListHolder that's why subtracting 1
			userList.setPage(pageNum - 1);
		}

		mv.setViewName("stock");
		return mv;
	}

	

	@RequestMapping("/mummystock")
	public String mummystock(Model m) {

		String page = "mummystock";
		List<Stocks> stocks = stocksDao.getMummystock();
		Double sum = stocksDao.mummyProfit();
		System.out.println(sum + "sum");
		Double buyprice = stocksDao.Totalbuymummy();
		System.out.println(buyprice + "buyprice");
		m.addAttribute("stocks", stocks);
		m.addAttribute("sum", sum);
		m.addAttribute("buyprice",buyprice);
		m.addAttribute("page", page);

		return "stock";
	}

	@RequestMapping("/addstock")
	public String addstock(Model m) {
		List<Accounttype> list = accountDao.getAll();
		m.addAttribute("type", list);
		m.addAttribute("page", "addstock");
		return "stock";
	}

	@RequestMapping(value = "/saveStock", method = RequestMethod.POST)
	public String saveStock(Model m, @ModelAttribute("stock") Stocks s) {
		System.out.println(s);
		stocksDao.save(s);
		m.addAttribute("msg", "successfully added");
		return "stock";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model m, @RequestParam("search") String name) {
		String page = "search";
		List<Stocks> searchresult = stocksDao.getStockBySearch(name);
		System.out.println(searchresult+"searchresult");
		m.addAttribute("searchresult", searchresult);
		m.addAttribute("page", page);
		return "search";
	}
	
	@RequestMapping(value = "/searchmummy", method = RequestMethod.POST)
	public String searchmummy(Model m, @RequestParam("search") String name) {
		String page = "searchmummy";
		List<Stocks> searchresult = stocksDao.getStockBySearchMummy(name);
		System.out.println(searchresult+"searchresult");
		m.addAttribute("searchresult", searchresult);
		m.addAttribute("page", page);
		return "search";
	}

	@RequestMapping("/updateStock/{id}")
	public String updateStock(@PathVariable("id") int id, Model m) {

		Stocks stock = stocksDao.getStock(id);
		System.out.println(stock + "stock");
		m.addAttribute("stock", stock);
		m.addAttribute("aid", stock.getA_id());
		Accounttype name = accountDao.getName(stock.getA_id());
		m.addAttribute("name", name.getName());
		return "updatestock";
	}

	@RequestMapping("deleteStock/{id}")
	public RedirectView deleteStock(@PathVariable("id") int id, HttpServletRequest request) {

		stocksDao.deletestock(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}

}
