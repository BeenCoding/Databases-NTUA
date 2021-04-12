<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page import="packedup.*"%>

<%

String shopid = request.getParameter("storeId");

if(shopid == null) {
	throw new Exception("Bad Request!");
}

StoreService storeservice = new StoreService();

Store store = storeservice.getStoreByID(shopid);

if(store == null) {
	throw new Exception("Store not found");
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
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-xl-2 my-5" style="width: 1px;"><a href="shops.jsp"><i class="fa fa-chevron-left my-4" style="color: rgb(0,0,0);"></i></a></div>
                <div class="col-md-7">
                    <h1 class="display-4 mx-5 my-5">Edit Store with ID: <%=shopid%></h1>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-5 col-xl-5 offset-xl-4 my-5 align">
        <form class="table table-striped" method="POST" action ="/Team7/Project/update-shop.jsp">
            <table>
                <tbody class="text-left text-primary">
				    <tr>
                        <td style="color: rgb(0,0,0);">Store ID:</td>
                        <td><input type="text" pattern="^[0-9]*$" name ="storeID" value ="<%=store.getStoreId()%>" style="width: 350px;height: 40px;" readonly></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(0,0,0);">Operating Hours:</td>
                        <td><input type="text" name ="ophours" value ="<%=store.GetOperatingHours()%>" style="width: 350px;height: 40px;"></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(0,0,0);">Size:</td>
                        <td><input type="tel" name ="ssize" value ="<%=store.getSize()%>" style="width: 350px;height: 40px;" max="99999999999" required></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(0,0,0);">Street:</td>
                        <td><input type="text" name ="sstreet" value ="<%=store.getStreet()%>" style="width: 350px;height: 40px;" required></td>
                    </tr>
                    <tr>
                        <td class="text-dark">Number:</td>
                        <td><input type="text" name ="snumber" value ="<%=store.getNumber()%>" style="width: 350px;height: 40px;" required></td>
                    </tr>
                    <tr>
                        <td class="text-dark">Postal Code:</td>
                        <td><input type="text" min = "1000" max = "9999" name ="spostal" value ="<%=store.getPostal()%>" style="width: 350px;height: 40px;" required></td>
                    </tr>
                    <tr>
                        <td class="text-dark">City:</td>
                        <td><input type="text" pattern="^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$" name ="scity" value ="<%=store.getCity()%>" style="width: 350px;height: 40px;" maxlength="45" required></td>
                    </tr>
                </tbody>
            </table>
        <div class="row my-4">
            <div class="col"><button type="submit" class="btn btn-success float-right" onclick="return confirm('Update store <%=store.getStoreId()%>?');">Update</button></div>
            <div class="col"><button type="reset" class="btn btn-secondary text-left" onclick="return confirm('Discard input?');">Discard</button></div>
        </div>
        </form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>