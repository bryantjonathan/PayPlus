import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class IncomeController extends HttpServlet {
    private Account account;

    @Override
    public void init() throws ServletException {
        account = new Account("John Doe", "08123456789", "1234");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            double nominalUang = Double.parseDouble(request.getParameter("nominalUang"));
            String tanggalStr = request.getParameter("tanggal");
            String pengirim = request.getParameter("pengirim");
            String jenisPemasukan = request.getParameter("jenisPemasukan");
            String pesan = request.getParameter("pesan");

            Date tanggal = new SimpleDateFormat("yyyy-MM-dd").parse(tanggalStr);

            if (pesan == null || pesan.isEmpty()) {
                account.addIncome(nominalUang, tanggal, pengirim, jenisPemasukan, null);
            } else {
                account.addIncome(nominalUang, tanggal, pengirim, jenisPemasukan, pesan);
            }

            response.getWriter().write("Income added successfully. Current saldo: " + account.getSaldo());
        } catch (Exception e) {
            response.getWriter().write("Error: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        StringBuilder builder = new StringBuilder();
        builder.append("<html><body>");
        builder.append("<h1>Income Records</h1>");
        for (IncomeRecord record : account.getIncomeRecords()) {
            builder.append("<p>")
                    .append("Nominal: ").append(record.getNominalUang())
                    .append(", Date: ").append(record.getTanggal())
                    .append(", Sender: ").append(record.getPengirim())
                    .append(", Type: ").append(record.getJenisPemasukan())
                    .append(", Message: ").append(record.getPesan())
                    .append("</p>");
        }
        builder.append("</body></html>");
        response.getWriter().write(builder.toString());
    }
}
