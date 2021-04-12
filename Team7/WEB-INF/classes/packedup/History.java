package packedup;

import java.sql.Date;

public class History {

    private Date startDate;
    private float price;
    private Date endDate;
    private int barcode;

    public History(Date startDate, float price, Date endDate, int barcode) {
        this.startDate = startDate;
        this.price = price;
        this.endDate = endDate;
        this.barcode = barcode;
    }

    public Date getStartDate() {
        return startDate;
    }

    public float getPrice() {
        return price;
    }

    public Date getEndDate() {
        return endDate;
    }

    public int getBarcode() {
        return barcode;
    }

    @Override
    public String toString() {

        return "<ul>"
                + "<li>startDate= " + startDate + "</li>"
                + "<li>price= " + price + "</li>"
                + "<li>endDate= " + endDate + "</li>"
                + "<li>barcode= " + barcode + "</li>"
                + "</ul>";
    }

}
