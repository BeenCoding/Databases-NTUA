<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%

    String card = request.getParameter("cardId");

    if (card == null) {
        throw new Exception("Bad Request!");
    }

    CustomerService custservice = new CustomerService();

    List<Object> l = custservice.getCustomerByID(card);

    Customer customer = (Customer) l.get(0);

    CustomerDetails customerdetails = (CustomerDetails) l.get(1);

    if (customer == null) {
        throw new Exception("User not found");
    }


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
            <div class="container">
                <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span
                        class="navbar-toggler-icon"></span></button>
                <div class="container col-9 text-center" id="navcol-1">
                    <ul class="nav navbar-nav">
                        <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp">User Panel</a>
                        </li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="purchases.jsp">Purchases
                            Search</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="clients.jsp">Clients</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="shops.jsp">Stores</a></li>
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
        <div class="col-12">
            <h1 class="display-4 text-center">Client with Card ID: <%=customer.getCard()%>&nbsp;</h1>
        </div>
    </div>
</div>
<div>
    <div class="container my-5">
        <div class="row">
            <div class="col-5">
                <form method="POST" action="/Team7/Project/update-client.jsp" class="my-4">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tbody class="text-left text-primary">
                            <tr>
                                <td style="color: rgb(0,0,0);">Card ID:</td>
                                <td><input class="form-control-plaintext" type="number" name="customerCard"
                                           value="<%=customer.getCard()%>" readonly></td>
                            </tr>
                            <tr>
                                <td style="color: rgb(0,0,0);">Points:</td>
                                <td><input class="form-control-plaintext" type="number" name="customerPoints"
                                           value="<%=customer.getPoints()%>"></td>
                            </tr>
                            <tr>
                                <td style="color: rgb(0,0,0);">Name:</td>
                                <td><input type="text" pattern="^([ \u00c0-\u01ffa-zA-Z'\-])+$"
                                           value="<%=customer.getName()%>" name="customerName"
                                           style="width: 265px;height: 40px;"></td>
                            </tr>
                            <tr>
                                <td style="color: rgb(0,0,0);">Date of Birth:</td>
                                <td><input type="date" value="<%=customer.getDOB()%>" name="customerDOB"
                                           style="width: 265px;height: 40px;"></td>
                            </tr>
                            <tr>
                                <td style="color: rgb(0,0,0);">Mobile Number:</td>
                                <td><input type="number" min="95000000" max="99999999" value="<%=customer.getPhone()%>"
                                           name="customerPhone" style="width: 265px;height: 40px;"></td>
                            </tr>
                            <tr>
                                <td style="color: rgb(0,0,0);">Street:</td>
                                <td><input type="text" value="<%=customer.getStreet()%>" name="customerStreet"
                                           style="width: 265px;height: 40px;"></td>
                            </tr>
                            <tr>
                                <td class="text-dark">Number:</td>
                                <td><input type="number" value="<%=customer.getNumber()%>" name="customerNumber"
                                           style="width: 265px;height: 40px;"></td>
                            </tr>
                            <tr>
                                <td class="text-dark">Postal Code:</td>
                                <td><input type="number" min="1000" max="9999" value="<%=customer.getPostal()%>"
                                           name="customerPostal" style="width: 265px;height: 40px;"></td>
                            </tr>
                            <tr>
                                <td class="text-dark">City:</td>
                                <td><input type="text" pattern="^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$"
                                           value="<%=customer.getCity()%>" name="customerCity"
                                           style="width: 265px;height: 40px;"></td>
                            </tr>
                            <tr>
                                <td style="color: rgb(0,0,0);">Family Members:</td>
                                <td><input type="number" value="<%=customer.getFamilyMembers()%>" name="customerFamily"
                                           style="width: 265px;height: 40px;"></td>
                            </tr>
                            <tr>
                                <td style="color: rgb(0,0,0);">Pet:</td>
                                <td>
                                    <select name="customerPet" style="width: 265px;height: 40px;">
                                        <optgroup label="-Select an option-">
                                            <option value="0" <%=(!(customer.getPet())) ? "selected" : ""%> >No</option>
                                            <option value="1" <%=(customer.getPet()) ? "selected" : ""%> >Yes</option>
                                        </optgroup>
                                    </select>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="row pull-right mx-2">
                            <div class="col">
                                <button class="btn btn-success float-right" type="submit"
                                        onclick="return confirm('Update <%=customer.getName()%>?');">Update
                                </button>
                            </div>
                            <div class="col">
                                <button class="btn btn-secondary text-left" type="reset"
                                        onclick="return confirm('Discard changes?');">Discard
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-4 my-2">
                <div class="row">
                    <div class="col">
                        <hr>
                        <div class="mx-2"><h5> Number of stores client visits: <%=customerdetails.getShopCount()%>
                        </h5></div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th><h5>Stores the client visits:</h5></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<Integer> c = customerdetails.getAllShops();
                            for (int cdetails : c) { %>
                        <tr>
                            <td style="text-align:left"> Store <%=cdetails %>
                            </td>
                        </tr>
                        <% }
                            if (c.size() == 0) {
                        %>
                        <tr>
                            <td class="text-warning text-center" colspan="8">
                                <b>No stores the client visits found.</b>
                            </td>
                        </tr>

                        <% } %>
                        </tbody>
                    </table>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th><h5>Most liked products of <%=customer.getName()%>:</h5></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<String> p = customerdetails.getMostLikedProducts();
                            for (String pdetails : p) { %>
                        <tr>
                            <td style="text-align:left"><%=pdetails %>
                            </td>
                        </tr>


                        <% }
                            if (p.size() == 0) {
                        %>
                        <tr>
                            <td class="text-warning text-center" colspan="8">
                                <b>No most liked products found.</b>
                            </td>
                        </tr>

                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-3">
                <div class="table-responsive my-4">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th style="text-align:center"><h5>Stores:</h5></th>
                            <th style="text-align:center"><h5>Usual buy time:</h5></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            Map<Integer, Integer> ch = customerdetails.getCommonHours();
                            for (Map.Entry<Integer, Integer> chdetails : ch.entrySet()) { %>
                        <tr>
                            <td style="text-align:center">Store <%=chdetails.getKey() %>
                            </td>
                            <td style="text-align:center"><%=chdetails.getValue() %>:00</td>
                        </tr>


                        <% }
                            if (ch.size() == 0) {
                        %>
                        <tr>
                            <td class="text-warning text-center" colspan="8">
                                <b>No usual buy time found.</b>
                            </td>
                        </tr>

                        <% } %>
                        </tbody>
                    </table>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th style="text-align:center" colspan="2"><h5>Average purchases per:</h5></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td style="text-align:center"><h6>Week:</h6></td>
                            <td style="text-align:center"><%=customerdetails.getAvgWeek()%> Purchases</td>
                        </tr>
                        <tr>
                            <td style="text-align:center"><h6>Month:</h6></td>
                            <td style="text-align:center"><%=customerdetails.getAvgMonth()%> Purchases</td>
                        </tr>
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