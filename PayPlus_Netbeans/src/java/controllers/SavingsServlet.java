package controllers;

import models.Savings;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.BronzeUser;
import models.GoldUser;
import models.SilverUser;
import models.User;

@WebServlet(name = "SavingsServlet", urlPatterns = {"/savings"})
public class SavingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String m = request.getParameter("m");
        String phoneNow = (String) request.getSession().getAttribute("currPhone");
        int nTabungan = 0;
        User userRightNow = new User();
        userRightNow = userRightNow.find(phoneNow);
        if (userRightNow.getRole().equals("bronze")) {
            BronzeUser bUser = new BronzeUser();
            nTabungan = bUser.getTotalSavings();
        } else if (userRightNow.getRole().equals("silver")) {
            SilverUser sUser = new SilverUser();
            nTabungan = sUser.getTotalSavings();
        } else {
            GoldUser gUser = new GoldUser();
            nTabungan = gUser.getTotalSavings();
        }

        if (request.getParameterMap().isEmpty()) {
            Savings where = new Savings();
            where.where("phone = " + phoneNow);
            ArrayList<Savings> saves = where.get();
            request.getSession().setAttribute("list", saves);
            request.getRequestDispatcher("Pages/SavingsPage.jsp").forward(request, response);
        } else if (m.equals("add")) {
            Savings where = new Savings();
            where.where("phone = " + phoneNow);
            ArrayList<Savings> saves = where.get();
            if (saves.size() < nTabungan) {
                request.getRequestDispatcher("Pages/AddSavings.jsp").forward(request, response);
            } else {
                request.setAttribute("alert", "Tidak dapat menambahkan tabungan baru. Jumlah tabungan maksimal: " + nTabungan + ".");
                request.getRequestDispatcher("Pages/SavingsPage.jsp").forward(request, response);
            }
        } else if (m.equals("addtosavings")) {
            String id = request.getParameter("id");
            request.getRequestDispatcher("Pages/AddtoSavings.jsp?id=" + id).forward(request, response);
        } else if (m.equals("delete")) {
            String id = request.getParameter("id");
            Savings s = new Savings();
            s = s.find(id);
            User userNow = new User();
            userNow = userNow.find(phoneNow);
            double transferBalance = (double) s.getTerkumpul();
            double balanceNow = userNow.getBalance();
            double transferredBalance = transferBalance + balanceNow;
            userNow.setBalance(transferredBalance);
            userNow.update();
            request.getSession().setAttribute("currBalance", (int) userNow.getBalance());
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
            s.setPhone(Long.parseLong((String) request.getSession().getAttribute("currPhone")));
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
