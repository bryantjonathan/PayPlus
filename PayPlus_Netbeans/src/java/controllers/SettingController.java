/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;

@WebServlet(name = "SettingController", urlPatterns = {"/Setting"})
public class SettingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            request.getRequestDispatcher("Pages/Settings.jsp").forward(request, response); 
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
       
            User currUser = new User();
            String currPhone = (String) request.getSession().getAttribute("currPhone");
            currUser = currUser.find(currPhone);
            
            if(currentPassword.isEmpty()&&newPassword.isEmpty()&& currentPassword.isEmpty()){
                currUser.setName(name);
                currUser.setEmail(email);
                currUser.setPhone(Long.parseLong(phone));
                currUser.update();
                request.setAttribute("alert", "Profile updated successfully!");
                request.setAttribute("warna", "green");
            }else if (currentPassword.isEmpty()&&(newPassword.isEmpty()||currentPassword.isEmpty())){
               request.setAttribute("alert", "Please insert current password!");
               request.setAttribute("warna", "red");
            }
            else if (!currentPassword.isEmpty()&&!newPassword.isEmpty()&&!currentPassword.isEmpty()){
                if (!currUser.getPassword().equals(currentPassword)){
                    request.setAttribute("alert", "Current password is incorrect!");
                    request.setAttribute("warna", "red");
                }else{
                    if (!newPassword.isEmpty() && !newPassword.equals(confirmPassword)){
                        request.setAttribute("alert", "New passwords do not match!");
                        request.setAttribute("warna", "red");
                    }else{
                        currUser.setName(name);
                        currUser.setEmail(email);
                        currUser.setPhone(Long.parseLong(phone));
                        currUser.setPassword(confirmPassword);
                        currUser.update();
                        request.setAttribute("alert", "Profile updated successfully!");
                        request.setAttribute("warna", "green");
                    }
                }
            }
            request.getRequestDispatcher("Pages/Settings.jsp").forward(request, response);
       
    }
}