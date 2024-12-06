import java.util.Date;

public class IncomeRecord {
    private String transactionID;
    private double nominalUang;
    private Date tanggal;
    private String pengirim;
    private String jenisPemasukan;
    private String pesan;

    public IncomeRecord(double nominalUang, Date tanggal, String pengirim, String jenisPemasukan) {
        this.nominalUang = nominalUang;
        this.tanggal = tanggal;
        this.pengirim = pengirim;
        this.jenisPemasukan = jenisPemasukan;
        this.pesan = null; // Default null for normal income
    }

    public IncomeRecord(double nominalUang, Date tanggal, String pengirim, String jenisPemasukan, String pesan) {
        this.nominalUang = nominalUang;
        this.tanggal = tanggal;
        this.pengirim = pengirim;
        this.jenisPemasukan = jenisPemasukan;
        this.pesan = pesan;
    }

    public double getNominalUang() {
        return nominalUang;
    }

    public Date getTanggal() {
        return tanggal;
    }

    public String getPengirim() {
        return pengirim;
    }

    public String getJenisPemasukan() {
        return jenisPemasukan;
    }

    public String getPesan() {
        return pesan;
    }
}
