<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page import="packedup.*"%>

<%

String storeId = request.getParameter("storeId");
String phone = request.getParameter("phone");

if(storeId == null) {
	throw new Exception("Bad Request!");
}

StorePhonesService sps = new StorePhonesService();

sps.deletePhone(phone);

String url = "add-store-phone.jsp?storeId="+storeId;

response.sendRedirect(url);
%>
