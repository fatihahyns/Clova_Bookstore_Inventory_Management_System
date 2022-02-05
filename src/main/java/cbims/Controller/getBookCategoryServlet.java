package cbims.Controller;

import cbims.Dao.categoryDAO;
import cbims.Dao.booksDAO;
import cbims.Model.books;
import cbims.Model.category;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "getBookCategoryServlet", value = "/getBookCategoryServlet")
public class getBookCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {
            categoryDAO catdao = new categoryDAO();
            booksDAO bkdao = new booksDAO();

            String op = request.getParameter("operation");

            if (op.equals("category")){
                List<category> catlist = catdao.getAllCategory();

                Gson json = new Gson();

                String categoryList = json.toJson(catlist);

                response.setContentType("text/html");

                response.getWriter().write(categoryList);
            }


            if (op.equals("book")){
                int id = Integer.parseInt(request.getParameter("id"));
                List<books> bkList = bkdao.getBookByCategoryID(id);

                Gson json = new Gson();

                String booksList = json.toJson(bkList);

                response.setContentType("text/html");

                response.getWriter().write(booksList);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
