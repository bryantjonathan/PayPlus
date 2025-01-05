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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("currPhone") == null) {
            response.sendRedirect("User?menu=login");
        } else {
            Object phone = request.getSession().getAttribute("currPhone");
            ArrayList<ArrayList<Object>> dataIncome = new IncomeRecord().query(
                    "SELECT SUM(amount), "
                    + "COUNT(*), "
                    + "SUM(CASE WHEN type = 'normal' THEN amount ELSE 0 END), "
                    + "SUM(CASE WHEN type = 'gift' THEN amount ELSE 0 END), " 
                    + "SUM(CASE WHEN type = 'topup' THEN amount ELSE 0 END) "
                    + "FROM income WHERE phone =" + phone);
            request.setAttribute("dataIncome", dataIncome);

            String filter = request.getParameter("filter");
            IncomeRecord conds = new IncomeRecord();
            if (request.getParameterMap().isEmpty()) {
                conds.where("phone = " + phone);
                ArrayList<IncomeRecord> incomeList = conds.get();
                request.setAttribute("IncomeList", incomeList);
            } else if ("normal".equals(filter)) { 
                conds.where("phone = " + phone + " AND type = 'normal'");
                ArrayList<IncomeRecord> incomeList = conds.get();
                request.setAttribute("IncomeList", incomeList);
            } else if ("gift".equals(filter)) { 
                conds.where("phone = " + phone + " AND type = 'gift'");
                ArrayList<IncomeRecord> incomeList = conds.get();
                request.setAttribute("IncomeList", incomeList);
            } else if ("topup".equals(filter)) { 
                conds.where("phone = " + phone + " AND type = 'topup'");
                ArrayList<IncomeRecord> incomeList = conds.get();
                request.setAttribute("IncomeList", incomeList);
            }
            request.getRequestDispatcher("Pages/IncomePage.jsp").forward(request, response);
        }
    }
}
