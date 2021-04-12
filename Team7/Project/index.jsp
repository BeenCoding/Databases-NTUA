<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="packedup.*" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>ProjectX</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/Projects-Horizontal.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <div class="projects-horizontal">
        <div class="container">
            <div class="intro my-4">
                <h5 class="display-4 text-capitalize text-center text-dark">User Panel <i class="fa fa-cog" aria-hidden="true"></i></h5>
            </div>
            <div class="col-xl-9 offset-xl-2 my-5">
                <!--<p class="text-left">Please select the action you want to do.</p>-->
                <div class="row projects">
                    <div class="col">
                        <div class="row my-4">
                            <div class="col">
                                <h3 class="name">Purchases Search <i class="fa fa-credit-card" aria-hidden="true"></i></h3>
                                <p class="description">You can search for certain purchases by selecting the criteria you want!</p>
                            </div>
                            <div class="col-md-12 col-lg-5"><a href="#"></a><a class="btn btn-primary text-white bg-dark border-dark my-4 offset-4" role="button" href="purchases.jsp" style="width: 90px;">Go</a></div>
                        </div>
                        <div class="row my-4">
                            <div class="col">
                                <h3 class="name">Advanced Information <i class="fa fa-info-circle" aria-hidden="true"></i></h3>
                                <p class="description">Analysed information from the database, and exported so the user can see these information.</p>
                            </div>
                            <div class="col-md-12 col-lg-5"><a href="#"></a><a class="btn btn-primary text-white bg-dark border-dark my-4 offset-4" role="button" href="information.jsp" style="width: 90px;">Go</a></div>
                        </div>
                        <div class="row my-4" >
                            <div class="col">
                                <h3 class="name">Update Entities <i class="fa fa-edit" aria-hidden="true"></i></h3>
                                <p class="description">You can insert, delete or edit clients, stores or products.</p>
                            </div>
                            <div class="col-md-12 col-lg-5"><a href="#"></a>
                                <div class="row">
                                    <div class="col">
                                        <div class="dropdown"><button class="btn btn-dark dropdown-toggle my-4 offset-4" data-toggle="dropdown" aria-expanded="false" type="button" style="width: 90px;">Entity</button>
                                            <div class="dropdown-menu text-dark" role="menu"><a class="dropdown-item" role="presentation" href="clients.jsp">Clients</a><a class="dropdown-item" role="presentation" href="shops.jsp">Stores</a><a class="dropdown-item" role="presentation" href="products.jsp">Products</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
						<div class="row my-4">
                            <div class="col">
                                <h3 class="name">Views <i class="fa fa-eye" aria-hidden="true"></i></h3>
                                <p class="description">Views: Sales per category per shop and Customer.</p>
                            </div>
							<div class="col-md-12 col-lg-5"><a href="#"></a>
                                <div class="row">
                                    <div class="col">
                                        <div class="dropdown"><button class="btn btn-dark dropdown-toggle my-4 offset-4" data-toggle="dropdown" aria-expanded="false" type="button" style="width: 90px;">Views</button>
                                            <div class="dropdown-menu text-dark" role="menu"><a class="dropdown-item" role="presentation" href="sales-view.jsp">Sales</a><a class="dropdown-item" role="presentation" href="clients-view.jsp">Clients</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-dark" style="width: 100πχ;">
        <footer>
            <div class="container">
                <h6 class="text-center">TEAM 7 @ Databases-Project 2020<br></h6>
                <!--<p class="copyright">Christos Hadjichristofi(03117711)<br>Giorgos Antoniou(03117715)<br>Demetris Kyriakou<br></p>-->
            </div>
        </footer>
    </div>
    <footer></footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>