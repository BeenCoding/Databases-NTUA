<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>


<%
    int Barcode = Integer.parseInt(request.getParameter("barcode"));
    String Name = request.getParameter("name");
    float Price = Float.parseFloat(request.getParameter("price"));
    Boolean BrandName = Boolean.parseBoolean(request.getParameter("brandname"));

    String datestr = request.getParameter("fdate");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date dt = sdf.parse(datestr);
    java.sql.Date sqlDate = new java.sql.Date(dt.getTime());

    int Category = Integer.parseInt(request.getParameter("cat"));

    ProductService ps = new ProductService();
    String b = request.getParameter("barcode");
    Product old_p = ps.getByID(b);

    Product p = new Product(Barcode, Name, Price, BrandName, sqlDate, Category);
    ps.updateProduct(p);
    request.setAttribute("success-message", "Product with Barcode: <b>"
            + Barcode + "</b> updated successfully!");


    if (Price != old_p.getPrice()) {
        Date Start_Date = new Date();

        HistoryService hs = new HistoryService();
        List<History> allh = hs.getHistoryByID(b);
        if (allh.size() == 0) {
            Start_Date = p.getFirstTransaction();
        } else {
            Start_Date = hs.getLastDate(b);
        }
        java.sql.Date Start_Datesql = new java.sql.Date(Start_Date.getTime());

        Date ed = new Date();
        java.sql.Date End_Date = new java.sql.Date(ed.getTime());


        History h = new History(Start_Datesql, old_p.getPrice(), End_Date, Barcode);
        hs.updateHistory(h);
    }


    String url = "edit-product.jsp?barcode=" + Barcode;

    response.sendRedirect(url);

%>

