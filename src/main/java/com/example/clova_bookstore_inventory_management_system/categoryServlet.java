package com.example.clova_bookstore_inventory_management_system;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.servlet.*;

@WebServlet(name = "categoryServlet", value = "/categoryServlet")
public class categoryServlet extends HttpServlet {

    public categoryServlet() {
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
        String category_ID= request.getParameter("category_ID");
        String category_Name = request.getParameter("category_Name");
        String category_NoOfBooks = request.getParameter("category_NoOfBooks");

        category cat= new category (category_ID, category_Name, category_NoOfBooks);
        categoryDAO catDao = new categoryDAO();
        String result = catDao.insert(cat);
        response.getWriter().print(result);
    }
}
