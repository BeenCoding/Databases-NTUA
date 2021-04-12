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
            <div class="col-md-6 col-xl-2 my-5" style="width: 1px;"><a href="products.jsp"><i
                    class="fa fa-chevron-left my-4" style="color: rgb(0,0,0);"></i></a></div>
            <div class="col-md-6">
                <h1 class="display-4 text-center my-5">Insert Product</h1>
            </div>
        </div>
    </div>
</div>
<div class="col-md-5 col-xl-5 offset-xl-4 my-3 align">
    <form class="table table-striped" method="POST" action="/Team7/Project/insert-product-controller.jsp">
        <table>
            <tbody class="text-left text-primary">
            <tr>
                <td class="text-dark">Name:</td>
                <td><input type="text" name="name" style="width: 350px;height: 40px;" required maxlength="70"></td>
            </tr>
            <tr>
                <td class="text-dark">Category:</td>
                <td>
                    <select name="cat" style="width: 350px;height: 40px;">
                        <optgroup label="-Select an option-">
                            <option value="1" selected="">Fresh Products</option>
                            <option value="2">Refrigerator Products</option>
                            <option value="3">Liquor Products</option>
                            <option value="4">Personal Care Products</option>
                            <option value="5">House Products</option>
                            <option value="6">Pet Products</option>
                        </optgroup>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="color: rgb(0,0,0);">First Transaction:</td>
                <td><input name="fdate" type="date" style="width: 350px;height: 40px;" required></td>
            </tr>
            <tr>
                <td style="color: rgb(0,0,0);">Brand Name:</td>
                <td>
                    <select name="brandname" style="width: 350px;height: 40px;">
                        <optgroup label="-Select an option-">
                            <option value="0" selected="">No</option>
                            <option value="1">Yes</option>
                        </optgroup>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="color: rgb(0,0,0);">Price:</td>
                <td><input name="price" type="number" step="0.01" style="width: 350px;height: 40px;" max="9999.99"
                           required></td>
            </tr>
            </tbody>
        </table>
        <div class="row my-4">
            <div class="col">
                <button type="submit" class="btn btn-success float-right"
                        onclick="return confirm('Insert this Product?');">Submit
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