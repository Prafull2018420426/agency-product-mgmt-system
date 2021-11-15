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
        <title>CUSTOMER PAGE</title>
        <style>
            header{
                height:65px;
                text-align: center;
                color:white;
                font-size: 25px;
                background-color: #cf1e1b;
                padding-top: 12px;
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
            MANAGE CUSTOMERS 
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
        <div class="container-xl">
            <div class="row">
                <div class="col-sm-4 bg-light">
                    <form  action="addcustomer" method="post">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">SHOP ID</label>
                            <input type="number" class="form-control" id="exampleFormControlInput1" name="shop_id" required placeholder="Enter Shop ID">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">SHOP NAME</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" name="shop_name" required placeholder="Enter Shop Name">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">OWNER NAME</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" name="owner_name" required placeholder="Enter Owner Name">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">ADDRESS</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" name="address" required placeholder="Enter Address">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">MOBILE NO</label>
                            <input type="number" class="form-control" id="exampleFormControlInput1" name="mobile_no" required  placeholder="Enter Mobile No">
                        </div>

                        <input type="submit" name="submit" class="btn btn-danger" value="submit">
                        <input type="reset" class="btn btn-warning"  value="clear">
                    </form>
                </div>

                <div class="col-sm-8 bg-light">


                    <table class="table ">
                        <thead class="thead-dark">
                            <tr>
                                <th>SHOP ID</th>
                                <th>SHOP Name</th>
                                <th>OWNER Name</th>
                            <th>ADDRESS</th>
                            <th>MOBILE NO</th>
                            <th>#</th>
                            </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                                        Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                                        String q = "select * from customers";
                                        Statement stmt = c.createStatement();
                                        ResultSet rs = stmt.executeQuery(q);
                                        while (rs.next()) {
                                %>
                                <tr>
                                    <td><%= rs.getString("shop_id")%></td>
                                    <td><%= rs.getString("shop_name")%></td>
                                    <td><%= rs.getString("owner_name")%></td>
                                    <td><%= rs.getString("address")%></td>
                                    <td><%= rs.getString("mobile_no")%></td>

                                    <td><a href="customeredit.jsp?id=<%= rs.getString("shop_id")%>"><i class="fa fa-edit" style="font-size: 22px"></i></a>&nbsp |&nbsp
                                        <a href="customerdelete?id=<%= rs.getString("shop_id")%>"><i class="fa fa-trash" style="font-size: 22px;color:red" aria-hidden="true" ></i></a>&nbsp |&nbsp
                                        <a href="orders.jsp?id=<%= rs.getString("shop_id")%>&name=<%= rs.getString("shop_name")%>" style="font-size: 22px" ><i class="fa fa-plus-square" ></i></a>
                                    </td>

                                </tr>
                                <%
                                        }
                                    } catch (Exception e) {
                                        //Handle errors for Class.forName
                                        e.printStackTrace();
                                    }


                                %>
                            </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
