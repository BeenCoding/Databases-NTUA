#
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>


<%
    String storeId = request.getParameter("storeId");
    if (storeId == null) {
        throw new Exception("Bad Request!");
    }
    StorePhonesService sps = new StorePhonesService();

    List<StorePhones> phones = sps.getPhones(storeId);


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
            <div class="col-md-6 col-xl-3 my-5" style="width: 1px;"><a href="shops.jsp"><i
                    class="fa fa-chevron-left my-4" style="color: rgb(0,0,0);"></i></a></div>
            <div class="col-md-7">
                <h1 class="display-4 my-5">Store with ID: <%= storeId %>
                </h1>
            </div>
        </div>

        <div class="row mx-5">
            <div class="col"><a class="btn btn-dark" role="button" href="insert-phone-shop.jsp?storeId=<%=storeId%>">Add
                phone in store</a></div>
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
                            <th style="text-align:center"><h5>Store</h5></th>
                            <th style="text-align:center"><h5>Phone</h5></th>
                            <th style="text-align:center"><h5><span class="fa fa-flash"></span> Action</h5></th>
                        </tr>
                        </thead>
                        <tbody>
                            <%
					int counter = 0;
					for(StorePhones phone : phones){ %>
                        <tr>
                            <td style="text-align:center">Store <%=phone.getStoreId() %>
                            </td>
                            <td style="text-align:center"><%=phone.getPhone() %>
                            </td>
                            <td class="text-center">
                                <a href="<%= request.getContextPath() %>/Project/delete-phone.jsp?phone=<%=phone.getPhone()%>&storeId=<%=phone.getStoreId()%>"
                                   onclick="return confirm('Are you sure you want to delete <%=phone.getPhone()%> from store <%=phone.getStoreId()%>?');"
                                   class="btn btn-danger btn-sm"
                                   title="Delete tel number from store">
                                    <span class="fa fa-trash"></span> Delete
                                </a>
                            </td>
                        </tr>
                </div>
            </div>
        </div>
    </div

    <% }
        if (phones.size() == 0) {
    %>
    <tr>
        <td class="text-warning text-center" colspan="8">
            <b>No phones found.</b>
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