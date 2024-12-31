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
        ArrayList<ArrayList<Object>> dataExpense = new ExpenseRecord().query(
                "SELECT SUM(amount), "
                        + "COUNT(*), "
                        + "SUM(CASE WHEN type = 'normal' THEN amount ELSE 0 END), "
                        + "SUM(CASE WHEN type = 'gift' THEN amount ELSE 0 END) "
                        + "FROM expense WHERE phone = 83824099809");
        request.setAttribute("dataExpense", dataExpense);
        
        String filter = request.getParameter("filter");
        String phone = "83824099809";
        
        ExpenseRecord conds = new ExpenseRecord();
        if (request.getParameterMap().isEmpty()) { // view all
            conds.where("phone = " + phone);
            ArrayList<ExpenseRecord> expenseList = conds.get();
            request.setAttribute("expenseList", expenseList);
        } else if ("normal".equals(filter)) { //view filter normal
            conds.where("phone = " + phone + " AND type = 'normal'");
            ArrayList<ExpenseRecord> expenseList = conds.get();
            request.setAttribute("expenseList", expenseList);
        } else if ("gift".equals(filter)) { // view filter gift
            conds.where("phone = " + phone + " AND type = 'gift'");
            ArrayList<ExpenseRecord> expenseList = conds.get();
            request.setAttribute("expenseList", expenseList);
        } else {
            response.sendRedirect("Expense");
        }
             
        request.getRequestDispatcher("Pages/ExpensePage.jsp").forward(request, response);
    }
}
