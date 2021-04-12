<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>


<%
ProductService productservice = new ProductService();

List <Product> products = productservice.getProducts();

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
        <div>
            <nav class="navbar navbar-light navbar-expand-md navigation-clean-search">
                <div class="container col-8 text-center"><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav">
                            <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp">User Panel</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link" href="purchases.jsp">Purchases Search</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link" href="clients.jsp">Clients</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link" href="shops.jsp">Stores</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link" href="information.jsp">Advanced Information</a></li>
                        </ul>
                        <form class="form-inline mr-auto" target="_self">
                            <div class="form-group"><label for="search-field"></label></div>
                        </form>
                    </div>
                </div>
            </nav>
			
			<div class = "col-12">
				<h1 class="display-4 text-center">Products </h1>
			</div>


        </div>
    </div>
	<div class ="container col-10">
			<div class="row my-4">
            <div class="col"><a class="btn btn-dark text-center" role="button" style="height: 50px;text-align: center" href="insert-product.jsp">Add Product</a></div>
			<div class="topnav float-right">
				<div class="search-container">
					<input type="search" style="height: 50px;text-align: center" placeholder="Search in Products.." name="search" id="search">
				</div>
			</div>
		</div>
		<div class="table-responsive my-4">
			<table id = "editable_table" class="table table-striped">
				<thead>
					<tr>
						<th style="text-align:center"><h5>Barcode</h5></th>
						<th style="text-align:center"><h5>Name</h5></th>
						<th style="text-align:center"><h5>Price</h5></th>
						<th style="text-align:center"><h5>Exclusive Brand</h5></th>
						<th style="text-align:center"><h5>First Transaction</h5></th>
						<th style="text-align:center"><h5>Category</h5></th>
						<th style="text-align:center"><h5>Availability</h5></th>
						<th style="text-align:center"><h5><span class="fa fa-book"></span> History</h5></th>
						<th style="text-align:center"><h5><span class="fa fa-flash"></span> Action</h5></th>
					</tr>
				</thead>
				<tbody>
					<%
					int counter = 0;
					for(Product product: products){ %>
								<tr>
									<td style="text-align:center"> <%=product.getBarcode() %></td>
									<td style="text-align:center"> <%=product.GetName() %></td>
									<td style="text-align:center"> <%=product.getPrice() %> €</td>
									<td style="text-align:center"> <%=product.getBrandName() ? "Yes" : "No" %></td>
									<td style="text-align:center"> <%=product.getFirstTransaction() %></td>
									<td style="text-align:center"> <%=product.getCategoryId() %></td>
									<td class="text-center">
										<a href="<%= request.getContextPath() %>/Project/add-product-shop.jsp?barcode=<%=product.getBarcode() %>"
										class="btn btn-light btn-sm"
											title="More">
											<span class="fa fa-edit"></span> More
										</a>
									</td>
									<td class="text-center"  style="width: 120px">
										<a href="<%= request.getContextPath() %>/Project/product-history.jsp?barcode=<%=product.getBarcode() %>"
										class="btn btn-light btn-sm"
											title="See History">
											<span class="fa fa-search"></span>
										</a>
									</td>
									<td class="text-center">
										<a href="<%= request.getContextPath() %>/Project/edit-product.jsp?barcode=<%=product.getBarcode() %>"
										class="btn btn-light btn-sm"
											title="Edit Product">
											<span class="fa fa-edit"></span> Edit
										</a>
										<a type="button" href="<%= request.getContextPath() %>/Project/delete-product.jsp?barcode=<%=product.getBarcode() %>"
										onclick="return confirm('Are you sure you want to delete <%=product.GetName()%> from Products?');"
										class="btn btn-danger btn-sm" 
											title="Delete Product">
											<span class="fa fa-trash"></span> Delete
										</a>										
									</td>
								</tr>
								
				<% 	} 
					if(products.size() == 0) {
				%>		
								<tr>
									<td class="text-warning text-center" colspan="8">
										<b>No Products found.</b>
									</td>
								</tr>
						
				<%	} %>
				</tbody>
			</table>
		</div>
	</div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>

<script>
      $(document).ready(function(){
           $('#search').keyup(function(){
                search_table($(this).val());
           });
           function search_table(value){
                $('#editable_table tr').each(function(){
                     var found = 'false';
                     $(this).each(function(){
                          if($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0)
                          {
                               found = 'true';
                          }
                     });
                     if(found == 'true')
                     {
                          $(this).show();
                     }
                     else
                     {
                          $(this).hide();
                     }
                });
           }
      });
 </script>