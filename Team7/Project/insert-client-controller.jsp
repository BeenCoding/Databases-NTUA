<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>

<%
    String Name = request.getParameter("customerName");
    String DOBstr = request.getParameter("customerDOB");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date DOB = sdf.parse(DOBstr);
    java.sql.Date sqlDate = new java.sql.Date(DOB.getTime());
    Integer Points = Integer.parseInt(request.getParameter("customerPoints"));
    String Street = request.getParameter("customerStreet");
    Integer Number = Integer.parseInt(request.getParameter("customerNumber"));
    Integer Postal_Code = Integer.parseInt(request.getParameter("customerPostalCode"));
    String City = request.getParameter("customerCity");
    Integer Family_Members = Integer.parseInt(request.getParameter("customerFam"));
    Boolean Pet = Boolean.parseBoolean(request.getParameter("customerPet"));
    String Phone = request.getParameter("customerTel");

    CustomerService custservice = new CustomerService();


    // create customer object
    Customer customer = new Customer(Name, sqlDate, Points, Street, Number, Postal_Code, City, Family_Members, Pet, Phone);

    // save customer to the database;
    custservice.register(customer);


    response.sendRedirect("clients.jsp");
%>

