/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vrushali
 */
@WebServlet(name = "addcustomer", urlPatterns = {"/addcustomer"})
public class addcustomer extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String shop_id = request.getParameter("shop_id");
        String shop_name = request.getParameter("shop_name");
        String owner_name = request.getParameter("owner_name");
        String address = request.getParameter("address");
        String mobile_no = request.getParameter("mobile_no");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                Statement st=c.createStatement();
                String q="insert into customers (shop_id,shop_name,owner_name,address,mobile_no) values('"+shop_id+"','"+shop_name+"','"+owner_name+"','"+address+"','"+mobile_no+"')";
                int i=st.executeUpdate(q);
                response.sendRedirect("customers.jsp");
                
            } catch (Exception ex) {
                out.print(ex);
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addcustomer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addcustomer at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
