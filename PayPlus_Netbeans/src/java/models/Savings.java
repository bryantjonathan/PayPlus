package models;

import java.sql.ResultSet;

public class Savings extends Model<Savings> {

    private int id;
    private Long phone;
    private String nama;
    private String deskripsi;
    private double target;
    private double terkumpul;

    public Savings() {
        this.table = "savings";
        this.primaryKey = "id";
    }

    public Savings(int id, Long phone, String nama, String deskripsi, double target, double terkumpul) {
        this.table = "savings";
        this.primaryKey = "id";
        this.id = id;
        this.phone = phone;
        this.nama = nama;
        this.deskripsi = deskripsi;
        this.target = target;
        this.terkumpul = terkumpul;
    }

    @Override
    Savings toModel(ResultSet rs) {
        try {
            return new Savings(
                    rs.getInt("id"),
                    rs.getLong("phone"),
                    rs.getString("nama"),
                    rs.getString("deskripsi"),
                    rs.getDouble("target"),
                    rs.getDouble("terkumpul")
            );
        } catch (Exception e) {
            setMessage(e.getMessage());
        }
        return null;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public double getTarget() {
        return target;
    }

    public void setTarget(double target) {
        this.target = target;
    }

    public double getTerkumpul() {
        return terkumpul;
    }

    public void setTerkumpul(double terkumpul) {
        this.terkumpul = terkumpul;
    }

}
