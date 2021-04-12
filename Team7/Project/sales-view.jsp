<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>


<%
    SalesService saleservice = new SalesService();

    List<Sales> sales = saleservice.getSalesView();

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
            <div class="container col-9 text-center">
                <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span
                        class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav">
                        <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp">User Panel</a>
                        </li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="purchases.jsp">Purchases
                            Search</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="shops.jsp">Stores</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="clients.jsp">Clients</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="products.jsp">Products</a>
                        </li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="information.jsp">Advanced
                            Information</a></li>
                    </ul>
                    <form class="form-inline mr-auto" target="_self">
                        <div class="form-group"><label for="search-field"></label></div>
                    </form>
                </div>
            </div>

        </nav>
        <div class="col=12">
            <h1 class="display-4 text-center">Sales View</h1>
        </div>

    </div>
</div>

<div class="container col-5">
    <div class="topnav float-right">
        <div class="search-container">
            <input type="search" style="height: 50px;text-align: center" placeholder="Search in Sales View.."
                   name="search" id="search">
        </div>
    </div>
    <div class="table-responsive my-4 ">
        <table id="editable_table" class="table table-striped">
            <thead>
            <tr>
                <th style="text-align:center"><h5>Store ID</h5></th>
                <th style="text-align:center"><h5>Category ID</h5></th>
                <th style="text-align:center"><h5>Category Name</h5></th>
                <th style="text-align:center"><h5>&nbsp;Total Amount</h5></th>
            </tr>
            </thead>
            <tbody>
            <%
                int counter = 0;
                for (Sales sale : sales) { %>
            <tr>
                <td style="text-align:center"><%=sale.getStore() %>
                </td>
                <td style="text-align:center"><%=sale.getCategory() %>
                </td>
                <td style="text-align:center"><%=sale.getCategoryName() %>
                </td>
                <td style="text-align:center"><%=sale.getTotalAmount() %> €</td>
            </tr>

            <% }
                if (sales.size() == 0) {
            %>
            <tr>
                <td class="text-warning text-center" colspan="8">
                    <b>No Sales found.</b>
                </td>
            </tr>

            <% } %>

            </tbody>
        </table>
    </div>

</div>


<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>


<script>
    $(document).ready(function () {
        $('#search').keyup(function () {
            search_table($(this).val());
        });

        function search_table(value) {
            $('#editable_table tr').each(function () {
                var found = 'false';
                $(this).each(function () {
                    if ($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0) {
                        found = 'true';
                    }
                });
                if (found == 'true') {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }
    });
</script>