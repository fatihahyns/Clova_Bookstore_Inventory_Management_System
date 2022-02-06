package cbims.Controller;

import cbims.Dao.categoryDAO;
import cbims.Dao.orderdetailsDAO;
import cbims.Model.category;
import cbims.Model.orderdetails;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "orderdetailsServlet", value = "/orderdetailsServlet")
public class orderdetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public orderdetailsServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("Action").equals("Add to Cart")) {
            System.out.println("in");
            PrintWriter out = response.getWriter();

            orderdetails od = new orderdetails();
            orderdetailsDAO oddao = new orderdetailsDAO();

            od.setBook_ID(request.getParameter("book_ID"));
            od.setOrderDetails_Price(Double.parseDouble(request.getParameter("book_Price")));
            od.setOrderDetails_TotalPrice(Double.parseDouble(request.getParameter("book_Price")));


            boolean result = oddao.addToCart(od);
            System.out.println("result");

            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Item successfully added to cart!');");
                out.println("location='orders.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Item unsuccessfully added to cart. Please try again.');");
                out.println("location='orders.jsp';");
                out.println("</script>");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("orders.jsp");
            dispatcher.include(request, response);
        }

        if (request.getParameter("Action").equals("Update Quantity")) {
            System.out.println("in");
            PrintWriter out = response.getWriter();

            orderdetails od = new orderdetails();
            orderdetailsDAO oddao = new orderdetailsDAO();

            String id = request.getParameter("book_ID");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            Double price = oddao.getPriceByBookID(id);

            System.out.println(price);

            Double totalprice = price * quantity;

            od.setBook_ID(id);
            od.setOrderDetails_Quantity(quantity);
            od.setOrderDetails_TotalPrice(totalprice);

            request.setAttribute("od", od);

            boolean result = oddao.updateQuantity(od);
            System.out.println(result);

            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Quantity updated!');");
                out.println("location='orders.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Quantity failed to update. Please try again.');");
                out.println("location='orders.jsp';");
                out.println("</script>");
            }
        }

    }
}
