package packedup;

public class Sales {

    private int sid;
    private int cid;
    private String cname;
    private float totalAmount;

    public Sales(int sid, int cid, String cname, float totalAmount) {
        this.sid = sid;
        this.cid = cid;
        this.cname = cname;
        this.totalAmount = totalAmount;
    }

    public int getStore() {
        return sid;
    }

    public int getCategory() {
        return cid;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public String getCategoryName() {
        return cname;
    }

}
