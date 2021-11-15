<%-- 
    Document   : mainpage
    Created on : 12 Dec, 2020, 8:59:02 PM
    Author     : Vrushali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css">
        <title> HOME PAGE </title>
        <style>
           

        </style>
    </head>
    <body class="body">
        <%
            if (session.getAttribute("adminname") == null) {
                response.sendRedirect("index.html");
            }
        %>
        <nav class="header">
            <p >HOME PAGE</p>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-xs-12">
                    <div class="item-boxes services-item wow fadeInDown animated border " data-wow-delay="0.2s"
                         style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                        <div >
                            <img class="icon" src="image/product1.jpg"  class="im">
                        </div>
                        <h4 style="padding-top: 10px">PRODUCTS</h4>
                        <p>

                        </p>
                        <a  class="btn bg-info" data-toggle="modal" href="product.jsp"
                            data-target="#exampleModal">PRODUCTS</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-xs-12">
                    <div class="item-boxes services-item wow fadeInDown animated border " data-wow-delay="0.2s"
                         style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                        <div >
                            <img class="icon" src="image/customer.jpg"  class="im">
                        </div>
                        <h4>CUSTOMERS</h4>
                        <p>

                        </p>
                        <a  class="btn bg-info" data-toggle="modal" href="customers.jsp"
                            data-target="#exampleModal">SHOPS</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-xs-12">
                    <div class="item-boxes services-item wow fadeInDown animated border " data-wow-delay="0.2s"
                         style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                        <div >
                            <img class="icon" src="image/order.jpg"  class="im">
                        </div>
                        <h4>ORDERS</h4>
                        <p>

                        </p>
                        <a  class="btn bg-info" data-toggle="modal" href="activeorder.jsp"
                            data-target="#exampleModal">GO TO</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-xs-12">
                    <div class="item-boxes services-item wow fadeInDown animated border " data-wow-delay="0.2s"
                         style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                        <div >
                            <img class="icon" src="image/bill.jpg"  class="im">
                        </div>
                        <h4>REPORTS</h4>
                        <p>

                        </p>
                        <a  class="btn bg-info" data-toggle="modal" href=" report.jsp"
                            data-target="#exampleModal">GO TO</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-xs-12">
                    <div class="item-boxes services-item wow fadeInDown animated border " data-wow-delay="0.2s"
                         style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                        <div >
                            <img class="icon" src="image/udhar.png"  class="im">
                        </div>
                        <h4>UDHAR BOOK</h4>
                        <p>

                        </p>
                        <a  class="btn bg-info" data-toggle="modal" href="udharbook.jsp"
                            data-target="#exampleModal">PENDINGS</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-xs-12">
                    <div class="item-boxes services-item wow fadeInDown animated border " data-wow-delay="0.2s"
                         style="visibility: visible;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                        <div >
                            <img class="icon" src="image/logout.jpg"  class="im">
                        </div>
                        <h4>EXIT</h4>
                        <p>

                        </p>
                        <a  class="btn bg-info" data-toggle="modal"
                            data-target="#exampleModal" href="logout" >CLOSE</a>
                    </div>
                </div>
            </div>    

        </div>
        <br><br><br><br><br>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <footer class="bg-light text-center text-lg-start">
  <!-- Grid container -->
 
  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
   FOLLOW US ON : 
    <a class="text-dark" href=""> prafullsdhanawade77@gmail.com</a>
  </div>
  <!-- Copyright -->
</footer>
    </body>

</html>
