<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>


<%
    String storeId = request.getParameter("storeId");

    StoreService ss = new StoreService();

    List<Store> stores = ss.getStores();

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
<div>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-xl-4 my-5" style="width: 1px;"><a
                    href="add-store-phone.jsp?storeId=<%=storeId%>"><i class="fa fa-chevron-left my-4"
                                                                       style="color: rgb(0,0,0);"></i></a></div>
            <div class="col-md-6">
                <h2 class="display-4 my-5">Add Phone </h2>
            </div>
        </div>
    </div>
</div>
<div class="col-md-5 col-xl-6 offset-xl-4 my-3 align">
    <form class="table table-striped" method="POST" action="/Team7/Project/insert-phone-shop-controller.jsp">
        <table>
            <tbody class="text-left text-primary">
            <tr>
                <td style="color: rgb(0,0,0);">Telephone number:</td>
                <td><input type="number" name="telnumber" style="width: 420px;height: 40px; "></td>
            </tr>
            <tr>
                <td class="text-dark">Store:</td>
                <td>
                    <select name="shopid" style="width: 420px;height: 40px;">
                        <optgroup label="-Select a shop-">
                            <% for (Store s : stores) { %>
                            <option value="<%=s.getStoreId() %>"> Store <%=s.getStoreId() %>
                            </option>
                            <% } %>
                        </optgroup>
                    </select>
                </td>
            </tr>


            </tbody>
        </table>
        <div class="row my-4">
            <div class="col">
                <button type="submit" class="btn btn-success float-right"
                        onclick="return confirm('Insert telephone in shop?');">Submit
                </button>
            </div>
            <div class="col">
                <button type="reset" class="btn btn-secondary text-left" onclick="return confirm('Discard input?');">
                    Discard
                </button>
            </div>
        </div>
    </form>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>