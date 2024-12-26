package controllers;

import models.IncomeRecord;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "IncomeController", urlPatterns = {"/Pages"})
public class IncomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<IncomeRecord> incomeList = new IncomeRecord().get();
        if(incomeList!=null){
            request.setAttribute("incomeList", incomeList);
            request.getRequestDispatcher("Pages/IncomePage.jsp").forward(request, response);
        }
        
        request.getRequestDispatcher("Pages/IncomePage.jsp").forward(request, response);
    }
}