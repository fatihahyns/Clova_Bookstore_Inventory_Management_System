package cbims.Controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class MyFilter
 */
public class MyFilter implements Filter {
    /**
     * Default constructor.
     */
    public MyFilter() {
        // TODO Auto-generated constructor stub
    }
    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        // TODO Auto-generated method stub
    }
    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // TODO Auto-generated method stub
        // place your code here
        if (request.getParameter("Action").equals("Add Book"))
            // pass the request along the filter chain
            chain.doFilter(request, response);
        if (request.getParameter("Action").equals("Update Book"))
            // pass the request along the filter chain
            chain.doFilter(request, response);
        if (request.getParameter("Action").equals("Delete Book"))
            // pass the request along the filter chain
            chain.doFilter(request, response);

        if (request.getParameter("Action").equals("Add Category"))
            // pass the request along the filter chain
            chain.doFilter(request, response);
        if (request.getParameter("Action").equals("Update Category"))
            // pass the request along the filter chain
            chain.doFilter(request, response);
        if (request.getParameter("Action").equals("Delete Category"))
            // pass the request along the filter chain
            chain.doFilter(request, response);

        if (request.getParameter("Action").equals("Add Customer"))
            // pass the request along the filter chain
            chain.doFilter(request, response);
        if (request.getParameter("Action").equals("Update Customer"))
            // pass the request along the filter chain
            chain.doFilter(request, response);
        if (request.getParameter("Action").equals("Delete Customer"))
            // pass the request along the filter chain
            chain.doFilter(request, response);

        if (request.getParameter("Action").equals("Add Supplier"))
            // pass the request along the filter chain
            chain.doFilter(request, response);
        if (request.getParameter("Action").equals("Update Supplier"))
            // pass the request along the filter chain
            chain.doFilter(request, response);
        if (request.getParameter("Action").equals("Delete Supplier"))
            // pass the request along the filter chain
            chain.doFilter(request, response);

        if (request.getParameter("Action").equals("Add to Cart"))
        // pass the request along the filter chain
            chain.doFilter(request, response);
        if (request.getParameter("Action").equals("Update Quantity"))
            // pass the request along the filter chain
            chain.doFilter(request, response);
        if (request.getParameter("Action").equals("Remove from Cart"))
            // pass the request along the filter chain
            chain.doFilter(request, response);
    }
    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
    }
}
