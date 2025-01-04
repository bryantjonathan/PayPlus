package controllers;

import models.Savings;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SavingsServlet", urlPatterns = {"/savings"})
public class SavingsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String m = request.getParameter("m");
        Object phone = request.getSession().getAttribute("currPhone");
        if (request.getParameterMap().isEmpty()) {
            Savings where = new Savings();
            where.where("phone = " + phone);
            ArrayList<Savings> saves = where.get();
            request.getSession().setAttribute("list", saves);
            request.getRequestDispatcher("Pages/SavingsPage.jsp").forward(request, response);
        } else if (m.equals("add")) {
            Savings where = new Savings();
            where.where("phone = " + phone);
            ArrayList<Savings> saves = where.get();
            if (saves.size() < 6) {
                request.getRequestDispatcher("Pages/AddSavings.jsp").forward(request, response);
            } else {
                request.setAttribute("alert", "Tidak dapat menambahkan tabungan baru. Jumlah tabungan maksimal: 6.");
                request.getRequestDispatcher("Pages/SavingsPage.jsp").forward(request, response);
            }
        } else if (m.equals("addtosavings")) {
            String id = request.getParameter("id");
            request.getRequestDispatcher("Pages/AddtoSavings.jsp?id=" + id).forward(request, response);
        } else if (m.equals("delete")) {
            String id = request.getParameter("id");
            Savings s = new Savings();
            s = s.find(id);
            s.delete();
            ArrayList<Savings> saves = new Savings().get();
            request.getSession().setAttribute("list", saves);
            response.sendRedirect("savings");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            Savings s = new Savings();
            s.setPhone(Long.parseLong((String)request.getSession().getAttribute("currPhone")));
            s.setNama(request.getParameter("nama"));
            s.setDeskripsi(request.getParameter("deskripsi"));
            s.setTarget(Long.parseLong(request.getParameter("target")));
            s.setTerkumpul(Long.parseLong("0"));
            s.insert();
            ArrayList<Savings> saves = new Savings().get();
            request.getSession().setAttribute("list", saves);
            response.sendRedirect("savings");
        } else if ("update".equals(action)) {
            String id = request.getParameter("id");
            Long amountToAdd = Long.parseLong(request.getParameter("amount"));
            Savings s = new Savings();
            s = s.find(id);
            s.setTerkumpul(Long.parseLong(request.getParameter("amountnow")) + amountToAdd);
            s.update();
            ArrayList<Savings> saves = new Savings().get();
            request.getSession().setAttribute("list", saves);
            response.sendRedirect("savings");
        }
    }  
}
