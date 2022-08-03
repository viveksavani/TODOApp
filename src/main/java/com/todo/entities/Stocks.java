package com.todo.entities;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Stocks {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String buydate;
	private String selldate;
	private Double buyprice;
	private Double sellprice;
	private Double profit;
	private Double buyquantity;
	private Double sellquantity;
	private Double buytotal;
	private Double selltotal;
	private int a_id;
	
	
	
	public int getA_id() {
		return a_id;
	}

	@Override
	public String toString() {
		return "Stocks [id=" + id + ", name=" + name + ", buydate=" + buydate + ", selldate=" + selldate + ", buyprice="
				+ buyprice + ", sellprice=" + sellprice + ", profit=" + profit + ", buyquantity=" + buyquantity
				+ ", sellquantity=" + sellquantity + ", buytotal=" + buytotal + ", selltotal=" + selltotal + ", a_id="
				+ a_id + "]";
	}

	public Stocks(int id, String name, String buydate, String selldate, Double buyprice, Double sellprice,
			Double profit, Double buyquantity, Double sellquantity, Double buytotal, Double selltotal, int a_id) {
		super();
		this.id = id;
		this.name = name;
		this.buydate = buydate;
		this.selldate = selldate;
		this.buyprice = buyprice;
		this.sellprice = sellprice;
		this.profit = profit;
		this.buyquantity = buyquantity;
		this.sellquantity = sellquantity;
		this.buytotal = buytotal;
		this.selltotal = selltotal;
		this.a_id = a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBuydate() {
		return buydate;
	}

	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}

	public String getSelldate() {
		return selldate;
	}

	public void setSelldate(String selldate) {
		this.selldate = selldate;
	}

	public Double getBuyprice() {
		return buyprice;
	}

	public void setBuyprice(Double buyprice) {
		this.buyprice = buyprice;
	}

	public Double getSellprice() {
		return sellprice;
	}

	public void setSellprice(Double sellprice) {
		this.sellprice = sellprice;
	}

	public Double getProfit() {
		return profit;
	}

	public void setProfit(Double profit) {
		this.profit = profit;
	}

	
	public Stocks() {
		// TODO Auto-generated constructor stub
	}

	public Double getBuyquantity() {
		return buyquantity;
	}

	public void setBuyquantity(Double buyquantity) {
		this.buyquantity = buyquantity;
	}

	public Double getSellquantity() {
		return sellquantity;
	}

	public void setSellquantity(Double sellquantity) {
		this.sellquantity = sellquantity;
	}

	public Double getBuytotal() {
		return buytotal;
	}

	public void setBuytotal(Double buytotal) {
		this.buytotal = buytotal;
	}

	public Double getSelltotal() {
		return selltotal;
	}

	public void setSelltotal(Double selltotal) {
		this.selltotal = selltotal;
	}
}
