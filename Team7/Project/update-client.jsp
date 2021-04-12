<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>


<%
int Card = Integer.parseInt(request.getParameter("customerCard"));
String Name = request.getParameter("customerName");
String DOBstr = request.getParameter("customerDOB");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date DOB = sdf.parse(DOBstr);
java.sql.Date sqlDate = new java.sql.Date(DOB.getTime());
int Points = Integer.parseInt(request.getParameter("customerPoints"));
String Street = request.getParameter("customerStreet");
int Number = Integer.parseInt(request.getParameter("customerNumber"));
int Postal_Code = Integer.parseInt(request.getParameter("customerPostal"));
String City = request.getParameter("customerCity");
int Family_Members = Integer.parseInt(request.getParameter("customerFamily"));
boolean Pet = false;
String p = request.getParameter("customerPet");
if ("0".equals(p)){
	Pet = false;
}else{
	Pet = true;
}
String Phone = request.getParameter("customerPhone");

Customer c = null;
c = new Customer(Card, Name, sqlDate, Points, Street, Number, Postal_Code, City, Family_Members, Pet, Phone);



CustomerService custservice = new CustomerService();


custservice.updateCustomer(c);
request.setAttribute( "success-message", "Customer with Card: <b>" 
	+ Card + "</b> updated successfully!" );

String url = "client.jsp?cardId="+Card;

response.sendRedirect(url);

%>

