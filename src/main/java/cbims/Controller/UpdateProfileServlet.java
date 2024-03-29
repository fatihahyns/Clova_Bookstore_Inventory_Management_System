package cbims.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cbims.Dao.registerDAO;
import cbims.Model.register;

@WebServlet(name = "UpdateProfileServlet", value = "/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet
{

    private static final long serialVersionUID = 1L;
    private static String EDIT = "/profile.jsp";
    private static String LIST_USER = "/AdminList.jsp";
    private registerDAO adminDao;

    public UpdateProfileServlet() {
        super();
        adminDao = new registerDAO();
    }

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
       String forward = "";
       String action = request.getParameter("action");


        if (action.equalsIgnoreCase("edit"))
        {
           forward = EDIT;
           int admin_ID = Integer.parseInt(request.getParameter("admin_ID"));
           register admin = adminDao.getUserById(admin_ID);
           request.setAttribute("admin", admin);
           adminDao.updateUser(admin);
       }
        else if (action.equalsIgnoreCase("listUser"))
       {
           forward = LIST_USER;
           request.setAttribute("admins", adminDao.getAllUsers());
       }


       RequestDispatcher view = request.getRequestDispatcher(forward);
       view.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        register admin = new register();


        admin.setAdmin_Name(request.getParameter("admin_Name"));
        admin.setAdmin_PhoneNo(request.getParameter("admin_PhoneNo"));
        admin.setAdmin_Username(request.getParameter("admin_Username"));
        admin.setAdmin_Email(request.getParameter("admin_Email"));
        admin.setAdmin_Password(request.getParameter("admin_Password"));


        HttpSession session = request.getSession(true);

        session.setAttribute("admin_Name", admin.getAdmin_Name());
        session.setAttribute("admin_PhoneNo", admin.getAdmin_PhoneNo());
        session.setAttribute("admin_Username", admin.getAdmin_Username());
        session.setAttribute("admin_Email", admin.getAdmin_Email());
        session.setAttribute("admin_Password", admin.getAdmin_Password());


            admin.setAdmin_ID(Integer.parseInt(request.getParameter("admin_ID")));
            adminDao.updateUser(admin);
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Data updated successfully!');");
            out.println("location='profile.jsp';");
            out.println("</script>");

    }
}
