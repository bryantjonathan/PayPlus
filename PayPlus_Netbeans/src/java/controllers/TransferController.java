package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;

@WebServlet(name = "TransferController", urlPatterns = {"/Transfer"})
public class TransferController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Pages/transferPage.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("search".equals(action)) {
            String search = request.getParameter("searchInput");
            User user = new User();
            user = user.find(search);
            if (user != null) {
                request.setAttribute("found", user.getPhone());
                request.setAttribute("warna", "green");
                request.setAttribute("alert", "User: " + user.getName());
                request.getRequestDispatcher("Pages/transferPage.jsp").forward(request, response);
            } else {
                request.setAttribute("warna", "red");
                request.setAttribute("alert", "Error: cannot find the user");
                request.getRequestDispatcher("Pages/transferPage.jsp").forward(request, response);
            }
        } else if ("send".equals(action)) {
            User user = new User();
            User currUser = new User();
            String currPhone = (String) request.getSession().getAttribute("currPhone");
            currUser = currUser.find(currPhone);
            String phone = request.getParameter("phone");
            double checkBalance = currUser.getBalance() - Double.parseDouble(request.getParameter("amount"));
            if (checkBalance >= 0) {
                user = user.find(phone);
                user.setBalance(user.getBalance() + Double.parseDouble(request.getParameter("amount")));
                currUser.setBalance(currUser.getBalance() - Double.parseDouble(request.getParameter("amount")));
                currUser.update();
                user.update();
                request.getSession().setAttribute("currBalance", (int) currUser.getBalance());
                request.setAttribute("saldo", "Transfer Succeeded.");
            } else {
                request.setAttribute("saldo", "Insufficient Balance.");
            }

            request.getRequestDispatcher("Pages/transferPage.jsp").forward(request, response);
//            response.sendRedirect("transferPage.jsp");

        }
    }
}
