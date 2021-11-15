

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
@WebServlet(name = "customeredit", urlPatterns = {"/customeredit"})
public class customeredit extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String s_id= request.getParameter("shop_id");
        String s_name = request.getParameter("shop_name");
        String o_name = request.getParameter("owner_name");
        String add = request.getParameter("address");
        String mob = request.getParameter("mobile_no");
        

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/prafull", "root", "root123");
                Statement st = c.createStatement();

                String a = "update customers set shop_name='" + s_name + "'  where shop_id='" + s_id + "'";
                String e = "update customers set owner_name='" + o_name + "' where shop_id='" + s_id + "'";
                String f = "update customers set address='" + add + "' where shop_id='" + s_id + "'";
                String g = "update customers set mobile_no='" + mob + "' where shop_id='" + s_id + "'";
                

                st.executeUpdate(a);
                st.executeUpdate(e);
                st.executeUpdate(f);
                st.executeUpdate(g);
                

                

              
                    response.sendRedirect("customers.jsp");
                

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
            out.println("<h1>Servlet customeredit at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}