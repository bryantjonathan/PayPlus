package controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Bill;

@WebServlet(name = "BillController", urlPatterns = {"/bill"})
public class BillController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        Object phone = request.getSession().getAttribute("currPhone");
        if (request.getParameterMap().isEmpty()) {
            request.setAttribute("title", "Daftar Tagihan");
            Bill bill = new Bill();
            bill.where("phone = " + phone);
            ArrayList<Bill> bills = bill.get();
            request.getSession().setAttribute("listbill", bills);
            request.getRequestDispatcher("Pages/BillPage.jsp").forward(request, response);
            request.getSession().removeAttribute("msg");
        } else if ("add".equals(menu)) {
            request.setAttribute("title", "Tambah Tagihan");
            request.getRequestDispatcher("Pages/BillPage.jsp").forward(request, response); 
        } else {
            response.sendRedirect("bill"); 
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        System.out.println("disini");
        if ("add".equals(action)) {
            Bill bill = new Bill();
            bill.setPhone(Long.parseLong((String) request.getSession().getAttribute("currPhone")));
            bill.setName(request.getParameter("name"));
            bill.setAmount(Double.parseDouble(request.getParameter("amount")));
            bill.setDueDate(request.getParameter("dueDate"));
            bill.setCategory(request.getParameter("category"));
            bill.insert();
            ArrayList<Bill> bills = new Bill().get();
            request.getSession().setAttribute("listbill", bills);
            request.getSession().setAttribute("msg", "Tagihan berhasil ditambahkan");
            response.sendRedirect("bill");
        } else if ("del".equals(action)) {
            Bill bill = new Bill().find(id);
            if (bill != null) {
                bill.delete();
                request.getSession().setAttribute("msg", "Tagihan berhasil dihapus");
            } else {
                request.getSession().setAttribute("msg", "Tagihan tidak ditemukan");
            }
            response.sendRedirect("bill");
        }
    }
}