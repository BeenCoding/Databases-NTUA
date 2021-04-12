<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>

<%

    String shopid = request.getParameter("storeId");

    if (shopid == null) {
        throw new Exception("Bad Request!");
    }
    StoreService storeservice = new StoreService();

    storeservice.deleteStore(shopid);

    response.sendRedirect("shops.jsp");

%>
