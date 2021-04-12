package packedup;

import java.sql.Date;

public class Product {


    private int barcode;
    private String name;
    private float price;
    private boolean brandName;
    private Date firstTransaction;
    private int categoryId;


    public Product(int barcode, String name, float price, boolean brandName, Date firstTransaction, int categoryId) {
        this.barcode = barcode;
        this.name = name;
        this.price = price;
        this.brandName = brandName;
        this.firstTransaction = firstTransaction;
        this.categoryId = categoryId;
    }

    public Product(String name, float price, boolean brandName, Date firstTransaction, int categoryId) {
        this.name = name;
        this.price = price;
        this.brandName = brandName;
        this.firstTransaction = firstTransaction;
        this.categoryId = categoryId;
    }

    public int getBarcode() {
        return barcode;
    }

    public void setBarcode(int barcode) {
        this.barcode = barcode;
    }

    public String GetName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public boolean getBrandName() {
        return brandName;
    }

    public void setBrandName(boolean brandName) {
        this.brandName = brandName;
    }

    public Date getFirstTransaction() {
        return firstTransaction;
    }

    public void setFirstTransaction(Date firstTransaction) {
        this.firstTransaction = firstTransaction;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }


    @Override
    public String toString() {

        return "<ul>"
                + "<li>barcode= " + barcode + "</li>"
                + "<li>name= " + name + "</li>"
                + "<li>price= " + price + "</li>"
                + "<li>brandName= " + brandName + "</li>"
                + "<li>firstTransaction: " + firstTransaction + "</li>"
                + "<li>categoryId: " + categoryId + "</li>"
                + "</ul>";
    }
}
