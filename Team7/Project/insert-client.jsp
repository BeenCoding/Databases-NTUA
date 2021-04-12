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
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-xl-2 my-5" style="width: 1px;"><a href="clients.jsp"><i class="fa fa-chevron-left my-4" style="color: rgb(0,0,0);"></i></a></div>
                <div class="col-md-6">
                    <h1 class="display-4 text-center my-5">Insert Client</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-5 col-xl-5 offset-xl-4 my-3 align">
        <form class="table table-striped" method="POST" action ="/Team7/Project/insert-client-controller.jsp">
            <table>
                <tbody class="text-left text-primary">

                    <tr>
                        <td style="color: rgb(0,0,0);">Name:</td>
                        <td><input type="text" pattern="^([ \u00c0-\u01ffa-zA-Z'\-])+$" name="customerName" style="width: 350px;height: 40px;" required></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(0,0,0);">Date of Birth:</td>
                        <td><input type="date" name="customerDOB" style="width: 350px;height: 40px;"required></td>
                    </tr>
					<tr>
                        <td style="color: rgb(0,0,0);">Points:</td>
                        <td><input type="number" name="customerPoints" style="width: 350px;height: 40px;" required></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(0,0,0);">Street:</td>
                        <td><input type="text" name="customerStreet" style="width: 350px;height: 40px;"required></td>
                    </tr>
                    <tr>
                        <td class="text-dark">Number:</td>
                        <td><input type="number" name="customerNumber" style="width: 350px;height: 40px;"required></td>
                    </tr>
                    <tr>
                        <td class="text-dark">Postal Code:</td>
                        <td><input type="number" min = "1000" max = "9999" name="customerPostalCode" style="width: 350px;height: 40px;"required></td>
                    </tr>
                    <tr>
                        <td class="text-dark">City:</td>
                        <td><input type="text" pattern="^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$" name="customerCity" style="width: 350px;height: 40px;"required></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(0,0,0);">Family Members:</td>
                        <td><input type="number" name="customerFam" style="width: 350px;height: 40px;"required></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(0,0,0);">Pet:</td>
                        <td><input type="checkbox" value = "true" name="customerPet" style="width: 350px;height: 40px;" ></td>
                    </tr>
                    <tr>
                        <td style="color: rgb(0,0,0);">Mobile Number:</td>
                        <td><input type="number" min = "95000000" max ="99999999" name="customerTel" style="width: 350px;height: 40px;"required></td>
                    </tr>
                </tbody>
            </table>
        <div class="row my-4">
            <div class="col"><button type="submit" class="btn btn-success float-right" onclick="return confirm('Insert this Client?');">Submit</button></div>
            <div class="col"><button type="reset" class="btn btn-secondary text-left" onclick="return confirm('Discard input?');">Discard</button></div>
        </div>
        </form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>