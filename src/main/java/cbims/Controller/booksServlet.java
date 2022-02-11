package cbims.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cbims.Dao.booksDAO;
import cbims.Model.books;

@WebServlet(name = "booksServlet", value = "/booksServlet")
public class booksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public booksServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("Action").equals("Add Book")) {
            System.out.println("in");
            PrintWriter out = response.getWriter();

            books bk = new books();
            booksDAO bkdao = new booksDAO();

            bk.setCategory_ID(request.getParameter("category_ID"));
            bk.setSupplier_ID(request.getParameter("supplier_ID"));
            bk.setBook_AuthorName(request.getParameter("book_AuthorName"));
            bk.setBook_Title(request.getParameter("book_Title"));
            bk.setBook_ISBN(request.getParameter("book_ISBN"));
            bk.setBook_Description(request.getParameter("book_Description"));
            bk.setBook_Price(request.getParameter("book_Price"));
            bk.setBook_NoOfStocks(request.getParameter("book_NoOfStocks"));

            boolean result = bkdao.addBook(bk);

            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data added successfully!');");
                out.println("location='books.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data unsuccessfully added. Please try again.');");
                out.println("location='books.jsp';");
                out.println("</script>");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("books.jsp");
            dispatcher.include(request, response);
        }

        if (request.getParameter("Action").equals("Update Book")) {
            System.out.println("in");
            PrintWriter out = response.getWriter();

            books bk = new books();
            booksDAO bkdao = new booksDAO();

            String id = request.getParameter("id");
            int bid = Integer.parseInt(id);

            bk.setBook_ID(bid);
            bk.setCategory_ID(request.getParameter("category_ID"));
            bk.setSupplier_ID(request.getParameter("supplier_ID"));
            bk.setBook_AuthorName(request.getParameter("book_AuthorName"));
            bk.setBook_Title(request.getParameter("book_Title"));
            bk.setBook_ISBN(request.getParameter("book_ISBN"));
            bk.setBook_Description(request.getParameter("book_Description"));
            bk.setBook_Price(request.getParameter("book_Price"));
            bk.setBook_NoOfStocks(request.getParameter("book_NoOfStocks"));

            request.setAttribute("bk", bk);

            boolean result = bkdao.updateBook(bk);
            System.out.println(result);

            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data updated successfully!');");
                out.println("location='books.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data unsuccessfully updated. Please try again.');");
                out.println("location='books.jsp#list-books';");
                out.println("</script>");
            }

        }

        if (request.getParameter("Action").equals("Delete Book")){
            System.out.println("in");
            PrintWriter out = response.getWriter();

            books bk = new books();
            booksDAO bkdao = new booksDAO();

            String id = request.getParameter("id");
            int bid = Integer.parseInt(id);

            boolean result = bkdao.deleteBook(bid);
            System.out.println(result);

            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data deleted successfully!');");
                out.println("location='books.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data unsuccessfully deleted. Please try again.');");
                out.println("location='books.jsp';");
                out.println("</script>");
            }
        }




    }
}
