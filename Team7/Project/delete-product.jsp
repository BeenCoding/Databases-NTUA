<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page import="packedup.*"%>

<%

String barcode = request.getParameter("barcode");

if(barcode == null) {
	throw new Exception("Bad Request!");
}

ProductService ps = new ProductService();

ps.deleteProduct(barcode);

response.sendRedirect("products.jsp");

%>
