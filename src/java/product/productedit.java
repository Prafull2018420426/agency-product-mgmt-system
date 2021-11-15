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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vrushali
 */
@WebServlet(name = "productedit", urlPatterns = {"/productedit"})
public class productedit extends HttpServlet {

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
                Statement st = c.createStatement();

                String a = "update product set pro_name='" + pro_name + "'  where pro_id='" + pro_id + "'";
                String e = "update product set quantity='" + quantity + "' where pro_id='" + pro_id + "'";
                String f = "update product set rate1='" + rate1 + "' where pro_id='" + pro_id + "'";
                String g = "update product set rate2='" + rate2 + "' where pro_id='" + pro_id + "'";
                String h = "update product set catagory='" + category + "' where pro_id='" + pro_id + "'";

                st.executeUpdate(a);
                st.executeUpdate(e);
                st.executeUpdate(f);
                st.executeUpdate(g);
                st.executeUpdate(h);

                

              
                    response.sendRedirect("product.jsp");
                

            } catch (Exception e) {
                //Handle errors for Class.forName
                out.println(e);
            }

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet productedit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productedit at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
