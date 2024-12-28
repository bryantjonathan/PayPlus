package controllers;

import models.ExpenseRecord;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ExpenseController", urlPatterns = {"/Expense"})
public class ExpenseController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<ExpenseRecord> expenseList = new ExpenseRecord().get();
        request.setAttribute("expenseList", expenseList);
        request.getRequestDispatcher("Pages/ExpensePage.jsp").forward(request, response);
    }
}
