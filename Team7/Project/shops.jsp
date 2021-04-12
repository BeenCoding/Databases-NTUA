<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>


<%
StoreService storeservice = new StoreService();

List <Store> stores = storeservice.getStores();

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
    <div class="container ">
        <div>
            <nav class="navbar navbar-light navbar-expand-md navigation-clean-search">
                <div class="container col-8 text-center"><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navcol-1">
							<ul class="nav navbar-nav">
								<li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp">User Panel</a></li>
								<li class="nav-item" role="presentation"><a class="nav-link" href="purchases.jsp">Purchases Search</a></li>
								<li class="nav-item" role="presentation"><a class="nav-link" href="clients.jsp">Clients</a></li>
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
					<h1 class="display-4 text-center">Stores</h1>
			</div>
		</div>

    </div>
	<div class="container col-10">
			<div class="row my-4">
            <div class="col"><a class="btn btn-dark" role="button" style="height: 50px;text-align: center" href="insert-shop.jsp">Add Store</a></div>
			<div class="topnav float-right">
				<div class="search-container">
					<input type="search" style="height: 50px;text-align: center" placeholder="Search in Stores.." name="search" id="search">
				</div>
			</div>
		</div>
		    <div class="table-responsive my-4">
				<table id="editable_table" class="table table-striped">
					<thead>
						<tr>
							<th style="text-align:center"><h5>Store ID</h5></th>
							<th style="text-align:center"><h5>Operating Hours</h5></th>
							<th style="text-align:center"><h5>Size</h5></th>
							<th style="text-align:center"><h5>Street</h5></th>
							<th style="text-align:center"><h5>Number</h5></th>
							<th style="text-align:center"><h5>Postal Code</h5></th>
							<th style="text-align:center"><h5>City</h5></th>
							<th style="text-align:center"><h5>Phones</h5></th>
							<th style="text-align:center"><h5><span class="fa fa-flash"></span> Action</h5></th>
						</tr>
					</thead>
					<tbody>
						<%
			int counter = 0;
			for(Store store: stores){ %>
						<tr>
							<td style="text-align:center"> <%=store.getStoreId() %></td>
							<td style="text-align:center"> <%=store.GetOperatingHours() %></td>
							<td style="text-align:center"> <%=store.getSize() %> m²</td>
							<td style="text-align:center"> <%=store.getStreet() %></td>
							<td style="text-align:center"> <%=store.getNumber() %></td>
							<td style="text-align:center"> <%=store.getPostal() %></td>
							<td style="text-align:center"> <%=store.getCity() %></td>
							<td class="text-center">
										<a href="<%= request.getContextPath() %>/Project/add-store-phone.jsp?storeId=<%=store.getStoreId() %>"
										class="btn btn-light btn-sm"
											title="All stores">
											<span class="fa fa-phone"></span>
										</a>
									</td>
							<td class="text-center">
								<a href="<%= request.getContextPath() %>/Project/edit-shop.jsp?storeId=<%=store.getStoreId() %>"
								class="btn btn-light btn-sm"
									title="Edit Store">
									<span class="fa fa-edit"></span> Edit
								</a>
								<a href="<%= request.getContextPath() %>/Project/delete-shop.jsp?storeId=<%=store.getStoreId() %>"
								onclick="return confirm('Are you sure you want to delete this Store?');"
								class="btn btn-danger btn-sm" 
									title="Delete Store">
									<span class="fa fa-trash"></span> Delete
								</a>										
							</td>
						</tr>
						
		<% 	} 
			if(stores.size() == 0) {
		%>		
						<tr>
							<td class="text-warning text-center" colspan="8">
								<b>No Stores found.</b>
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