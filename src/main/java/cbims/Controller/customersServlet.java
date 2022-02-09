package cbims.Controller;

import cbims.Dao.customersDAO;
import cbims.Model.customers;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.servlet.*;

@WebServlet(name = "customersServlet", value = "/customersServlet")
public class customersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public customersServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("Action").equals("Add Customer")) {
            System.out.println("in");
            PrintWriter out = response.getWriter();

            customers cust = new customers();
            customersDAO custdao = new customersDAO();

            cust.setCustomer_Name(request.getParameter("customer_Name"));
            cust.setCustomer_PhoneNo(request.getParameter("customer_PhoneNo"));
            cust.setCustomer_Email(request.getParameter("customer_Email"));

            boolean result = custdao.addCustomer(cust);

            if (custdao.sessionCustomer(cust)){
                HttpSession session = request.getSession(true);
                session.setAttribute("customer_ID", cust.getCustomer_ID());
                session.setAttribute("customer_Name", cust.getCustomer_Name());
                session.setAttribute("customer_PhoneNo", cust.getCustomer_PhoneNo());
                session.setAttribute("customer_Email", cust.getCustomer_Email());
                System.out.print("Session created");
            }

//            boolean result = custdao.addCustomer(cust);
//
            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data added successfully!');");
                out.println("location='orders.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data unsuccessfully added. Please try again.');");
                out.println("location='customers.jsp';");
                out.println("</script>");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("customers.jsp");
            dispatcher.include(request, response);
        }

        if (request.getParameter("Action").equals("Update Customer")) {
            System.out.println("in");
            PrintWriter out = response.getWriter();

            customers cust = new customers();
            customersDAO custdao = new customersDAO();

            String id = request.getParameter("id");
            int custid = Integer.parseInt(id);

            cust.setCustomer_ID(custid);
            cust.setCustomer_Name(request.getParameter("customer_Name"));
            cust.setCustomer_PhoneNo(request.getParameter("customer_PhoneNo"));
            cust.setCustomer_Email(request.getParameter("customer_Email"));

            request.setAttribute("cust", cust);

            boolean result = custdao.updateCustomer(cust);
            System.out.println(result);

            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data updated successfully!');");
                out.println("location='customers.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data unsuccessfully updated. Please try again.');");
                out.println("location='customers.jsp';");
                out.println("</script>");
            }
        }

        if (request.getParameter("Action").equals("Delete Customer")) {
            System.out.println("in");
            PrintWriter out = response.getWriter();

            customers cust = new customers();
            customersDAO custdao = new customersDAO();

            String id = request.getParameter("id");
            int custid = Integer.parseInt(id);

            boolean result = custdao.deleteCustomer(custid);
            System.out.println(result);

            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data deleted successfully!');");
                out.println("location='customers.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data unsuccessfully deleted. Please try again.');");
                out.println("location='customers.jsp';");
                out.println("</script>");
            }
        }
    }
}
