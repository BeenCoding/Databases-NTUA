<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>

<%

    String barcode = request.getParameter("barcode");

    if (barcode == null) {
        throw new Exception("Bad Request!");
    }

    HistoryService hs = new HistoryService();

    hs.deleteHistory(barcode);

    String url = "product-history.jsp?barcode=" + barcode;

    response.sendRedirect(url);
%>
