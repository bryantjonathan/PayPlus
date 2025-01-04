package models;

public class BronzeUser extends User implements HasAdminFee {
    private final double ADMIN_FEE = 2000;
    private final int TOTAL_SAVINGS = 5;
    
    public BronzeUser() {
        super();
    }
    
    @Override
    public double getAdminFee() {
        return ADMIN_FEE;
    }
    
    public int getTotalSavings() {
        return TOTAL_SAVINGS;
    }
}
