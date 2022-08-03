<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<%@include file="base.jsp"%>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<script type="text/javascript">
	$(document).ready(function() {
		//	 $('#profit1').attr('disabled', 'disabled');
		function profit() {
			var buyq = $("#buyq").val();
			var sellq = $("#sellq").val();
			var sell = $("#sell").val();
			var buy = $("#buy").val();

			var buyprice = parseFloat(buyq) * parseFloat(buy);
			var sellprice = parseFloat(sellq) * parseFloat(sell);

			var profit = parseFloat(sellprice) - parseFloat(buyprice);

			var buytotal = $("#buytotal").val(buyprice);
			var selltotal = $("#selltotal").val(sellprice);

			console.log(buyq + "buy quantity");
			console.log(buyprice + " buy price");
			console.log(sellq + "sell quanitity");
			console.log(sellprice + "sell price");
			console.log(profit + "profit");
			var p = profit.toFixed(2);
			$("#profit1").val(p);
		}

		$("#buyq").blur(function() {
			profit();
		});
		$("#buy").blur(function() {
			profit();
		});
		$("#sellq").blur(function() {
			profit();
		});
		$("#sell").blur(function() {
			profit();
		});

		$("#searchstock").keyup(function() {
			var search = $("#searchstock").val();

			$.ajax({
				url : "search",
				method : "POST",
				data : {
					search : search
				},
				success : function(data) {
					//$("#stock").fadeOut();
					$("#stockvivek").html(data);
				}
			});
		});

		$("#searchmummy").keyup(function() {
			var search = $("#searchmummy").val();

			if (search === "") {
				$("#msg").html("this is a required.");
				return false;
			} else {
				$("#error").html("");
				$.ajax({
					url : "searchmummy",
					method : "POST",
					data : {
						search : search
					},
					success : function(data) {
						//$("#stock").fadeOut();
						$("#stockmummy").html(data);
					}
				});
			}
		});

	});
</script>
<%-- <c:if test="${page =='add'}">
<title>Add TODO</title>
</c:if> --%>
<title><c:out value="${page }"></c:out></title>
</head>
<body>

	<div class="container mt-3">
		<h1 class="text-center">Welcome to TODO Manager</h1>


		<c:if test="${not empty msg}">

			<div class="alert alert-success">
				<b><c:out value="${msg}"></c:out></b>
			</div>
		</c:if>


		<div class="row mt-5">

			<div class="col-md-2">

				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action active">Menu</a>
					<a href='<c:url value='/addstock'/>'
						class="list-group-item list-group-item-action">Add Stocks</a> <a
						href='<c:url value='/stock'/>'
						class="list-group-item list-group-item-action">View Vivek
						Stocks</a> <a href='<c:url value='/mummystock'/>'
						class="list-group-item list-group-item-action">View Mummy
						Stocks</a>
				</div>

			</div>
			<div class="col-md-10">

				<div id="stock">
					<c:if test="${pages=='stock'}">
						<nav class="navbar navbar-light bg-light">
							<div class="form-inline">
								<input class="form-control mr-sm-2" type="search" name="search"
									id="searchstock" placeholder="Search" aria-label="Search">
								<button class="btn btn-outline-success my-2 my-sm-0" id="search"
									type="submit">Search</button>
							</div>
						</nav>
						<div id="stockvivek">
							<h1 class="text-center">ALL Vivek Stocks</h1>
							<c:set value="${userList}" var="userPageList" />
							<c:forEach items="${userPageList.pageList}" var="s">
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
											class="btn btn-outline-danger btn-sm ">
											<i class="fa fa-trash"></i>Delete Stock
										</button></a> <a href="updateStock/${s.id}"><button type="submit"
											class="btn btn-outline-primary btn-sm ">
											<i class="fa fa-bars"></i>Update Todo
										</button></a>
								</div>
							</c:forEach>
							<div class="">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										<c:choose>
											<c:when test="${userPageList.firstPage}">
												<li class="page-item"><a class="page-link" href="#">Previous</a></li>
											</c:when>
											<c:otherwise>
												<c:url value="/prev" var="url" />
												<li class="page-item"><a class="page-link"
													href='<c:out value="${url}" />'>Previous</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach begin="1" end="${userPageList.pageCount}" step="1"
											varStatus="tagStatus">
											<c:choose>
												<c:when test="${(userPageList.page + 1) == tagStatus.index}">
													<li class="page-item"><a class="page-link" href="#">${tagStatus.index}</a></li>
												</c:when>

												<c:otherwise>
													<c:url value="/${tagStatus.index}" var="url" />
													<li class="page-item"><a class="page-link"
														href='<c:out value="${url}" />'>${tagStatus.index}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:choose>
											<c:when test="${userPageList.lastPage}">
												<li class="page-item"><a class="page-link" href="#">Next</a></li>
											</c:when>
											<c:otherwise>
												<c:url value="/next" var="url" />
												<li class="page-item"><a class="page-link"
													href='<c:out value="${url}" />'>Next</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</nav>
							</div>


							<h5>Total Profit :${sum}</h5>
							<h5>Total InvestMent :${buyprice}</h5>

						</div>
					</c:if>
				</div>

				<div id="stock">
					<c:if test="${page=='stock'}">
						<nav class="navbar navbar-light bg-light">
							<div class="form-inline">
								<input class="form-control mr-sm-2" type="search" name="search"
									id="searchstock" placeholder="Search" aria-label="Search">
								<button class="btn btn-outline-success my-2 my-sm-0" id="search"
									type="submit">Search</button>
							</div>
						</nav>
						<div id="stockvivek">
							<h1 class="text-center">ALL Vivek Stocks</h1>
							<c:forEach var="s" items="${stocks}">
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
											class="btn btn-outline-danger ">
											<i class="fa fa-trash"></i>Delete Stock
										</button></a> <a href="updateStock/${s.id}"><button type="submit"
											class="btn btn-outline-primary ">
											<i class="fa fa-bars"></i>Update Todo
										</button></a>

								</div>
							</c:forEach>
							<h5>Total Profit :${sum}</h5>
							<h5>Total InvestMent :${buyprice}</h5>

						</div>
					</c:if>
				</div>

				<div id="mummystock">
					<c:if test="${page=='mummystock'}">
						<nav class="navbar navbar-light bg-light">
							<div class="form-inline">
								<input class="form-control mr-sm-2" type="search" name="search"
									id="searchmummy" placeholder="Search" aria-label="Search">
								<button class="btn btn-outline-success my-2 my-sm-0" id="search"
									type="submit">Search</button>
							</div>
						</nav>
						<div id="stockmummy">
							<h1 class="text-center">ALL Mummy Stocks</h1>
							<c:forEach var="s" items="${stocks}">
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
											class="btn btn-outline-danger ">
											<i class="fa fa-trash"></i>Delete Stock
										</button></a> <a href="updateStock/${s.id}"><button type="submit"
											class="btn btn-outline-primary ">
											<i class="fa fa-bars"></i>Update Todo
										</button></a>

								</div>
							</c:forEach>
							<h5>Total Profit :${sum}</h5>
							<h5>Total InvestMent :${buyprice}</h5>
						</div>
					</c:if>
				</div>

				<div class="addstock">
					<c:if test="${page=='addstock'}">
						<h1 class="text-center">Add Stocks</h1>
						<br>
						<form action="saveStock" method="post">
							<div class="form-group">
								<label for="formGroupExampleInput">Stock Name</label> <input
									type="text" class="form-control" name="name"
									placeholder="Enter Your Stock Name" />
							</div>
							<div class="form-group">
								<label for="formGroupExampleInput">Stock Buy Date</label> <input
									type="date" class="form-control" name="buydate"
									placeholder="Enter Your Todo Title" />
							</div>

							<div class="form-group">
								<label for="formGroupExampleInput">Stock Buy Quantity</label> <input
									type="text" id="buyq" class="form-control" name="buyquantity"
									placeholder="Enter Your Buy Quatity " />
							</div>

							<div class="form-group">
								<label for="formGroupExampleInput">Stock Buy Price</label> <input
									type="text" id="buy" class="form-control" name="buyprice"
									placeholder="Enter Your Buy Rate " />
							</div>

							<div class="form-group">
								<label for="formGroupExampleInput">Stock Buy Total Price</label>
								<input type="text" id="buytotal" class="form-control"
									name="buytotal" placeholder="Enter Your Buy Rate " />
							</div>

							<div class="form-group">
								<label for="formGroupExampleInput">Stock Sell Date</label> <input
									type="date" class="form-control" name="selldate"
									placeholder="Enter Your Todo Title" />
							</div>

							<div class="form-group">
								<label for="formGroupExampleInput">Stock Sell Quantity</label> <input
									type="text" id="sellq" class="form-control" name="sellquantity"
									placeholder="Enter Your Sell Quantity " />
							</div>

							<div class="form-group">
								<label for="formGroupExampleInput">Stock Sell Price</label> <input
									type="text" id="sell" class="form-control" name="sellprice"
									placeholder="Enter Your Sell Rate" />
							</div>

							<div class="form-group">
								<label for="formGroupExampleInput">Stock Sell Total
									Price</label> <input type="text" id="selltotal" class="form-control"
									name="selltotal" placeholder="Enter Your Buy Rate " />
							</div>

							<div class="form-group">
								<label for="formGroupExampleInput">Profit</label> <input
									type="text" id="profit1" class="form-control" name="profit"
									placeholder="Enter Your Profit" />
							</div>
							<div class="form-group">
								<select class="form-control" name="a_id" required>
									<option value="">Select Type Of Account</option>
									<c:forEach items="${type}" var="t">
										<option value="${t.a_id}">${t.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<div class="container text-center">
									<button type="submit" class="btn btn-outline-success ">Add
										Stocks</button>
								</div>
							</div>
						</form>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>