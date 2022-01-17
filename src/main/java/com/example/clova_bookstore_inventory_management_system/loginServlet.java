package com.example.clova_bookstore_inventory_management_system;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

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

        String admin_ID = request.getParameter("admin_ID");
        String admin_Name = request.getParameter("admin_Name");
        String admin_PhoneNo = request.getParameter("admin_PhoneNo");
        String admin_Username = request.getParameter("admin_Username");
        String admin_Email = request.getParameter("admin_Email");
        String admin_Password = request.getParameter("admin_Password");

        register log = new register(admin_ID,admin_Name,admin_PhoneNo,admin_Username,admin_Email,admin_Password);
        log.setAdmin_Username(admin_Username);
        log.setAdmin_Password(admin_Password);

        if (lg.login(log))
        {
            response.sendRedirect("index.jsp");

        }
        else
        {
            //HttpSession session = request.getSession();
            response.sendRedirect("login.jsp");

        }
    }
}
