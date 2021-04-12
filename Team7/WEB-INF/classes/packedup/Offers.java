package packedup;

public class Offers {

    private int alley;
    private int shelf;
    private int barcode;
    private int storeId;


    public Offers(int alley, int shelf, int barcode, int storeId) {

        this.alley = alley;
        this.shelf = shelf;
        this.barcode = barcode;
        this.storeId = storeId;
    }

    public int getAlley() {
        return alley;
    }

    public void setAlley(int alley) {
        this.alley = alley;
    }

    public int GetShelf() {
        return shelf;
    }

    public void setShelf(int shelf) {
        this.shelf = shelf;
    }

    public int GetBarcode() {
        return barcode;
    }

    public void setBarcode(int barcode) {
        this.barcode = barcode;
    }

    public int GetStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    @Override
    public String toString() {

        return "<ul>"
                + "<li>alley= " + alley + "</li>"
                + "<li>shelf= " + shelf + "</li>"
                + "<li>barcode= " + shelf + "</li>"
                + "<li>storeId= " + storeId + "</li>"
                + "</ul>";
    }

}
