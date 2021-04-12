<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>

<%

String Phone = request.getParameter("telnumber");
int StoreId = Integer.parseInt(request.getParameter("shopid"));


StorePhonesService sps = new StorePhonesService();

StorePhones s = new StorePhones(Phone,StoreId);
sps.insert(s);
String url = "add-store-phone.jsp?storeId="+StoreId;

response.sendRedirect(url);

%>

