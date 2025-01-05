package controllers;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;
import models.SilverUser;
import models.BronzeUser;
import models.IncomeRecord;
import models.ExpenseRecord;

@WebServlet(name = "TransferController", urlPatterns = {"/Transfer"})
public class TransferController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Pages/transferPage.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("search".equals(action)) {
            String search = request.getParameter("searchInput");
            User user = new User();
            user = user.find(search);
            if (user != null) {
                request.setAttribute("found", user.getPhone());
                request.setAttribute("warna", "green");
                request.setAttribute("alert", "User: " + user.getName());
                request.getRequestDispatcher("Pages/transferPage.jsp").forward(request, response);
            } else {
                request.setAttribute("warna", "red");
                request.setAttribute("alert", "Error: cannot find the user");
                request.getRequestDispatcher("Pages/transferPage.jsp").forward(request, response);
            }
        } else if ("send".equals(action)) {
            LocalDate today = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String formattedDate = today.format(formatter);
            
            User user = new User();
            User currUser = new User();
            IncomeRecord income = new IncomeRecord();
            ExpenseRecord expense = new ExpenseRecord();
            String currPhone = (String) request.getSession().getAttribute("currPhone");
            currUser = currUser.find(currPhone);
            String phone = request.getParameter("phone");
            double checkBalance = currUser.getBalance() - Double.parseDouble(request.getParameter("amount"));
            String transferType = request.getParameter("transferType");
            String messagee = request.getParameter("message");
            if (checkBalance >= 0) {
                    
                    income.setDate(formattedDate);
                    income.setPhone(Long.parseLong(phone));
                    income.setSender(Long.parseLong(currPhone));
                    income.setType(transferType);
                    if(transferType.equals("normal")){
                        messagee = null;
                    }
                    income.setMessage(messagee);  
                    income.setAmount(Integer.parseInt(request.getParameter("amount")));
                    income.insert();
                    
                    expense.setDate(formattedDate);
                    expense.setPhone(Long.parseLong(currPhone));
                    expense.setReceiver(Long.parseLong(phone));
                    expense.setType(transferType);
                    expense.setMessage(messagee);
                    expense.setAmount(Integer.parseInt(request.getParameter("amount")));
                    expense.insert();
                    
                if (currUser.getRole().equals("gold")) {
                    user = user.find(phone);
                    user.setBalance(user.getBalance() + Double.parseDouble(request.getParameter("amount")));
                    currUser.setBalance(currUser.getBalance() - Double.parseDouble(request.getParameter("amount")));
                    currUser.update();
                    user.update();
                    
                    request.getSession().setAttribute("currBalance", (int) currUser.getBalance());
                    request.setAttribute("saldo", "Transfer Succeeded.");
                } else if (currUser.getRole().equals("silver")) {
                    SilverUser userType = new SilverUser();
                    user = user.find(phone);
                    user.setBalance(user.getBalance() + Double.parseDouble(request.getParameter("amount")));
                    currUser.setBalance(currUser.getBalance() - Double.parseDouble(request.getParameter("amount")) - userType.getAdminFee());
                    currUser.update();
                    user.update();
                    
                    request.getSession().setAttribute("currBalance", (int) currUser.getBalance());
                    request.setAttribute("saldo", "Transfer Succeeded.");
                } else if (currUser.getRole().equals("bronze")) {
                    BronzeUser userType = new BronzeUser();
                    user = user.find(phone);
                    user.setBalance(user.getBalance() + Double.parseDouble(request.getParameter("amount")));
                    currUser.setBalance(currUser.getBalance() - Double.parseDouble(request.getParameter("amount")) - userType.getAdminFee());
                    currUser.update();
                    user.update();
                    
                    request.getSession().setAttribute("currBalance", (int) currUser.getBalance());
                    request.setAttribute("saldo", "Transfer Succeeded.");
                }

            } else {
                request.setAttribute("saldo", "Insufficient Balance.");
            }

            request.getRequestDispatcher("Pages/transferPage.jsp").forward(request, response);
        }
    }
}
