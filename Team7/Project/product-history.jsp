<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>


<%
    String barcode = request.getParameter("barcode");
    if (barcode == null) {
        throw new Exception("Bad Request!");
    }
    HistoryService hs = new HistoryService();

    List<History> allh = hs.getHistoryByID(barcode);

    ProductService ps = new ProductService();
    Product p = ps.getByID(barcode);

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


<div class="container col-5">
    <div>
        <div class="row">
            <div class="col-md-6 col-xl-3 my-5" style="width: 1px;"><a href="products.jsp"><i
                    class="fa fa-chevron-left my-4" style="color: rgb(0,0,0);"></i></a></div>
            <div class="col-md-7">
                <h1 class="display-4 my-5">History of product with ID: <%= barcode %>
                </h1>
            </div>
        </div>
        <div class="col-7 mx-5">
            <div class="col">
                <a type="button" href="<%= request.getContextPath() %>/Project/delete-history.jsp?barcode=<%=barcode %>"
                   onclick="return confirm('Are you sure you want to delete this record of history?');"
                   class="btn btn-danger btn-sm"
                   title="Delete History ">
                    <span class="fa fa-trash"></span> Clear all history
                </a>
            </div>
        </div>

    </div>
</div>


<div>
    <div class="container col-5">
        <div class="row">
            <div class="col-md-12 col-xl-10 offset-xl-1">
                <div class="table-responsive my-4">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th style="text-align:center"><h5>Start Date</h5></th>
                            <th style="text-align:center"><h5>Price</h5></th>
                            <th style="text-align:center"><h5>End Date</h5></th>
                            <th style="text-align:center"><h5>Barcode</h5></th>
                        </tr>
                        </thead>
                        <tbody>
                            <%
					int counter = 0;
					for(History history : allh){ %>
                        <tr>
                            <td style="text-align:center"><%=history.getStartDate() %>
                            </td>
                            <td style="text-align:center"><%=history.getPrice() %>
                            </td>
                            <td style="text-align:center"><%=history.getEndDate() %>
                            </td>
                            <td style="text-align:center"><%=history.getBarcode() %>
                            </td>
                        </tr>
                </div>
            </div>
        </div>
    </div

    <% }
        if (allh.size() == 0) {
    %>
    <tr>
        <td class="text-warning text-center" colspan="8">
            <b>No history found.</b>
        </td>
    </tr>

    <% } %>
    </tbody>
    </table>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>