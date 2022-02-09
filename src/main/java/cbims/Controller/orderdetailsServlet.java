package cbims.Controller;


import cbims.Dao.booksDAO;
import cbims.Dao.categoryDAO;
import cbims.Dao.orderdetailsDAO;
import cbims.Model.books;
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

            HttpSession session = request.getSession();

            try {
                if ((String) session.getAttribute("customer_Name") == null) {
                    System.out.println("no session created");
                } else {
                    String masuk = (String) session.getAttribute("customer_Name");
                    System.out.println(masuk);
                    od.setBook_ID(request.getParameter("book_ID"));
                    od.setCustomer_Name(masuk);
                    od.setOrderDetails_Price(Double.parseDouble(request.getParameter("book_Price")));
                    od.setOrderDetails_TotalPrice(Double.parseDouble(request.getParameter("book_Price")));

                    boolean result = oddao.addBookToCart(od);
                    System.out.println(result);

                    if (result == true) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Item successfully added to cart!');");
                        out.println("location='orders.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Item unsuccessfully added to cart. Please try again.');");
                        out.println("location='orders.jsp';");
                        out.println("</script>");
                    }
                    RequestDispatcher dispatcher = request.getRequestDispatcher("orders.jsp");
                    dispatcher.include(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (request.getParameter("Action").equals("Update Quantity")) {
            System.out.println("in");
            PrintWriter out = response.getWriter();

            orderdetails od = new orderdetails();
            orderdetailsDAO oddao = new orderdetailsDAO();

            books bk = new books();
            booksDAO bdao = new booksDAO();

            String id = request.getParameter("book_ID");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            //nak tengok current stock of the selected book
            int currentstock = bdao.getCurrentStock(id);

            //nak tengok price of the selected book
            Double price = oddao.getPriceByBookID(id);
            Double totalprice = price * quantity;

            //if quantity yang user masuk lebih dari current stock of the selected book, display error msg
            if (quantity > currentstock){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Not enough stock!');");
                out.println("location='orders.jsp';");
                out.println("</script>");
                System.out.println("lebih dari stock");
            }else{
                od.setBook_ID(id);
                od.setOrderDetails_Quantity(quantity);
                od.setOrderDetails_TotalPrice(totalprice);

                request.setAttribute("od", od);

                boolean result = oddao.updateQuantity(od);
                System.out.println(result);
                System.out.println("kurang dari stock");

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

        if (request.getParameter("Action").equals("Remove from Cart")){
            System.out.println("in");
            PrintWriter out = response.getWriter();

            orderdetails od = new orderdetails();
            orderdetailsDAO oddao = new orderdetailsDAO();

            String id = request.getParameter("id");

            boolean result = oddao.removeBookFromCart(id);
            System.out.println(result);

            if (result == true){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Item successfully removed from cart!');");
                out.println("location='orders.jsp';");
                out.println("</script>");
            }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Item unsuccessfully removed from cart. Please try again.');");
                out.println("location='orders.jsp';");
                out.println("</script>");
            }
        }

    }
}
