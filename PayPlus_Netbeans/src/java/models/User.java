package models;


import java.sql.ResultSet;


public class User extends Model<User> {
    private String name;
    private String email;
    private String password;
    private Long phone;
    private double balance;
    private String role;

    // Constructor
    public User() {
        this.table = "users";
        this.primaryKey= "phone";
    }

    public User(String name, String email, String password, Long phone, double balance, String role ) {
        this.table = "users";
        this.primaryKey= "phone";
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.balance=balance;
        this.role = role;
    }
    
    

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    
    @Override
    User toModel(ResultSet rs){
        try{
            return new User(
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getLong("phone"),
                rs.getDouble("balance"),
                rs.getString("role")
                
            );
        }catch (Exception e){
            setMessage(e.getMessage());
        }
        return null;
    }
}
