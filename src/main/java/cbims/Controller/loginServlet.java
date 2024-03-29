package cbims.Controller;

import cbims.Dao.registerDAO;
import cbims.Model.register;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet
{
    public loginServlet()
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
        registerDAO lg = new registerDAO();
        register admin = new register();
        admin.setAdmin_Username(request.getParameter("admin_Username"));
        admin.setAdmin_Password(request.getParameter("admin_Password"));

        if (lg.login(admin))
        {

            HttpSession session = request.getSession(true);
            session.setAttribute("admin_Name", admin.getAdmin_Name());
            session.setAttribute("admin_ID", admin.getAdmin_ID());
            session.setAttribute("admin_PhoneNo", admin.getAdmin_PhoneNo());
            session.setAttribute("admin_Email", admin.getAdmin_Email());
            session.setAttribute("admin_Username", admin.getAdmin_Username());
            session.setAttribute("admin_Password", admin.getAdmin_Password());

            session.setAttribute("currentUser", admin);
            response.sendRedirect("index.jsp");

        }
        else
        {
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Wrong username and password. Please try again.');");
            out.println("location='login.jsp';");
            out.println("</script>");

        }
    }
}
