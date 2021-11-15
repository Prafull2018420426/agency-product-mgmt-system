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
        <title>ADD ITEMS PAGE</title>
        <style>
            header{
                height:65px;
                text-align: center;
                color:white;
                font-size: 25px;
                background-color: #cf1e1b;
                padding-top: 12px;
            }
            .paddleft{
                padding-left: 40px;
            }
        </style>
    </head>
    <body class="bg-light">
         <%
            if (session.getAttribute("adminname") == null) {
                response.sendRedirect("index.html");
            }
        %>
        <% String id = request.getParameter("id");%>
        <header>
            MANAGE ORDER
        </header
        
        <div class="container-xl">
            <div class="row">
                <div class="col-sm-4 bg-light paddleft">
                    <form  action="additems" method="post">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Order_id</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" name="order_id" value="<%= id%> " readonly >
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Product Name</label>
                            <select class="form-control" name="productname" >
                                <option value="">Select product</option>
                                <%
                                    try {
                                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                                        Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                                        String q = "select pro_name from product";
                                        Statement stmt = c.createStatement();
                                        ResultSet rs = stmt.executeQuery(q);
                                        while (rs.next()) {
                                %>
                                <option value="<%= rs.getString("pro_name")%>"><%= rs.getString("pro_name")%></option>
                                <%
                                        }
                                    } catch (Exception e) {
                                        //Handle errors for Class.forName
                                        e.printStackTrace();
                                    }


                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Quantity</label>
                            <input type="number" class="form-control" id="exampleFormControlInput1" name="quantity" placeholder="Enter Quantity">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">rate2</label>
                            <input type="number" class="form-control" id="exampleFormControlInput1" name="rate2" placeholder="Enter Outgoing rate">
                        </div>

                        <input type="submit" name="submit" class="btn btn-danger" value="submit">

                        <a class="btn btn-warning" href="activeorder.jsp" > save</a>
                    </form>
                </div>

                <div class="col-sm-8 bg-light">


                    <table class="table ">
                        <thead class="thead-dark">
                            <tr>
                                <th>Order ID</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Rate2</th>

                                <th>Total</th>
                                <th>#</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                try {
                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                    Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                                    String q = "select * from items where order_id='" + id + "'";
                                    Statement stmt = c.createStatement();
                                    ResultSet rs = stmt.executeQuery(q);
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getString("order_id")%></td>
                                <td><%= rs.getString("product_name")%></td>
                                <td><%= rs.getString("quantity")%></td>
                                <td><%= rs.getString("rate2")%></td>
                                <td><%= rs.getString("total")%></td>
                                <td> 
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
            <!-- Button trigger modal -->
            

            <!-- Modal -->

        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
