package cbims.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cbims.Dao.categoryDAO;
import cbims.Dao.suppliersDAO;
import cbims.Model.category;
import cbims.Model.suppliers;


@WebServlet(name = "categoryServlet", value = "/categoryServlet")
public class categoryServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public categoryServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("Action").equals("Add Category")) {
            System.out.println("in");
            PrintWriter out = response.getWriter();

            category cat = new category();
            categoryDAO catdao = new categoryDAO();

            cat.setCategory_Name(request.getParameter("category_Name"));
            cat.setCategory_NoOfBooks(request.getParameter("category_NoOfBooks"));

            boolean result = catdao.addCategory(cat);

            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data added successfully!');");
                out.println("location='category.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data unsuccessfully added. Please try again.');");
                out.println("location='category.jsp';");
                out.println("</script>");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("category.jsp");
            dispatcher.include(request, response);
        }

        if (request.getParameter("Action").equals("Update Category")) {
            System.out.println("in");
            PrintWriter out = response.getWriter();

            category cat = new category();
            categoryDAO catdao = new categoryDAO();

            String id = request.getParameter("id");
            int cid = Integer.parseInt(id);

            cat.setCategory_ID(cid);
            cat.setCategory_Name(request.getParameter("category_Name"));
            cat.setCategory_NoOfBooks(request.getParameter("category_NoOfBooks"));

            request.setAttribute("cat", cat);

            boolean result = catdao.updateCategory(cat);
            System.out.println(result);

            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data updated successfully!');");
                out.println("location='category.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data unsuccessfully updated. Please try again.');");
                out.println("location='category.jsp';");
                out.println("</script>");
            }
        }

        if (request.getParameter("Action").equals("Delete Category")){
            System.out.println("in");
            PrintWriter out = response.getWriter();

            category cat = new category();
            categoryDAO catdao = new categoryDAO();

            String id = request.getParameter("id");
            int cid = Integer.parseInt(id);

            boolean result = catdao.deleteCategory(cid);
            System.out.println(result);

            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data deleted successfully!');");
                out.println("location='category.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Data unsuccessfully deleted. Please try again.');");
                out.println("location='category.jsp';");
                out.println("</script>");
            }
        }
    }
}
