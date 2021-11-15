/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sujsi
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userid = request.getParameter("u");
        String password = request.getParameter("p");
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try{
                if(userid!=""){
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/prafull","root","root123");
                    String q="select * from login where admin_id=? and password=?";
                    PreparedStatement ps=c.prepareStatement(q);
                    ps.setString(1, userid);
                    ps.setString(2, password);
                    ResultSet rs=ps.executeQuery();
                    if(rs.next()){
                        HttpSession session;
                        session = request.getSession();
                        session.setAttribute("adminname",userid);
                       response.sendRedirect("mainpage.jsp?a="+userid+"");
                    }
                    else{
                        response.sendRedirect("index.jsp?a=false");
                      
                    }
                    
                }
            }
            catch(Exception e){
                out.print(e);
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
