package models;

public class GoldUser extends User {
    private final int TOTAL_SAVINGS = 5;
    
    public GoldUser() {
        super();
    }
    
    public int getTotalSavings() {
        return TOTAL_SAVINGS;
    }
}
