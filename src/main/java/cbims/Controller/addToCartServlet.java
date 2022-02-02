package cbims.Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import cbims.Model.cart;

@WebServlet(name = "addToCartServlet", value = "/addToCartServlet")
public class addToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {
//        	out.print("add to cart servlet");

            ArrayList<cart> cartList = new ArrayList<>();
            int id = Integer.parseInt(request.getParameter("id"));
            cart ct = new cart();
            ct.setBook_ID(id);
            ct.setQuantity(1);
            HttpSession session = request.getSession();
            ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");

            if (cart_list == null) {
                cartList.add(ct);
                session.setAttribute("cart-list", cartList);
                response.sendRedirect("menuPage.jsp");
            } else {
                cartList = cart_list;

                boolean exist = false;
                for (cart c : cart_list) {
                    if (c.getBook_ID() == id) {
                        exist = true;
                        out.println("Item Already in Cart.");
                        response.sendRedirect("orders.jsp");
                    }
                }

                if (!exist) {
                    cartList.add(ct);
                    response.sendRedirect("orders.jsp");
                }
            }

        }
    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
