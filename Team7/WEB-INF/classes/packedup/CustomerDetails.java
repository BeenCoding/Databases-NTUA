package packedup;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


public class CustomerDetails {
	private int shopcount;
	private ArrayList <Integer> shops = new ArrayList <Integer>();
	private ArrayList <String> products = new ArrayList <String>();
	private Map<Integer,Integer> commonHours = new HashMap<Integer, Integer>();
	private float avgMonth;
	private float avgWeek;
	
	
	public CustomerDetails (int shopcount, ArrayList <Integer> shops, ArrayList <String> products, Map<Integer,Integer> commonHours,float avgMonth,float avgWeek) {
		this.shopcount = shopcount;
		this.shops = shops;
		this.products = products;
		this.commonHours = commonHours;
		this.avgMonth = avgMonth;
		this.avgWeek = avgWeek;
		
	}
	
	public int getShopCount() {
		return shopcount;
	}

	public ArrayList<Integer> getAllShops() {
		return shops;
	}
	
	public ArrayList<String> getMostLikedProducts() {
		return products;
	}
	
	public Map<Integer,Integer> getCommonHours() {
		return commonHours;
	}
	
	public float getAvgMonth() {
		return avgMonth;
	}
	
	public float getAvgWeek() {
		return avgWeek;
	}
}

