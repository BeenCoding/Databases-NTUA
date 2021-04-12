<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>


<%
    String barcode = request.getParameter("barcode");

    StoreService ss = new StoreService();

    List<Store> stores = ss.getStores();

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
<div>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-xl-2 my-5" style="width: 1px;"><a href="add-product-shop.jsp?barcode=<%=barcode%>"><i
                    class="fa fa-chevron-left my-4" style="color: rgb(0,0,0);"></i></a></div>
            <div class="col-md-10">
                <h2 class="display-4 my-5">Add <%=p.GetName()%>
                </h2>
            </div>
        </div>
    </div>
</div>
<div align="center">
    <div class="col-4">
        <form class="table table-striped" method="POST" action="/Team7/Project/insert-product-shop-controller.jsp">
            <table>
                <tbody class="text-left text-primary">
                <tr>
                    <td style="color: rgb(0,0,0);">Barcode:</td>
                    <td><input type="number" name="barcode" value="<%=barcode%>" style="width: 420px;height: 40px; "
                               readonly></td>
                </tr>
                <tr>
                    <td class="text-dark">Shelf:</td>
                    <td><input type="number" name="shelf" style="width: 420px;height: 40px;"></td>
                </tr>
                <tr>
                    <td class="text-dark">Alley:</td>
                    <td><input type="number" name="alley" style="width: 420px;height: 40px;"></td>
                </tr>
                <tr>
                    <td class="text-dark">Shop:</td>
                    <td>
                        <select name="shopid" style="width: 420px;height: 40px;">
                            <optgroup label="-Select a shop-">
                                <% for (Store s : stores) { %>
                                <option value="<%=s.getStoreId() %>"> Shop <%=s.getStoreId() %>
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
                            onclick="return confirm('Insert <%=p.GetName()%> in shop?');">Submit
                    </button>
                </div>
                <div class="col">
                    <button type="reset" class="btn btn-secondary text-left"
                            onclick="return confirm('Discard input?');">Discard
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>