<%-- 
    Document   : customeredit
    Created on : 17 Dec, 2020, 9:29:11 AM
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
        <title>CUSTOMER EDIT PAGE</title>
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
            MANAGE CUSTOMER 
        </header>
        <div class="container-xl">
            <div class="row">
                <div class="col-sm-4 bg-light">
                    <%
                        String id = request.getParameter("id");
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                            String q = "select * from customers where shop_id= '" + id + "'";
                            Statement stmt = c.createStatement();
                            ResultSet rs = stmt.executeQuery(q);
                            while (rs.next()) {
                    %>


                    <form  action="customeredit" method="post">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Shop ID</label>
                            <input type="number" class="form-control" id="exampleFormControlInput1" name="shop_id"  value="<%= rs.getString("shop_id")%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Shop Name</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" name="shop_name" value="<%= rs.getString("shop_name")%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Owner Name</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" name="owner_name"  value="<%= rs.getString("owner_name")%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Address</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" name="address"  value="<%= rs.getString("address")%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Mobile_no</label>
                            <input type="number" class="form-control" id="exampleFormControlInput1" name="mobile_no"  value="<%= rs.getString("mobile_no")%>">
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
                                <th>SHOP ID</th>
                                <th>SHOP Name</th>
                                <th>OWNER Name</th>
                                <th>ADDRESS</th>
                                <th>MOBILE NO</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%                                try {
                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                    Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                                    String q = "select * from customers";
                                    Statement stmt = c.createStatement();
                                    ResultSet rs = stmt.executeQuery(q);
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getString("s_id")%></td>
                                <td><%= rs.getString("s_name")%></td>
                                <td><%= rs.getString("o_name")%></td>
                                <td><%= rs.getString("add")%></td>
                                <td><%= rs.getString("mob")%></td>


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

