<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>

<%

String Name = request.getParameter("name");
float Price = Float.parseFloat(request.getParameter("price"));
Boolean BrandName = Boolean.parseBoolean(request.getParameter("brandname"));

String datestr = request.getParameter("fdate");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date dt = sdf.parse(datestr);
java.sql.Date sqlDate = new java.sql.Date(dt.getTime());

int Category = Integer.parseInt(request.getParameter("cat"));

ProductService ps = new ProductService();

Product p = new Product(Name,Price,BrandName,sqlDate,Category);
ps.insert(p);
response.sendRedirect("products.jsp");

%>

