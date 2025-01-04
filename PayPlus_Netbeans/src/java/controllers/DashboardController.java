/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import models.ExpenseRecord;
import models.IncomeRecord;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Savings;

/**
 *
 * @author fauss
 */
@WebServlet(name = "DashboardController", urlPatterns = {"/Dashboard"})
public class DashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
<<<<<<< HEAD
            throws ServletException, IOException {       
        if (request.getSession().getAttribute("currPhone") == null) {
            response.sendRedirect("User?menu=login");
        } else {
            Object phone = request.getSession().getAttribute("currPhone");
            ArrayList<ArrayList<Object>> dataExpense = new ExpenseRecord().query(
                    "SELECT SUM(amount) FROM expense WHERE phone = " + phone);
            ArrayList<ArrayList<Object>> dataIncome = new ExpenseRecord().query(
                    "SELECT SUM(amount) FROM income WHERE phone = " + phone);
            request.setAttribute("dataIncome", dataIncome);
            request.setAttribute("dataExpense", dataExpense);
            request.getRequestDispatcher("Pages/DashboardPage.jsp").forward(request, response);
        }
=======
            throws ServletException, IOException {
        String phone = "83824099809";

        ArrayList<ArrayList<Object>> dataExpense = new ExpenseRecord().query(
                "SELECT SUM(amount) FROM expense WHERE phone = " + phone);
        ArrayList<ArrayList<Object>> dataIncome = new ExpenseRecord().query(
                "SELECT SUM(amount) FROM income WHERE phone = " + phone);
        Savings where = new Savings();
        where.where("phone = 0");
        ArrayList<Savings> saves = where.get();
        request.getSession().setAttribute("list", saves);
        request.setAttribute("dataIncome", dataIncome);
        request.setAttribute("dataExpense", dataExpense);
        request.getRequestDispatcher("Pages/DashboardPage.jsp").forward(request, response);
>>>>>>> 30ffcd8c137768ad110b0175573e64cbd18a4067
    }
}
