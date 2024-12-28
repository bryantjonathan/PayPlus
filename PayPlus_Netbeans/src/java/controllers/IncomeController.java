package controllers;

import models.IncomeRecord;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "IncomeController", urlPatterns = {"/Income"})
public class IncomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<IncomeRecord> incomeList = new IncomeRecord().get();
        ArrayList<ArrayList<Object>> dataIncome = new IncomeRecord().query(
                "SELECT COUNT(*),SUM(amount),SUM(CASE WHEN type = 'gift' THEN amount ELSE 0 END),SUM(CASE WHEN type = 'normal' THEN amount ELSE 0 END) FROM income");
        request.setAttribute("incomeList", incomeList);    
        request.setAttribute("listDataIncome", dataIncome);
        request.getRequestDispatcher("Pages/IncomePage.jsp").forward(request, response);
    }
}