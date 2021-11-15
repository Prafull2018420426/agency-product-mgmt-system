package customer;

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
@WebServlet(name = "customerdelete", urlPatterns = {"/customerdelete"})
public class customerdelete extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                String q = "delete from customers where shop_id='" + id + "'";
                Statement st = c.createStatement();
                int i = st.executeUpdate(q);
                
                    response.sendRedirect("customers.jsp");
                
            } catch (Exception e) {
                out.print(e);
            }

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet customerdelete</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet customerdelete at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    

}
