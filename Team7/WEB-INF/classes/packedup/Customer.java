package packedup;



import java.sql.Date;

public class Customer {
	
	private int card;
	private String name;
	private Date dob;
	private int points;
	private String street;
	private int number;
	private int postalcode;
	private String city;
	private int familymembers;
	private boolean pet;
	private String phone;
	
	
	
	public Customer(int card,String name,int points) {
		this.card = card;
		this.name = name;
		this.points = points;
	}
	
	public Customer(int card, String name, Date dob, int points, String street, int number,
			int postalcode,String city, int familymembers, boolean pet, String phone) {
		this.card = card;
		this.name = name;
		this.dob = dob;
		this.points = points;
		this.street = street;
		this.number = number;
		this.postalcode = postalcode;
		this.city = city;
		this.familymembers = familymembers;
		this.pet = pet;
		this.phone = phone;
		
		
	}
	
	public Customer(String name, Date dob, int points, String street, int number,
			int postalcode,String city, int familymembers, boolean pet, String phone) {
		this.name = name;
		this.dob = dob;
		this.points = points;
		this.street = street;
		this.number = number;
		this.postalcode = postalcode;
		this.city = city;
		this.familymembers = familymembers;
		this.pet = pet;
		this.phone = phone;
		
		
	}
	
	public int getCard() {
		return card;
	}
	public void setCard(int card) {
		this.card = card;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public Date getDOB() {
		return dob;
	}
	public void setDOB(Date dob) {
		this.dob = dob;
	}

	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
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

	public int getFamilyMembers() {
		return familymembers;
	}
	public void setFamilyMembers(int familymembers) {
		this.familymembers = familymembers;
	}

	public boolean getPet() {
		return pet;
	}
	public void setPet(boolean pet) {
		this.pet = pet;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Override
	public String toString() {
		
		return "<ul>"
				+ "<li>card= " + card + "</li>"
				+ "<li>name= " + name + "</li>"
				+ "<li>dob= " + dob + "</li>"
				+ "<li>points= " + points + "</li>"
				+ "<li>steet= " + street + "</li>"
				+ "<li>number: " + number + "</li>"
				+ "<li>postalcode: " + postalcode + "</li>"
				+ "<li>city: " + city + "</li>"
				+ "<li>familymembers: " + familymembers + "</li>"
				+ "<li>pet: " + pet + "</li>"
				+ "<li>phone: " + phone + "</li>"
				+ "</ul>"; 
	}
	
}
