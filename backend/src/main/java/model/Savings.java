package model;

public class Savings {
    
    private String nama;
    private double targetTabungan;
    private double tabunganSaatIni = 0;

 
    public Savings(String nama, double targetTabungan) {
        this.nama = nama;
        this.targetTabungan = targetTabungan;
    }

   
    public void setNama(String nama) {
        this.nama = nama;
    }

 
    public void setTargetTabungan(double targetTabungan) {
        this.targetTabungan = targetTabungan;
    }


    public String getNama() {
        return nama;
    }

   
    public double getTargetTabungan() {
        return targetTabungan;
    }

    public double getTabunganSaatIni() {
        return tabunganSaatIni;
    }

  
    public void addTabungan(double nilai) {
        if (nilai > 0) {
            this.tabunganSaatIni += nilai;
        } else {
            System.out.println("Nilai yang ditambahkan harus positif.");
        }
    }


    public void displaySavings() {
        System.out.println("Nama: " + nama);
        System.out.println("Target Tabungan: " + targetTabungan);
        System.out.println("Tabungan Saat Ini: " + tabunganSaatIni);
    }

}
