package models;

public class SilverUser extends User implements HasAdminFee {
    private final double ADMIN_FEE = 2000;
    private final int TOTAL_SAVINGS = 3;
    
    public SilverUser() {
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
