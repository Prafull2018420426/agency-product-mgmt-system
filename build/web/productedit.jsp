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
        <!--<link rel="stylesheet" href="style.css" type="text/css">-->
        <title>PRODUCT EDIT PAGE</title>
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
            MANAGE PRODUCT 
        </header>
        <div class="container-xl">
            <div class="row">
                <div class="col-sm-4 bg-light">
                    <%
                        String id = request.getParameter("id");
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                            String q = "select * from product where pro_id= '" + id + "'";
                            Statement stmt = c.createStatement();
                            ResultSet rs = stmt.executeQuery(q);
                            while (rs.next()) {
                    %>
                   

                    <form  action="productedit" method="post">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Product ID</label>
                            <input type="number" class="form-control" id="exampleFormControlInput1" name="product_id"  value="<%= rs.getString("pro_id")%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Product Name</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" name="product_name" value="<%= rs.getString("pro_name")%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Quantity</label>
                            <input type="number" class="form-control" id="exampleFormControlInput1" name="quantity"  value="<%= rs.getString("quantity")%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Rate1</label>
                            <input type="number" class="form-control" id="exampleFormControlInput1" name="rate1"  value="<%= rs.getString("rate1")%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Rate2</label>
                            <input type="number" class="form-control" id="exampleFormControlInput1" name="rate2"  value="<%= rs.getString("rate2")%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Category</label>
                            <select class="form-control" id="exampleFormControlSelect1" name="category" value="<%= rs.getString("catagory")%>">
                                <option>Biscuit</option>
                                <option>Chocklate</option>
                                <option>Masale</option>
                                <option>Other</option>

                            </select>
                        </div>
                        <input type="submit" name="submit" class="btn btn-danger" value="submit">
                        <input type="reset" class="btn btn-warning"  value="clear">
                    </form>
                    <%

                            }
                        } catch (Exception e) {
                            //Handle errors for Class.forName
                            e.printStackTrace();
                        }


                    %>
                </div>

                <div class="col-sm-8 bg-light">


                    <table class="table ">
                        <thead class="thead-dark">
                            <tr>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Rate1</th>

                                <th>Rate2</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <%                                try {
                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                    Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                                    String q = "select * from product";
                                    Statement stmt = c.createStatement();
                                    ResultSet rs = stmt.executeQuery(q);
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getString("pro_id")%></td>
                                <td><%= rs.getString("pro_name")%></td>
                                <td><%= rs.getString("quantity")%></td>
                                <td><%= rs.getString("rate1")%></td>
                                <td><%= rs.getString("rate2")%></td>
                                

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
