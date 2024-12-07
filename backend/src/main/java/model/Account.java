import java.util.ArrayList;
import java.util.Date;

public class Account {
    private double saldo;
    private String nama;
    private String PIN;
    private String noTelp;
    private ArrayList<IncomeRecord> arrIncome;

    public Account(String nama, String noTelp, String PIN) {
        this.nama = nama;
        this.noTelp = noTelp;
        this.PIN = PIN;
        this.saldo = 0.0; // Default saldo is 0
        this.arrIncome = new ArrayList<>();
    }

    public void addIncome(double nominalUang, Date tanggal, String pengirim, String jenisPemasukan, String pesan) {
        if (jenisPemasukan.equalsIgnoreCase("normal")) {
            arrIncome.add(new IncomeRecord(nominalUang, tanggal, pengirim, jenisPemasukan));
        } else {
            arrIncome.add(new IncomeRecord(nominalUang, tanggal, pengirim, jenisPemasukan, pesan));
        }
        saldo += nominalUang; // Update saldo
    }

    public double getSaldo() {
        return saldo;
    }

    public String getNama() {
        return nama;
    }

    public ArrayList<IncomeRecord> getIncomeRecords() {
        return arrIncome;
    }
}
