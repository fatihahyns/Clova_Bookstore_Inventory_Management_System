package cbims.Controller;

import cbims.Dao.orderdetailsDAO;
import cbims.Dao.ordersDAO;
import cbims.Model.orderdetails;
import cbims.Model.orders;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ordersServlet", value = "/ordersServlet")
public class ordersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ordersServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        if (request.getParameter("Action").equals("Place Order")) {
//            System.out.println("in");
//            PrintWriter out = response.getWriter();
//
//            orders o = new orders();
//            ordersDAO odao = new ordersDAO();
//
//            HttpSession session = request.getSession();
//
//            try {
//                if ((String) session.getAttribute("customer_Name") == null) {
//                    System.out.println("no session created");
//                } else {
//                    String masuk = (String) session.getAttribute("customer_Name");
//                    System.out.println(masuk);
//                    od.setBook_ID(request.getParameter("book_ID"));
//                    od.setCustomer_Name(masuk);
//                    od.setOrderDetails_Price(Double.parseDouble(request.getParameter("book_Price")));
//                    od.setOrderDetails_TotalPrice(Double.parseDouble(request.getParameter("book_Price")));
//
//                    boolean result = oddao.addBookToCart(od);
//                    System.out.println(result);
//
//                    if (result == true) {
//                        out.println("<script type=\"text/javascript\">");
//                        out.println("alert('Item successfully added to cart!');");
//                        out.println("location='orders.jsp';");
//                        out.println("</script>");
//                    } else {
//                        out.println("<script type=\"text/javascript\">");
//                        out.println("alert('Item unsuccessfully added to cart. Please try again.');");
//                        out.println("location='orders.jsp';");
//                        out.println("</script>");
//                    }
//                    RequestDispatcher dispatcher = request.getRequestDispatcher("orders.jsp");
//                    dispatcher.include(request, response);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }

    }
}
