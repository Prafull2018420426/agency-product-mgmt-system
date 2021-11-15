<%-- 
    Document   : customers
    Created on : 13 Dec, 2020, 3:10:36 PM
    Author     : Vrushali
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="style.css" type="text/css">
        <title>ORDER PAGE</title>
        <style>
            header{
                height:65px;
                text-align: center;
                color:white;
                font-size: 25px;
                background-color: #cf1e1b;
                padding-top: 12px;
            }
            .order{
                margin:auto;
                width:360px;
            }
        </style>
    </head>
    <body class="bg-light">
 <%
            if (session.getAttribute("adminname") == null) {
                response.sendRedirect("index.html");
            }
        %>
        <header>
            MANAGE ORDER
        </header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link"  href="mainpage.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="customers.jsp">Customer</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="product.jsp">product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="activeorder.jsp">activeorder</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="udharbook.jsp" tabindex="-1" >udharbook</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="report.jsp" tabindex="-1" >report</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <%
            String id=request.getParameter("id");
            String name=request.getParameter("name");
        %>
        <div class="container-xl">
            <div class="order">
                <div class=" bg-light">
                    <form  action="addorder" method="post">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Order ID</label>
                            <input type="number" class="form-control" id="exampleFormControlInput1" name="order_id" required placeholder="Enter Order ID">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Shop Name</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" name="shop_name" value="<%= name %>"  readonly="">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Shop ID</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" name="shop_id" value="<%= id %>" readonly="" >                                
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Address</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" name="add" placeholder="Enter Delivery Address">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Contact No.</label>
                            <input type="number" class="form-control" id="exampleFormControlInput1" name="contact" placeholder="Enter Contact Number">
                        </div>

                        <input type="submit" name="submit" class="btn btn-danger" value="submit">
                        <input type="reset" class="btn btn-warning"  value="clear">
                    </form>
                </div>

                
            </div>
        </div>
    </body>
</html>
