package models;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Bill extends Model<Bill> {
    private int id;
    private String name;
    private Long phone;
    private String dueDate;
    private double amount;
    private String category;

    public Bill() {
        this.table = "bill";
        this.primaryKey = "id";
    }

    public Bill(int id, Long phone, String name, double amount, String dueDate, String category) {
        this.table = "bill";
        this.primaryKey = "id";
        this.id = id;
        this.phone = phone;
        this.name = name;
        this.amount = amount;
        this.dueDate = dueDate;
        this.category = category;
    }

    @Override
    Bill toModel(ResultSet rs) {
        try {
            return new Bill(
                rs.getInt("id"),
                rs.getLong("phone"),    
                rs.getString("name"),
                rs.getDouble("amount"),
                rs.getString("dueDate"),
                rs.getString("category")
            );
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());           
        }
        return null;
    }

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public void displayBill() {
        System.out.println("Tagihan: " + name);
        System.out.println("Jumlah: Rp " + amount);
        System.out.println("Jatuh Tempo: " + dueDate);
    }
}