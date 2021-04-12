<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.Map" %>
<%

    InformationService infs = new InformationService();

    Information informations = infs.getInfo();

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
        <div class="container col-7 text-center">
            <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span
                    class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp">User Panel</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="purchases.jsp">Purchases
                        Search</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="clients.jsp">Clients</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="products.jsp">Products</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="shops.jsp">Stores</a></li>
                </ul>
                <form class="form-inline mr-auto" target="_self">
                    <div class="form-group"><label for="search-field"></label></div>
                </form>
            </div>
        </div>
    </nav>

</div>
<div class="col-12">
    <h1 class="display-4 text-center">Advanced Information</h1>
</div>
<div>
    <div class="container my-5">
        <div class="row">
            <div class="col-md-8">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th colspan="2" style="text-align:center"><h5>Most popular products bought together:</h5>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <td style="text-align:center"><b>Product 1</b></td>
                        <td style="text-align:center"><b>Product 2</b></td>
                        <%
                            HashMap<String, String> hot_duo = informations.getHotPairs();
                            for (HashMap.Entry<String, String> m : hot_duo.entrySet()) { %>
                        <tr>
                            <td style="text-align:center"><%=m.getKey() %>
                            </td>
                            <td style="text-align:center"><%=m.getValue() %>
                            </td>


                        </tr>
                        <% }
                            if (hot_duo.size() == 0) {
                        %>
                        <tr>
                            <td class="text-warning text-center" colspan="8">
                                <b>No hot duos found.</b>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-4 col-xl-4">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th style="text-align:center" colspan="3"><h5>Most popular positions in stores:</h5></th>
                        </tr>
                        <thead>
                        <tbody>
                        <td style="text-align:center"><b>Store</b></td>
                        <td style="text-align:center"><b>Alley</b></td>
                        <td style="text-align:center"><b>Shelf</b></td>
                        <%
                            Map<Integer, List<Integer>> hotpos = informations.getHotPos();
                            for (Map.Entry<Integer, List<Integer>> m : hotpos.entrySet()) { %>
                        <tr>
                            <td style="text-align:center">Store <%=m.getKey() %>
                            </td>
                            <td style="text-align:center"><%=m.getValue().get(0) %>
                            </td>
                            <td style="text-align:center"><%=m.getValue().get(1) %>
                            </td>


                        </tr>
                        <% }
                            if (hotpos.size() == 0) {
                        %>
                        <tr>
                            <td class="text-warning text-center" colspan="8">
                                <b>Not found.</b>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>


<div>
    <div class="container my-5">
        <div class="row">
            <div class="col-md-4 col-xl-4">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th style="text-align:center" colspan="3"><h5>Percentage trusting brand name:</h5></th>
                        </tr>
                        </thead>
                        <tbody>
                        <td style="text-align:center"><b>ID</b></td>
                        <td style="text-align:center"><b>Name</b></td>
                        <td style="text-align:center"><b>Percentage</b></td>
                        <%
                            int counter = 1;
                            Map<String, Float> brandperc = informations.getPercBrand();
                            for (Map.Entry<String, Float> m : brandperc.entrySet()) { %>
                        <tr>
                            <td style="text-align:center"><%=counter%>
                            </td>
                            <td style="text-align:center"><%=m.getKey() %>
                            </td>
                            <td style="text-align:center"><%=m.getValue() %> %</td>


                        </tr>
                        <% counter += 1;
                        }
                            if (brandperc.size() == 0) {
                        %>
                        <tr>
                            <td class="text-warning text-center" colspan="8">
                                <b>Not found.</b>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-5 col-xl-5">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th style="text-align:center" colspan="3"><h5>Avg spend per visit based on Family and
                                Pets:</h5></th>
                        </tr>
                        </thead>
                        <tbody>
                        <td style="text-align:center"><b>Family Members</b></td>
                        <td style="text-align:center"><b>with Pet</b></td>
                        <td style="text-align:center"><b>without Pet</b></td>
                        <%
                            Map<Integer, List<Float>> cq1 = informations.getSpendBasedOnPetAndFam();
                            for (Map.Entry<Integer, List<Float>> m : cq1.entrySet()) { %>
                        <tr>
                            <td style="text-align:center"><%=m.getKey() %>
                            </td>
                            <td style="text-align:center"><%=m.getValue().get(1) %> €</td>
                            <td style="text-align:center"><%=m.getValue().get(0) %> €</td>


                        </tr>
                        <% }
                            if (cq1.size() == 0) {
                        %>
                        <tr>
                            <td class="text-warning text-center" colspan="8">
                                <b>Not found.</b>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-3 col-xl-3">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th style="text-align:center" colspan="2"><h5>Spend on Alcohol:</h5></th>
                        </tr>
                        </thead>
                        <tbody>
                        <td style="text-align:center"><b>Age Range</b></td>
                        <td style="text-align:center"><b>Total</b></td>
                        <%
                            Map<String, Float> cq2 = informations.getSpendOnAlcho();
                            for (Map.Entry<String, Float> m : cq2.entrySet()) { %>
                        <tr>
                            <td style="text-align:center"><%=m.getKey() %>
                            </td>
                            <td style="text-align:center"><%=m.getValue() %> €</td>


                        </tr>
                        <% }
                            if (cq2.size() == 0) {
                        %>
                        <tr>
                            <td class="text-warning text-center" colspan="8">
                                <b>Not found.</b>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>


<div>
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-xl-5 offset-xl-0">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th style="text-align:center" colspan="2"><h5>Revenue per hour in all stores:</h5></th>
                        </tr>
                        </thead>
                        <tbody>
                        <td style="text-align:center"><b>Hour</b></td>
                        <td style="text-align:center"><b>Amount</b></td>
                        <%
                            HashMap<Integer, Float> rev_per_hour = informations.getRevenuePerHour();
                            for (HashMap.Entry<Integer, Float> m : rev_per_hour.entrySet()) { %>
                        <tr>
                            <td style="text-align:center"><%=m.getKey() %>:00 - <%=m.getKey() + 1%>:00</td>
                            <td style="text-align:center"><%=m.getValue() %> €</td>


                        </tr>
                        <% }
                            if (rev_per_hour.size() == 0) {
                        %>
                        <tr>
                            <td class="text-warning text-center" colspan="8">
                                <b>Not found.</b>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-7 col-xl-7 offset-xl-0">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th style="text-align:center" colspan="4"><h5>Percentage of elderly groups visiting
                                stores:</h5></th>
                        </tr>
                        </thead>
                        <tbody>
                        <td style="text-align:center"><b>Hour</b></td>
                        <td style="text-align:center"><b>Younger than 35</b></td>
                        <td style="text-align:center"><b>Between 35 and 65</b></td>
                        <td style="text-align:center"><b>Older than 65</b></td>
                        <%
                            HashMap<Integer, List<Float>> elderly = informations.getElderlyGroups();
                            for (HashMap.Entry<Integer, List<Float>> m : elderly.entrySet()) { %>
                        <tr>
                            <td style="text-align:center"><%=m.getKey() %>:00 - <%=m.getKey() + 1%>:00</td>
                            <td style="text-align:center"><%=m.getValue().get(0) %> %</td>
                            <td style="text-align:center"><%=m.getValue().get(1) %> %</td>
                            <td style="text-align:center"><%=m.getValue().get(2) %> %</td>


                        </tr>
                        <% }
                            if (elderly.size() == 0) {
                        %>
                        <tr>
                            <td class="text-warning text-center" colspan="8">
                                <b>Not found.</b>
                            </td>
                        </tr>
                        <% } %>
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