package cbims.Controller;

import cbims.Dao.booksDAO;
import cbims.Dao.orderdetailsDAO;
import cbims.Dao.ordersDAO;

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

        if (request.getParameter("Action").equals("Place Order")) {
            System.out.println("in");
            PrintWriter out = response.getWriter();

            ordersDAO odao = new ordersDAO();
            orderdetailsDAO oddao = new orderdetailsDAO();
            booksDAO bdao = new booksDAO();

            HttpSession session = request.getSession();

            try {
                if ((String) session.getAttribute("customer_Name") == null) {
                    System.out.println("no session created");
                } else {
                    String masuk = (String) session.getAttribute("customer_Name");
                    System.out.println(masuk);

                        boolean result = odao.placeOrder(masuk);

                        if (result == true) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Item has been placed. Thank you for your order.');");
                            out.println("location='orders.jsp';");
                            out.println("</script>");
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Item can't be placed. Please try again.');");
                            out.println("location='orders.jsp';");
                            out.println("</script>");
                        }

                        oddao.deleteCartOnceOrderHasBeenPlaced(masuk);

                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}
