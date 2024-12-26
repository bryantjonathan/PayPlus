/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.ResultSet;

/**
 *
 * @author fauss
 */
public class Account extends Model<Account>{
    private int id;
    private String nama;
    private String password;
    private double saldo;
    public Account() {
        this.table = "account";
        this.primaryKey = "id";
    }
    public Account(int id, String nama, String password, double saldo){
        this.table = "account";
        this.primaryKey = "id";
         this.id = id;
        this.nama = nama;
        this.password = password;
        this.saldo = saldo;
    }
    @Override
    Account toModel(ResultSet rs) {
        try {
            return new Account(
                rs.getInt("id"),
                rs.getString("nama"),
                rs.getString("password"),
                rs.getDouble("saldo")
            );
        } catch (Exception e) {
            setMessage(e.getMessage());
        }
        return null;
    }
}
