package com.example.clova_bookstore_inventory_management_system;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

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
        String admin_ID = request.getParameter("admin_ID");
        String admin_Name = request.getParameter("admin_Name");
        String admin_PhoneNo = request.getParameter("admin_PhoneNo");
        String admin_Username = request.getParameter("admin_Username");
        String admin_Email = request.getParameter("admin_Email");
        String admin_Password = request.getParameter("admin_Password");

        register reg = new register(admin_ID,admin_Name,admin_PhoneNo,admin_Username,admin_Email,admin_Password);
        registerDAO rg = new registerDAO();
        String result = rg.register(reg);
        response.getWriter().print(result);

    }
}
