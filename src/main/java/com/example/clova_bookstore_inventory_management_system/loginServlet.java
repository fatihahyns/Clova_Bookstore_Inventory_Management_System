package com.example.clova_bookstore_inventory_management_system;

import com.google.protobuf.Message;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import static java.lang.System.out;

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


        /*int admin_ID = Integer.parseInt(request.getParameter("admin_ID")) ;
        String admin_Name = request.getParameter("admin_Name");
        String admin_PhoneNo = request.getParameter("admin_PhoneNo");
        String admin_Username = request.getParameter("admin_Username");
        String admin_Email = request.getParameter("admin_Email");
        String admin_Password = request.getParameter("admin_Password");*/

        // register log = new register(admin_ID,admin_Name,admin_PhoneNo,admin_Username,admin_Email,admin_Password);
        /*log.setAdmin_Username(admin_Username);
        log.setAdmin_Password(admin_Password);
        log.setAdmin_PhoneNo(admin_PhoneNo);
        log.setAdmin_Email(admin_Email);
        log.setAdmin_Username(admin_Username);
        log.setAdmin_Password(admin_Password);*/

        //HttpSession session = request.getSession(true);
         //log = lg.login(log);
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
            out.println("alert('WRONG USERNAME OR PASSWORD! PLEASE LOGIN AGAIN!');");
            out.println("location='login.jsp';");
            out.println("</script>");

        }
    }
}
