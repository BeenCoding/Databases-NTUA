package packedup;

public class Store {

	
	private int storeId;
	private String operatingHours;
	private int size;
	private String street;
	private int number;
	private int postalcode;
	private String city;
	
	
	public Store(int storeId,String operatingHours,int size,String street, int number, int postalcode,
			String city) {
		this.storeId = storeId;
		this.operatingHours = operatingHours;
		this.size = size;
		this.street = street;
		this.number = number;
		this.postalcode = postalcode;
		this.city = city;		
	}
	
	public Store(String operatingHours,int size,String street, int number, int postalcode,String city) {
		this.operatingHours = operatingHours;
		this.size = size;
		this.street = street;
		this.number = number;
		this.postalcode = postalcode;
		this.city = city;		
	}
	
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String GetOperatingHours() {
		return operatingHours;
	}
	public void setOperatingHours(String operatingHours) {
		this.operatingHours = operatingHours;
	}

	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}

	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}

	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}

	public int getPostal() {
		return postalcode;
	}
	public void setPostal(int postalcode) {
		this.postalcode = postalcode;
	}

	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}

	
	@Override
	public String toString() {
		
		return "<ul>"
				+ "<li>storeId= " + storeId + "</li>"
				+ "<li>operatingHours= " + operatingHours + "</li>"
				+ "<li>size= " + size + "</li>"
				+ "<li>street= " + street + "</li>"
				+ "<li>number: " + number + "</li>"
				+ "<li>postalcode: " + postalcode + "</li>"
				+ "<li>city: " + city + "</li>"
				+ "</ul>"; 
	}	
	
	
}
