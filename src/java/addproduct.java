/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vrushali
 */
@WebServlet(name = "addproduct", urlPatterns = {"/addproduct"})
public class addproduct extends HttpServlet {

  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pro_id = request.getParameter("product_id");
        String pro_name = request.getParameter("product_name");
        String quantity = request.getParameter("quantity");
        String rate1 = request.getParameter("rate1");
        String rate2 = request.getParameter("rate2");
        String category = request.getParameter("category");

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                Statement s=c.createStatement();
                String a="insert into product(pro_id,pro_name,quantity,rate1,rate2,catagory)values ('"+pro_id+"','"+pro_name+"','"+quantity+"','"+rate1+"','"+rate2+"','"+category+"') ";
                int i=s.executeUpdate(a);
                
                
                
                
                    response.sendRedirect("product.jsp");
                
               
            } catch (Exception e) {
                
                out.print(e);
            }
        
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addproduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addproduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
}
