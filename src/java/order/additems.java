/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package order;

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
@WebServlet(name = "additems", urlPatterns = {"/additems"})
public class additems extends HttpServlet {

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String order_id = request.getParameter("order_id");
        String product_name = request.getParameter("productname");
        String quantity = request.getParameter("quantity");
        String rate2 = request.getParameter("rate2");
        int t;
        t=Integer.parseInt(quantity)*Integer.parseInt(rate2);
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                Statement st=c.createStatement();
                String a="insert into items(order_id,product_name,quantity,rate2,total)values ('"+order_id+"','"+product_name+"','"+quantity+"','"+rate2+"','"+t+"') ";
                int i=st.executeUpdate(a);
                
                
                
                    response.sendRedirect("additems.jsp?id="+order_id+"");
                
               
            } catch (Exception e) {
                //Handle errors for Class.forName
                out.println(e);
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet additems</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet additems at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
