package controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Product;

@WebServlet(name = "ProductController", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        if (request.getParameterMap().isEmpty()) { //view menu Model
            request.setAttribute("title", "Daftar Produk");
            ArrayList<Product> prods = new Product().get();
            request.setAttribute("list", prods);
            request.getRequestDispatcher("product/view.jsp").forward(request, response);
            request.getSession().removeAttribute("msg");
        } else if ("custom".equals(menu)) { //view menu Object
            request.setAttribute("title", "Dashboard");
            ArrayList<ArrayList<Object>> prods = new Product().query(
                "SELECT COUNT(*), AVG(price) FROM product");
            request.setAttribute("list", prods);
            request.getRequestDispatcher("product/view_rdbms.jsp").forward(request, response);
        } else if ("add".equals(menu)) { //add menu
            request.setAttribute("title", "Tambah produk");
            request.getRequestDispatcher("product/form.jsp").forward(request, response);
        } else if ("edit".equals(menu)) { //edit menu
            
        } else if ("qb".equals(menu)) { //view menu with query builder example 
            
        } else {
            response.sendRedirect("product");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        if (id == null) { //insert data
            Product p = new Product();
            p.setName(request.getParameter("name"));
            p.setPrice(Double.parseDouble(request.getParameter("price")));
            p.insert();
            request.getSession().setAttribute("msg", "Produk berhasil ditambahkan");
        } else if (action == null) { //update data
            
        } else if ("del".equals(action)) { //delete data
            
        }
        response.sendRedirect("product");
    }
}
