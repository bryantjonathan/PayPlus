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
            // Menampilkan daftar tagihan
            request.setAttribute("title", "Daftar Tagihan");
            Bill bill = new Bill();
            bill.where("phone = " + phone);
            ArrayList<Bill> bills = bill.get();
            request.getSession().setAttribute("list", bills);
            request.getRequestDispatcher("Pages/BillPage.jsp").forward(request, response);  // Memforward ke JSP
            request.getSession().removeAttribute("msg");  // Menghapus pesan sebelumnya
        } else if ("add".equals(menu)) {
            // Menampilkan form untuk menambah tagihan baru
            request.setAttribute("title", "Tambah Tagihan");
            request.getRequestDispatcher("Pages/BillPage.jsp").forward(request, response);  // Menampilkan form tambah tagihan
        } else {
            response.sendRedirect("bill");  // Redirect ke daftar tagihan jika menu tidak dikenali
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
            bill.insert(); // Menyimpan tagihan ke database
            ArrayList<Bill> bills = new Bill().get();
            request.getSession().setAttribute("list", bills);
            request.getSession().setAttribute("msg", "Tagihan berhasil ditambahkan");
            response.sendRedirect("bill");
        } else if ("del".equals(action)) {
            // Menghapus tagihan berdasarkan ID
            Bill bill = new Bill().find(id);
            if (bill != null) {
                bill.delete(); // Menghapus tagihan dari database
                request.getSession().setAttribute("msg", "Tagihan berhasil dihapus");
            } else {
                request.getSession().setAttribute("msg", "Tagihan tidak ditemukan");
            }
            response.sendRedirect("bill");
        }
    }
}