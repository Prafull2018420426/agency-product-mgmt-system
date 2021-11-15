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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vrushali
 */
@WebServlet(name = "addorder", urlPatterns = {"/addorder"})
public class addorder extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String order_id=request.getParameter("order_id");
        String shop_id=request.getParameter("shop_id");
        String shop_name=request.getParameter("shop_name");
        String add=request.getParameter("add");
        String contact=request.getParameter("contact");
        DateFormat newDate=new SimpleDateFormat("MM/DD/YYYY");
        Date date=new Date();
        
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                Statement st=c.createStatement();
                String a="insert into orderd(order_id,shop_id,shop_name,address,contact,status,date)values ('"+order_id+"','"+shop_id+"','"+shop_name+"','"+add+"','"+contact+"','active','"+date+"') ";
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
            out.println("<title>Servlet addorder</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addorder at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
