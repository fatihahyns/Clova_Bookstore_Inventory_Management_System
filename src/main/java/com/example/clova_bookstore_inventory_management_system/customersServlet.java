package com.example.clova_bookstore_inventory_management_system;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.servlet.*;

@WebServlet(name = "customersServlet", value = "/customersServlet")
public class customersServlet extends HttpServlet {
    public customersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customer_ID = request.getParameter("customer_ID");
        String customer_Name = request.getParameter("customer_Name");
        String customer_PhoneNo = request.getParameter("customer_PhoneNo");
        String customer_Email = request.getParameter("customer_Email");

        customers cust= new customers (customer_ID, customer_Name, customer_PhoneNo, customer_Email);
        customersDAO custDao = new customersDAO();
        String result = custDao.insert(cust);
        response.getWriter().print(result);
    }
}
