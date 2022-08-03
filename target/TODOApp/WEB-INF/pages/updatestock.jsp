<%@page import="com.todo.entities.Stocks"%>
<%@page import="java.util.Set"%>
<%@page import="com.Dao.AccountDao"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.todo.entities.Accounttype"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
						class="list-group-item list-group-item-action">Add Stock</a> <a
						href='<c:url value='/stock'/>'
						class="list-group-item list-group-item-action">View Stock</a>
				</div>

			</div>
			<div class="col-md-10">
				<h1 class="text-center">ALL TODOS</h1>

				<br>
				<form action="${pageContext.request.contextPath }/saveStock"
					method="post">
					<input type="hidden" name="id" value="${stock.id}">
					<div class="form-group">
						<label for="formGroupExampleInput">Stock Name</label> <input
							type="text" class="form-control" name="name"
							value="${stock.name}" placeholder="Enter Your Stock Name" />
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput">Stock Buy Date</label> <input
							type="date" class="form-control" name="buydate"
							value="${stock.buydate}" placeholder="Enter Your Todo Title" />
					</div>

					<div class="form-group">
						<label for="formGroupExampleInput">Stock Buy Quantity</label> <input
							type="text" id="buyq" class="form-control" name="buyquantity"
							value="${stock.buyquantity}"
							placeholder="Enter Your Buy Quatity " />
					</div>

					<div class="form-group">
						<label for="formGroupExampleInput">Stock Buy Price</label> <input
							type="text" id="buy" class="form-control" name="buyprice"
							value="${stock.buyprice}" placeholder="Enter Your Buy Rate " />
					</div>

					<div class="form-group">
						<label for="formGroupExampleInput">Stock Buy Total Price</label> <input
							type="text" readonly="true" id="buytotal" class="form-control"
							name="buytotal" value="${stock.buytotal}"
							placeholder="Enter Your Buy Rate " />
					</div>

					<div class="form-group">
						<label for="formGroupExampleInput">Stock Sell Date</label> <input
							type="date" class="form-control" name="selldate"
							value="${stock.selldate}" placeholder="Enter Your Todo Title" />
					</div>

					<div class="form-group">
						<label for="formGroupExampleInput">Stock Sell Quantity</label> <input
							type="text" id="sellq" class="form-control" name="sellquantity"
							value="${stock.sellquantity}"
							placeholder="Enter Your Sell Quantity " />
					</div>

					<div class="form-group">
						<label for="formGroupExampleInput">Stock Sell Price</label> <input
							type="text" id="sell" class="form-control" name="sellprice"
							value="${stock.sellprice}" placeholder="Enter Your Sell Rate" />
					</div>

					<div class="form-group">
						<label for="formGroupExampleInput">Stock Sell Total Price</label>
						<input type="text" id="selltotal" class="form-control"
							 name="selltotal" value="${stock.selltotal }"
							placeholder="Enter Your Buy Rate " />
					</div>



					<div class="form-group">
						<select class="form-control" name="a_id" required>
							<option value="">Select Type Of Account</option>
							<%-- 	<c:forEach items="${name}" var="n"> --%>
							<option value="${stock.a_id}">${name}</option>
							<%-- </c:forEach> --%>
						</select>
					</div>

					<div class="form-group">
						<label for="formGroupExampleInput">Profit</label> <input
							type="text" id="profit1" class="form-control"
							value="${stock.profit}" name="profit" id="profit1"
							placeholder="Enter Your Profit" />
					</div>
					<div class="form-group">
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-success ">Update
								Stocks</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>
</html>