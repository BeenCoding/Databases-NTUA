<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page import="packedup.*"%>

<%

String barcode = request.getParameter("barcode");

if(barcode == null) {
	throw new Exception("Bad Request!");
}

OffersService os = new OffersService();

os.deleteOffer(barcode);

String url = "add-product-shop.jsp?barcode="+barcode;

response.sendRedirect(url);
%>
