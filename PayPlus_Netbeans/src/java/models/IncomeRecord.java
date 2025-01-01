package models;

import java.sql.ResultSet;
import java.sql.SQLException;

public class IncomeRecord extends Model<IncomeRecord> {
    private int id;
    private int amount;
    private long phone;
    private String sender;
    private String type;
    private String date;
    private String message;
    public IncomeRecord () {
        this.table = "income";
        this.primaryKey = "id";
    }

    public IncomeRecord (int id, int amount, long phone, String sender, String type, String date, String message) {
        this();
        this.id = id;
        this.amount = amount;
        this.phone = phone;
        this.sender = sender;
        this.type = type;
        this.date = date;
        this.message = message;
    }

    @Override
    public IncomeRecord toModel(ResultSet rs) {
        try {
            return new IncomeRecord(
                rs.getInt("id"),
                rs.getInt("amount"),
                rs.getLong("phone"),
                rs.getString("sender"),
                rs.getString("type"),
                rs.getString("date"),
                rs.getString("message")
            );
        } catch (SQLException e) {
            setMessage(e.getMessage());
            return null;
        }
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    public String getMessage(){
        return message;
    }
    
    public void setMessage(String message){
        this.message = message;
    }
}