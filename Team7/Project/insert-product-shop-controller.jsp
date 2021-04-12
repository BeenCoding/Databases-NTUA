<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>

<%

    int Shelf = Integer.parseInt(request.getParameter("shelf"));
    int Alley = Integer.parseInt(request.getParameter("alley"));
    int Barcode = Integer.parseInt(request.getParameter("barcode"));
    int StoreId = Integer.parseInt(request.getParameter("shopid"));


    OffersService os = new OffersService();

    Offers o = new Offers(Shelf, Alley, Barcode, StoreId);
    os.insert(o);
    String url = "add-product-shop.jsp?barcode=" + Barcode;

    response.sendRedirect(url);

%>

