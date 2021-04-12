package packedup;

public class StorePhones {

    private String phone;
    private int storeId;


    public StorePhones(String phone, int storeId) {
        this.setStoreId(storeId);
        this.setPhone(phone);
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

}
