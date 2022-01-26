package cbims.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cbims.Dao.suppliersDAO;
import cbims.Model.suppliers;

@WebServlet(name = "suppliersServlet", value = "/suppliersServlet")
public class suppliersServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public suppliersServlet(){
        super();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("Action").equals("Add Supplier")) {
            System.out.println("in");
            PrintWriter out = response.getWriter();

            suppliers sp = new suppliers();
            suppliersDAO spdao = new suppliersDAO();

            sp.setSupplier_ID((request.getParameter("supplier_ID")));
            sp.setSupplier_Name((request.getParameter("supplier_Name")));
            sp.setSupplier_Address((request.getParameter("supplier_Address")));
            sp.setSupplier_Postcode((request.getParameter("supplier_Postcode")));
            sp.setSupplier_City((request.getParameter("supplier_City")));
            sp.setSupplier_State((request.getParameter("supplier_State")));
            sp.setSupplier_PhoneNo((request.getParameter("supplier_PhoneNo")));
            sp.setSupplier_Email((request.getParameter("supplier_Email")));

            boolean result = spdao.addSupplier(sp);

            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data added successfully!');");
                out.println("location='suppliers.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data unsuccessfully added. Please try again.');");
                out.println("location='suppliers.jsp';");
                out.println("</script>");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("suppliers.jsp");
            dispatcher.include(request, response);

        }

        if (request.getParameter("Action").equals("Update")) {
            System.out.println("in");
            PrintWriter out = response.getWriter();

            suppliers sp = new suppliers();
            suppliersDAO spdao = new suppliersDAO();

            sp.setSupplier_ID((request.getParameter("supplier_ID")));
            sp.setSupplier_Name((request.getParameter("supplier_Name")));
            sp.setSupplier_Address((request.getParameter("supplier_Address")));
            sp.setSupplier_Postcode((request.getParameter("supplier_Postcode")));
            sp.setSupplier_City((request.getParameter("supplier_City")));
            sp.setSupplier_State((request.getParameter("supplier_State")));
            sp.setSupplier_PhoneNo((request.getParameter("supplier_PhoneNo")));
            sp.setSupplier_Email((request.getParameter("supplier_Email")));

            boolean result = spdao.updateSupplier(sp);
            System.out.println(result);

            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data updated successfully!');");
                out.println("location='suppliers.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data unsuccessfully updated. Please try again.');");
                out.println("location='suppliers.jsp';");
                out.println("</script>");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("editSupplier.jsp");
            dispatcher.include(request, response);

        }


    }
}
