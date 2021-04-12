<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.*" %>

<%

    int StoreId = Integer.parseInt(request.getParameter("storeID"));
    String OpHours = request.getParameter("ophours");
    int Size = Integer.parseInt(request.getParameter("ssize"));
    String Street = request.getParameter("sstreet");
    int Number = Integer.parseInt(request.getParameter("snumber"));
    int Postal = Integer.parseInt(request.getParameter("spostal"));
    String City = request.getParameter("scity");


    StoreService ss = new StoreService();

    Store store = new Store(StoreId, OpHours, Size, Street, Number, Postal, City);
    ss.updateStore(store);
    request.setAttribute("success-message", "Store with StoreId: <b>"
            + StoreId + "</b> updated successfully!");

    String url = "edit-shop.jsp?storeId=" + StoreId;

    response.sendRedirect(url);

%>

