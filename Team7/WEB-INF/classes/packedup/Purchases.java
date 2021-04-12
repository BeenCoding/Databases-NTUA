package packedup;


import java.sql.Timestamp;

public class Purchases {

	private Timestamp datetime;
	private float totalprice;
	private String paymentmethod;
	private int totalpieces;
	private int cardid;
	private int storeid;
	
	public Purchases(Timestamp datetime, float totalprice, String paymentmethod, int totalpieces, int cardid, int storeid) {
		this.datetime = datetime;
		this.totalprice = totalprice;
		this.paymentmethod = paymentmethod;
		this.totalpieces = totalpieces;
		this.cardid = cardid;
		this.storeid = storeid;
	}
	
	
	public Timestamp getDatetime() {
		return datetime;
	}
	public float getTotalPrice() {
		return totalprice;
	}
	public String getPaymentMethod() {
		return paymentmethod;
	}
	public int getTotalPieces() {
		return totalpieces;
	}
	public int getCardId() {
		return cardid;
	}
	public int getStoreId() {
		return storeid;
	}
	
	@Override
	public String toString() {
		
		return "<ul>"
				+ "<li>datetime= " + datetime + "</li>"
				+ "<li>totalprice= " + totalprice + "</li>"
				+ "<li>paymentmethod= " + paymentmethod + "</li>"
				+ "<li>totalpieces= " + totalpieces + "</li>"
				+ "<li>cardid= " + cardid + "</li>"
				+ "<li>storeid: " + storeid + "</li>"
				+ "</ul>"; 
	}
}
