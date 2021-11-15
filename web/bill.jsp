<%-- 
    Document   : bill
    Created on : 13 Dec, 2020, 3:11:14 PM
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="style.css" type="text/css">
        <title>BILL PAGE</title>
        <style>
            .box{
                width:800px;
                height: 100vh;
                margin: auto;
            }
            .top{
                font-size: 45px;
                text-align: center;
                padding-top: 50px;
                padding-bottom: 20px;
            }
            .bright{
                padding: 5px 50px 5px 40px;

            }
            .font20{
                font-size: 20px;
            }
            .pro{
                width:500px;
            }
            .tab{
                padding-top: 20px;
                padding-bottom: 20px;
            }

        </style>
    </head>

    <body>
        <div class="box bg-light font20">
            <header class="top dark">
                INVOICE
            </header>
            <%
                String id = request.getParameter("id");
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                    String q = "select * from orderd where order_id='" + id + "'";
                    Statement stmt = c.createStatement();
                    ResultSet rs = stmt.executeQuery(q);
                    while (rs.next()) {
            %>
            <div class="block">
                <b class="bright">Invoice NO : <%= rs.getString("order_id")%></b> <b class="bright float-right">Date of issue : <%= rs.getString("date")%></b><br><br><br>

                <b class="bright">Shop Name : <%= rs.getString("shop_name")%></b><br>
                <b class="bright">Shop ID : <%= rs.getString("shop_id")%></b><br>
                <b class="bright">Contact : <%= rs.getString("contact")%></b><br>
                <b class="bright">Address : <%= rs.getString("address")%></b><br>
                <b class="bright">Payment : <%= rs.getString("status")%></b><br>
                <%
                        }
                    } catch (Exception e) {
                        //Handle errors for Class.forName
                        e.printStackTrace();
                    }


                %>
                <div class="tab">
                    <table class="table" id="Tablebill">
                        <thead>
                            <tr>
                                <th class="pro">Product</th>
                                <th>Rate</th>
                                <th>Quantity</th>
                                <th class="forT">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                            try {
                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                    Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                                    String q = "select * from items where order_id='" + id + "'";
                                    Statement stmt = c.createStatement();
                                    ResultSet rs = stmt.executeQuery(q);
                                    while (rs.next()) {
                            %>

                            <tr>
                                <td><%=rs.getString("product_name")%></td>
                                <td><%=rs.getString("quantity")%></td>
                                <td><%=rs.getString("rate2")%></td>
                                <td><%=rs.getString("total")%></td>
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
                <b class="bright float-right" id="val">Total :</b><br>
            </div><br>
            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal">
                Payment mode
            </button>
            <button onclick="window.print()" class="btn btn-primary float-right"> Print</button>
        </div>
        <script>
            $(document).ready(function() {

                var table = document.getElementById("Tablebill"), sumVal = 0;

                for (var i = 1; i < table.rows.length; i++)
                {
                    sumVal = sumVal + parseFloat(table.rows[i].cells[3].innerHTML);

                }

                document.getElementById("val").innerHTML = "Total: " + sumVal;


            });
        </script>


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="post" action="payment?id=<%= id%>">
                        <div class="modal-body">

                            <input type="radio" name="payment" value="pending">Pending<br>
                            <input type="radio" name="payment" value="paid">Paid



                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-primary" value="save changes">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
