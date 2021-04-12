<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>

<%

    String card = request.getParameter("cardId");

    if (card == null) {
        throw new Exception("Bad Request!");
    }

    CustomerService custservice = new CustomerService();

    custservice.deleteCustomer(card);

    response.sendRedirect("clients.jsp");

%>
