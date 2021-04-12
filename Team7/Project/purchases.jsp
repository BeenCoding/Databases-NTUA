<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>

<%
	String shopname= request.getParameter("shopname");
	String datestart= request.getParameter("datestart");
	String dateend= request.getParameter("dateend");
	String tpieces= request.getParameter("tpieces");
	String tcost= request.getParameter("tcost");
	String paymethod= request.getParameter("paymethod");
	String cat= request.getParameter("cat");
	PurchasesService purchservices = new PurchasesService();

	List <Purchases> purchases = purchservices.PurchasesFilter(shopname,datestart,dateend,tpieces,tcost,paymethod,cat);

	StoreService ss= new StoreService();

	List <Store> stores = ss.getStores();

%>




<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>ProjectX</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/Projects-Horizontal.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <div class="container">
            <nav class="navbar navbar-light navbar-expand-md navigation-clean-search">
                <div class="container col-7 text-center"><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav">

                            <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp">User Panel</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link" href="clients.jsp">Clients</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link" href="shops.jsp">Stores</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link" href="products.jsp">Products</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link" href="information.jsp">Advanced Information</a></li>
                        </ul>
                        <form class="form-inline mr-auto" target="_self">
                            <div class="form-group"><label for="search-field"></label></div>
                        </form>
                    </div>
                </div>
            </nav>
            <div class = "col-12">
				<h1 class="display-4 text-center">Purchases Search</h1>
			</div>
    </div>
    <div>
        <div class="container col-10">
            <div class="row my-5">
                <div class="col-md-6 col-xl-4">
                    <form method ="post" action ="/Team7/Project/purchases.jsp">
                        <table class="table table-striped">
							<thead>
                                <tr>
                                    <th>Criteria</th>
                                    <th>Value</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Store</td>
                                    <td>
										<select class="border-dark" name="shopname" style="width: 180px;">
											<optgroup label="-Select a store-">
											<option value="" selected=""></option>
											<% 	for(Store s: stores) { %>
												<option value="<%=s.getStoreId() %>"> Store <%=s.getStoreId() %></option>
											<% 	} %>
											</optgroup>
										</select>
									</td>
                                </tr>
                                <tr>
                                    <td>Start Date</td>
                                    <td><input type="date" name="datestart" style="width: 180px;"></td>
                                </tr>
								<tr>
                                    <td>End Date</td>
                                    <td><input type="date" name="dateend" style="width: 180px;"></td>
                                </tr>
                                <tr>
                                    <td>Total Pieces</td>
                                    <td><input type="text" name="tpieces" style="width: 180px;"></td>
                                </tr>
                                <tr>
                                    <td>Total Cost</td>
                                    <td><input type="text" name ="tcost" style="width: 180px;"></td>
                                </tr>
                                <tr>
                                    <td>Payment Method</td>
                                    <td>
										<select name = "paymethod" style="width: 180px;">
											<optgroup label="-Select an option-">
												<option value="" selected=""></option>
												<option value="Cash" >Cash</option>
												<option value="Credit Card">Credit Card</option>
											</optgroup>
										</select>
									</td>
                                </tr>
                                <tr>
                                    <td>Category</td>
                                    <td>
										<select name ="cat" style="width: 180px;">
											<optgroup label="-Select an option-">
												<option value="" selected=""></option>
												<option value="1" >Fresh Products</option>
												<option value="2">Refrigerator Products</option>
												<option value="3">Liquor Products</option>
												<option value="4">Personal Care Products</option>
												<option value="5">House Products</option>
												<option value="6">Pet Products</option>
											</optgroup>
										</select>
									</td>
                                </tr>
                            </tbody>
                        </table>
						<div>
							<button class="btn btn-success btn-sm pull-right mx-3" type="submit" style="margin: 0px;">Search</button>
							<br>
							<br>
							<p style="color:orange"><sub><b>Tip:</b> By leaving form empty, query retrieves all transactions!</sub></p>
						</div>
					</form>
				</div>

                <div class="col-md-6 col-xl-8">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th style="text-align:center">Datetime</th>
                                    <th style="text-align:center">Store ID</th>
                                    <th style="text-align:center">Card ID</th>
                                    <th style="text-align:center">Way of Payment</th>
                                    <th style="text-align:center">Total Pieces</th>
                                    <th style="text-align:center">Total Cost</th>
                                </tr>
								
                            </thead>
                            <tbody>
							<%
	int counter = 0;
	for(Purchases purchase: purchases){ %>
				<tr>
					<td style="text-align:center"> <%=purchase.getDatetime() %></td>
					<td style="text-align:center"> <%=purchase.getStoreId() %></td>
					<td style="text-align:center"> <%=purchase.getCardId() %></td>
					<td style="text-align:center"> <%=purchase.getPaymentMethod()%></td>
					<td style="text-align:center"> <%=purchase.getTotalPieces() %></td>
					<td style="text-align:center"> <%=purchase.getTotalPrice() %> €</td>
				</tr>
<% 	} 
	if(purchases.size() == 0) {
%>		
				<tr>
					<td class="text-warning text-center" colspan="8">
						<b>No Matching Purchases found.</b>
					</td>
				</tr>
		
<%	} %>
							</tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>