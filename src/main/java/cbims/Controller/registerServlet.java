package cbims.Controller;


import cbims.Dao.registerDAO;
import cbims.Model.register;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "registerServlet", value = "/registerServlet")
public class registerServlet extends HttpServlet
{
    public registerServlet()
    {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        register reg = new register();

       //reg.setAdmin_ID(Integer.parseInt(request.getParameter("admin_ID")));
        reg.setAdmin_Name(request.getParameter("admin_Name"));
        reg.setAdmin_PhoneNo(request.getParameter("admin_PhoneNo"));
        reg.setAdmin_Email(request.getParameter("admin_Email"));
        reg.setAdmin_Username(request.getParameter("admin_Username"));
        reg.setAdmin_Password(request.getParameter("admin_Password"));

       /* int admin_ID = Integer.parseInt(request.getParameter("admin_ID")) ;
        String admin_Name = request.getParameter("admin_Name");
        String admin_PhoneNo = request.getParameter("admin_PhoneNo");
        String admin_Username = request.getParameter("admin_Username");
        String admin_Email = request.getParameter("admin_Email");
        String admin_Password = request.getParameter("admin_Password");*/

        String admin_ID = request.getParameter("admin_ID");

        if (admin_ID == null || admin_ID.isEmpty())
        {
            registerDAO rg = new registerDAO();
            String result = rg.register(reg);

            if (result != null)
            {
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User successfully registered!');");
                out.println("location='login.jsp';");
                out.println("</script>");
            } else{
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User registration failed. Please try again.');");
                out.println("location='register.jsp';");
                out.println("</script>");

            }
        }
        //response.getWriter().print(result);

    }
}
