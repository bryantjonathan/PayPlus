/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import models.Savings;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andrewinnn
 */
@WebServlet(name = "SavingsServlet", urlPatterns = {"/savings"})
public class SavingsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String m = request.getParameter("m");
        if (request.getParameterMap().isEmpty()) {
            Savings where = new Savings();
            where.where("phone = 0");
            ArrayList<Savings> saves = where.get();
            request.getSession().setAttribute("list", saves);
            request.getRequestDispatcher("SavingsPage.jsp").forward(request, response);
        } else if (m.equals("add")) {
            Savings where = new Savings();
            where.where("phone = 0");
            ArrayList<Savings> saves = where.get();
            if (saves.size() < 6) {
                request.getRequestDispatcher("AddSavings.jsp").forward(request, response);
            } else {
                request.setAttribute("alert", "Tidak dapat menambahkan tabungan baru. Jumlah tabungan maksimal: 6.");
                request.getRequestDispatcher("SavingsPage.jsp").forward(request, response);
            }
        } else if (m.equals("addtosavings")) {
            String id = request.getParameter("id");
            request.getRequestDispatcher("AddtoSavings.jsp?id=" + id).forward(request, response);
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            Savings s = new Savings();
            s.setPhone(Long.parseLong("0"));
            s.setNama(request.getParameter("nama"));
            s.setDeskripsi(request.getParameter("deskripsi"));
            s.setTarget(Double.parseDouble(request.getParameter("target")));
            s.setTerkumpul(0);
            s.insert();
            ArrayList<Savings> saves = new Savings().get();
            request.getSession().setAttribute("list", saves);
            response.sendRedirect("savings");
        } else if ("update".equals(action)) {
            String id = request.getParameter("id");
            double amountToAdd = Double.parseDouble(request.getParameter("amount"));
            Savings s = new Savings();
            s = s.find(id);
            s.setTerkumpul(Double.parseDouble(request.getParameter("amountnow")) + amountToAdd);
            s.update();
            ArrayList<Savings> saves = new Savings().get();
            request.getSession().setAttribute("list", saves);
            response.sendRedirect("savings");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
    
}
