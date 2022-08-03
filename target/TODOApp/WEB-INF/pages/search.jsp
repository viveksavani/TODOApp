<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="base.jsp"%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



	<c:if test="${page=='search'}">
		<h1 class="text-center">ALL Search Stocks</h1>
		<c:forEach var="s" items="${searchresult}">
			<div class="card-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Stock Name</th>
							<th scope="col">Buy Date</th>
							<th scope="col">Buy Qty</th>
							<th scope="col">Buy Price</th>
							<th scope="col">Buy Total</th>
							<th scope="col">Sell Date</th>
							<th scope="col">Sell Qty</th>
							<th scope="col">Sell Price</th>
							<th scope="col">Sell Total</th>
							<th scope="col">Profit</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">${s.id}</th>
							<td>${s.name}</td>
							<td>${s.buydate }</td>
							<td>${s.buyquantity }</td>
							<td>${s.buyprice }</td>
							<td>${s.buytotal }</td>
							<td>${s.selldate }</td>
							<td>${s.sellquantity }</td>
							<td>${s.sellprice }</td>
							<td>${s.selltotal }</td>
							<td>${s.profit}</td>
						</tr>
					</tbody>
				</table>
				<a href="deleteStock/${s.id}"><button type="submit"
						class="btn btn-outline-danger ">Delete Stock</button></a> <a
					href="updateStock/${s.id}"><button type="submit"
						class="btn btn-outline-primary ">Update Todo</button></a>

			</div>
		</c:forEach>
		<h5>Total Profit :${sum}</h5>
	</c:if>


	<c:if test="${page=='searchmummy'}">
		<h1 class="text-center">ALL Search Stocks</h1>
		<c:forEach var="s" items="${searchresult}">
			<div class="card-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Stock Name</th>
							<th scope="col">Buy Date</th>
							<th scope="col">Buy Qty</th>
							<th scope="col">Buy Price</th>
							<th scope="col">Buy Total</th>
							<th scope="col">Sell Date</th>
							<th scope="col">Sell Qty</th>
							<th scope="col">Sell Price</th>
							<th scope="col">Sell Total</th>
							<th scope="col">Profit</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">${s.id}</th>
							<td>${s.name}</td>
							<td>${s.buydate }</td>
							<td>${s.buyquantity }</td>
							<td>${s.buyprice }</td>
							<td>${s.buytotal }</td>
							<td>${s.selldate }</td>
							<td>${s.sellquantity }</td>
							<td>${s.sellprice }</td>
							<td>${s.selltotal }</td>
							<td>${s.profit}</td>
						</tr>
					</tbody>
				</table>
				<a href="deleteStock/${s.id}"><button type="submit"
						class="btn btn-outline-danger ">Delete Stock</button></a> <a
					href="updateStock/${s.id}"><button type="submit"
						class="btn btn-outline-primary ">Update Todo</button></a>

			</div>
		</c:forEach>
		<h5>Total Profit :${sum}</h5>
	</c:if>


</body>
</html>