package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;

@WebServlet(name = "UserController", urlPatterns = {"/User"})
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");

        if ("logout".equals(menu)) {
            request.getSession().invalidate();
            response.sendRedirect(request.getContextPath());

        } else if("login".equals(menu)){
            request.getRequestDispatcher("Pages/LoginPage.jsp").forward(request, response); 
        } else if("signup".equals(menu)){
            request.getRequestDispatcher("Pages/SignUpPage.jsp").forward(request, response);           
        } else if("topup".equals(menu)){
            request.getRequestDispatcher("Pages/topupPage.jsp").forward(request, response);
        } else {
            response.sendRedirect("User?menu=login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            User user = new User();
            user.setName(request.getParameter("name"));
            user.setEmail(request.getParameter("email"));
            user.setPassword(request.getParameter("password"));
            user.setPhone(Long.parseLong(request.getParameter("phone").trim()));
            user.setBalance(Double.parseDouble(request.getParameter("balance")));
            double sementara = Double.parseDouble(request.getParameter("balance"));
            String role;
            if (sementara > 10000000) {
                role = "gold";
            } else if (sementara < 10000000 && sementara > 5000000) {
                role = "silver";
            } else {
                role = "bronze";
            }

            user.setRole(role);
            user.insert();
            request.getSession().setAttribute("msg", "User berhasil ditambahkan");
            response.sendRedirect("User?menu=login");
        }  else if ("login".equals(action)) {
            
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");

            if (phone != null && password != null) {
                User user = new User();
                user = user.find(phone);
                if (user != null) {
                    if (user.getPassword().equals(password)) {
                        request.getSession().setAttribute("currPhone", phone);
                        request.getSession().setAttribute("currName", user.getName());
                        request.getSession().setAttribute("currBalance", (int) user.getBalance());
                        response.sendRedirect("Dashboard");
                    } else {
                        request.setAttribute("error", "phone number or password incorrect");
                        request.getRequestDispatcher("Pages/LoginPage.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("error", "user not found");
                    request.getRequestDispatcher("Pages/LoginPage.jsp").forward(request, response);
                }
            }

        } else if ("topup".equals(action)) {
            User currUser = new User();
            String currPhone = (String) request.getSession().getAttribute("currPhone");
            currUser = currUser.find(currPhone);
            currUser.setBalance(currUser.getBalance() + Double.parseDouble(request.getParameter("topup")));
            currUser.update();
            request.getSession().setAttribute("currBalance", (int) currUser.getBalance());
            request.setAttribute("saldo", "Top up Succeeded.");
            request.getRequestDispatcher("Pages/topupPage.jsp").forward(request, response);

        } else {
            response.sendRedirect("User");
        }
    }
}
