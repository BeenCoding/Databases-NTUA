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
            <div class="col-md-6 col-xl-2 my-5" style="width: 1px;"><a href="shops.jsp"><i
                    class="fa fa-chevron-left my-4" style="color: rgb(0,0,0);"></i></a></div>
            <div class="col-md-6">
                <h1 class="display-4 text-center my-5">Insert Store</h1>
            </div>
        </div>
    </div>
</div>
<div class="col-md-5 col-xl-5 offset-xl-4 my-3 align">
    <form class="table table-striped" method="POST" action="/Team7/Project/insert-shop-controller.jsp">
        <table>
            <tbody class="text-left text-primary">
            <tr>
                <td style="color: rgb(0,0,0);">Operating Hours:</td>
                <td><input type="text" name="ophours" style="width: 350px;height: 40px;"></td>
            </tr>
            <tr>
                <td style="color: rgb(0,0,0);">Size:</td>
                <td><input type="number" name="ssize" style="width: 350px;height: 40px;" max="99999999999" required>
                </td>
            </tr>
            <tr>
                <td style="color: rgb(0,0,0);">Street:</td>
                <td><input type="text" name="sstreet" style="width: 350px;height: 40px;" required></td>
            </tr>
            <tr>
                <td class="text-dark">Number:</td>
                <td><input type="number" name="snumber" style="width: 350px;height: 40px;" required></td>
            </tr>
            <tr>
                <td class="text-dark">Postal Code:</td>
                <td><input type="number" min="1000" max="9999" name="spostal" style="width: 350px;height: 40px;"
                           required></td>
            </tr>
            <tr>
                <td class="text-dark">City:</td>
                <td><input type="text" pattern="^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$" name="scity"
                           style="width: 350px;height: 40px;" maxlength="45" required></td>
            </tr>
            <tr>
                <td style="color: rgb(0,0,0);">Phone:</td>
                <td><input type="number" min="20000000" max="25999999" name="sphone" style="width: 350px;height: 40px;"
                           required></td>
            </tr>
            </tbody>
        </table>
        <div class="row my-4">
            <div class="col">
                <button type="submit" class="btn btn-success float-right"
                        onclick="return confirm('Insert this Store?');">Submit
                </button>
            </div>
            <div class="col">
                <button type="reset" class="btn btn-secondary text-left" onclick="return confirm('Discard input?');">
                    Discard
                </button>
            </div>
        </div>
    </form>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>