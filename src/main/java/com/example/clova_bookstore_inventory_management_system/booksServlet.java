package com.example.clova_bookstore_inventory_management_system;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.servlet.*;

@WebServlet(name = "booksServlet", value = "/booksServlet")
public class booksServlet extends HttpServlet {
    public booksServlet() {
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
        String book_ID = request.getParameter("book_ID");
        String category_ID = request.getParameter("category_ID");
        String book_Title = request.getParameter("book_Title");
        String book_AuthorName = request.getParameter("book_AuthorName");
        String book_Description = request.getParameter("book_Description");
        String book_Price = request.getParameter("book_Price");
        String book_NoOfStocks= request.getParameter("book_NoOfStocks");

        books bk= new books (book_ID, category_ID, book_Title, book_AuthorName, book_Description, book_Price, book_NoOfStocks);
        booksDAO bkDao = new booksDAO();
        String result = bkDao.insert(bk);
        response.getWriter().print(result);
    }
}
