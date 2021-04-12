<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.*" %>

<%

String OpHours = request.getParameter("ophours");
int Size = Integer.parseInt(request.getParameter("ssize"));
String Street = request.getParameter("sstreet");
int Number = Integer.parseInt(request.getParameter("snumber"));
int Postal = Integer.parseInt(request.getParameter("spostal"));
String City = request.getParameter("scity");


StoreService ss = new StoreService();

Store store = new Store(OpHours,Size,Street,Number,Postal,City);
ss.insert(store);
response.sendRedirect("shops.jsp");

%>

