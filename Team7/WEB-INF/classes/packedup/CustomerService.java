package packedup;

import java.sql.Connection;
//import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService {
	
	public void register(Customer customer) throws Exception {

		Connection con = null;
		ConnectionDB db = new ConnectionDB();
		String insertNewCustomerSQL = "INSERT INTO customer "
				+ " (Card, Name, DOB, Points, Street, Number, Postal_Code, City, Family_Members, Pet, Phone) "
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		
		try {
					
			con = db.getConnection(); //get Connection		

			PreparedStatement stmt = con.prepareStatement(insertNewCustomerSQL);
			
			stmt.setInt(1, customer.getCard());
			stmt.setString(2, customer.getName());
			stmt.setDate(3, customer.getDOB());
			stmt.setInt(4, customer.getPoints());
			stmt.setString(5, customer.getStreet());
			stmt.setInt(6, customer.getNumber());
			stmt.setInt(7, customer.getPostal());
			stmt.setString(8, customer.getCity());
			stmt.setInt(9, customer.getFamilyMembers());
			stmt.setBoolean(10, customer.getPet());
			stmt.setString(11, customer.getPhone());
			
			stmt.executeUpdate();

			stmt.close();
			db.close(); //close connection
			
		} 
		
		catch (SQLIntegrityConstraintViolationException  e) {
			// if am or email already registered
			throw new AppCustomException("Card ID is already used!");			
			
		} catch (Exception e) {
			
			throw new Exception( "Error while inserting customer: " + e.getMessage() );
			
		} finally {
						
			if(con != null) // if connection is still open, then close.
				con.close();			
			
		}

	}// End of add new customer
	
	public List<Customer> getCustomers() throws Exception{
		
		
		Connection con = null;
		
		String sql = "SELECT * FROM customer ";
		
		
		ConnectionDB db = new ConnectionDB();
		
		List<Customer> customers = new ArrayList<Customer>();
		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Customer cust = new Customer(
						rs.getInt("customer.card"),
						rs.getString("customer.name"),
						rs.getDate("customer.dob"),
						rs.getInt("customer.points"),
						rs.getString("customer.street"),
						rs.getInt("customer.number"),
						rs.getInt("customer.postal_code"),
						rs.getString("customer.city"),
						rs.getInt("customer.family_members"),
						rs.getBoolean("customer.pet"),
						rs.getString("customer.phone"));
				
				customers.add (cust); 
						
			}
			
			rs.close();
			stmt.close();
			return customers;
		} catch (Exception e) {
			
			throw new Exception(e.getMessage());
			
		} finally {
			
			if (con != null)
				con.close();
		}
	}
	
	public List<Customer> getCustomersView() throws Exception{
		
		
		Connection con = null;
		
		String sql = "SELECT * FROM CustomerInfo ";
		
		
		ConnectionDB db = new ConnectionDB();
		
		List<Customer> customers = new ArrayList<Customer>();
		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Customer cust = new Customer(
						rs.getInt("CustomerInfo.card"),
						rs.getString("CustomerInfo.name"),
						rs.getInt("CustomerInfo.points"));
				
				customers.add (cust); 
						
			}
			
			rs.close();
			stmt.close();
			return customers;
		} catch (Exception e) {
			
			throw new Exception(e.getMessage());
			
		} finally {
			
			if (con != null)
				con.close();
		}
	}
	
	
	public List <Object> getCustomerByID(String card) throws Exception {
		
		Connection con = null;
		
		String sql = "SELECT * FROM customer WHERE customer.card =?";
		
		String number_of_stores_visit = "SELECT count(DISTINCT Store_Id) AS total FROM transaction WHERE Card_Id = ?";
		
		String all_Shops = "SELECT DISTINCT Store_Id FROM transaction WHERE Card_Id =? ORDER BY(Store_Id) Asc";
		
		String most_Liked_P = "SELECT P.Name" 
							+ " FROM contains as C, product as P" 
							+ " WHERE Card_Id = ? AND P.Barcode = C.Barcode" 
							+ " GROUP BY P.Barcode" 
							+ " ORDER BY SUM(C.Pieces) Desc" 
							+ " LIMIT 10";
		
		String common_Hours = 	"SELECT DISTINCT M.Store_Id, hours " + 
								" FROM (" + 
										" SELECT MAX(count_hours) as max_value, Store_Id" + 
										" FROM (  SELECT count(hour(Datetime)) as count_hours,Store_Id " + 
												" FROM transaction " + 
												" WHERE Card_Id = ?" + 
												" GROUP BY hour(Datetime) ,Store_Id" + 
												" ORDER BY Store_Id) as counter_of_visits_per_hour_per_store_id" + 
										" GROUP BY Store_Id) as M," + 
										" (SELECT COUNT(hours) as count_hours,Store_Id,hours" + 
										" FROM (  SELECT hour(Datetime) as hours ,Store_Id " + 
												" FROM transaction " + 
												" WHERE Card_Id = ?" + 
												" ORDER BY Store_Id Desc) as hours_visit_per_store_id" + 
												" GROUP BY hours,Store_Id" + 
										" ORDER BY Store_Id) as D" + 
								" WHERE M.max_value = D.count_hours AND M.Store_Id = D.Store_Id" + 
								" GROUP BY M.Store_Id" + 
								" ORDER BY M.Store_Id";
		
		String averages = "SELECT" + 
				" 30.5 * count( * ) / (" + 
				" (( YEAR ( CURDATE( ) ) - 2020 ) * 365.25 + ( MONTH ( CURDATE( ) ) - 1 ) * 30.5 + DAY ( CURDATE( ) - 1 ) )" + 
				" - (( YEAR ( Datetime ) - 2020 ) * 365.25 + ( MONTH ( Datetime ) - 1 ) * 30.5 + DAY ( Datetime ) - 1 ) " + 
				" ) AS AVGpMonth," + 
				" 7 * count( * ) / (" + 
				" (( YEAR ( CURDATE( ) ) - 2020 ) * 365.25 + ( MONTH ( CURDATE( ) ) - 1 ) * 30.5 + DAY ( CURDATE( ) - 1 ) )" + 
				" - (( YEAR ( Datetime ) - 2020 ) * 365.25 + ( MONTH ( Datetime ) - 1 ) * 30.5 + DAY ( Datetime ) - 1 )" + 
				" ) AS AVGpWeek" + 
				" FROM transaction" + 
				" WHERE Card_Id = ?" + 
				" ORDER BY Datetime ASC" + 
				" LIMIT 1";
		
		
		ConnectionDB db = new ConnectionDB();
		Customer cust = null;
		CustomerDetails custdetails = null;
		
		try {
			
			con = db.getConnection();
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, card);
			
			PreparedStatement numberOfStores = con.prepareStatement(number_of_stores_visit);
			numberOfStores.setString(1, card);

			PreparedStatement allStores = con.prepareStatement(all_Shops);
			allStores.setString(1, card);
			
			PreparedStatement mostLikedP = con.prepareStatement(most_Liked_P);
			mostLikedP.setString(1, card);
			
			PreparedStatement commonH = con.prepareStatement(common_Hours);
			commonH.setString(1, card);
			commonH.setString(2, card);
			
			PreparedStatement avg = con.prepareStatement(averages);
			avg.setString(1, card);

			ResultSet rs = stmt.executeQuery();
			ResultSet rsNumberOfStores = numberOfStores.executeQuery();
			ResultSet rsAllStores = allStores.executeQuery();
			ResultSet rsMostLikedP = mostLikedP.executeQuery();
			ResultSet rsCommonH = commonH.executeQuery();
			ResultSet rsAvg = avg.executeQuery();
			
			
			if (rs.next()) {
				
				cust = new Customer(
						rs.getInt("customer.card"),
						rs.getString("customer.name"),
						rs.getDate("customer.dob"),
						rs.getInt("customer.points"),
						rs.getString("customer.street"),
						rs.getInt("customer.number"),
						rs.getInt("customer.postal_code"),
						rs.getString("customer.city"),
						rs.getInt("customer.family_members"),
						rs.getBoolean("customer.pet"),
						rs.getString("customer.phone"));	
			}
			int nStores = 0;
			if(rsNumberOfStores.next()) {
				nStores = rsNumberOfStores.getInt("total");
			}
			
			ArrayList <Integer> stores = new ArrayList <Integer>();
			
			while(rsAllStores.next()) {
				stores.add(rsAllStores.getInt("Store_Id"));
			}
			
			ArrayList <String> products = new ArrayList <String>();
			
			while(rsMostLikedP.next()) {
				products.add(rsMostLikedP.getString("Name"));
			}
			
			Map<Integer,Integer> commonHours = new HashMap<Integer, Integer>();
			
			while(rsCommonH.next()) {
				commonHours.put(rsCommonH.getInt("Store_Id"), rsCommonH.getInt("hours"));
			}
			
			float avgWeek = 0;
			float avgMonth = 0;
			if(rsAvg.next()) {
				avgMonth = rsAvg.getFloat("AVGpMonth");
				avgWeek = rsAvg.getFloat("AVGpWeek");
			}

			
			custdetails  = new CustomerDetails(nStores,stores,products,commonHours,avgMonth,avgWeek);
			
			rs.close();
			rsNumberOfStores.close();
			rsAllStores.close();
			rsCommonH.close();
			stmt.close();
			numberOfStores.close();
			allStores.close();
			commonH.close();
			avg.close();
			
			List<Object> list = new ArrayList<Object> ();
			
			list.add(cust);
			list.add(custdetails);
			
			return list;
		} catch( Exception e ) {
			
			throw new Exception("Error while fetching customer: " + e.getMessage());
			
		}finally {
			if (con != null) con.close();
		
		}
	
	}
	public void updateCustomer(Customer customer) throws Exception {
		
		
			Connection con = null;
			
			String sql= "UPDATE customer SET Name=?, DOB=?, Points=?, "
						+ " Street=?, Number=? , Postal_Code = ?, City = ?, Family_Members = ?, Pet = ?, Phone = ? WHERE Card=?;";
	                    
			
			ConnectionDB db = new ConnectionDB();
					
			try {
				//open connection and get Connection object			
				con = db.getConnection();
				
				PreparedStatement stmt = con.prepareStatement(sql);
				
				//set values to all parameters
				
				
				stmt.setString(1, customer.getName());
				stmt.setDate(2, customer.getDOB());
				stmt.setInt(3, customer.getPoints());
				stmt.setString(4, customer.getStreet());
				stmt.setInt(5, customer.getNumber());
				stmt.setInt(6, customer.getPostal());
				stmt.setString(7, customer.getCity());
				stmt.setInt(8, customer.getFamilyMembers());
				stmt.setBoolean(9, customer.getPet());
				stmt.setString(10, customer.getPhone());
				stmt.setInt(11, customer.getCard());
				
				//execute the SQL statement (INSERT)	
				stmt.executeUpdate();
				
				//close PreparedStatement to release resources	
				stmt.close();			
	
			} catch (Exception e) {
				
				throw new Exception( "Error while updating customer: " + e.getMessage() );
				
			} finally {
				
				if(con != null) // if connection is still open, then close.
					con.close();
			}
		}
		
		
	// End of updateCustomer
	
	public void deleteCustomer(String card) throws Exception{
		Connection con = null;
		
		String sql= "DELETE FROM customer WHERE card = " + card;
                    
		
		ConnectionDB db = new ConnectionDB();
				
		try {
			//open connection and get Connection object			
			con = db.getConnection();
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//execute the SQL statement (INSERT)	
			stmt.executeUpdate();
			
			//close PreparedStatement to release resources	
			stmt.close();			

		} catch (Exception e) {
			
			throw new Exception( "Error while delete customer: " + e.getMessage() );
			
		} finally {
			
			if(con != null) // if connection is still open, then close.
				con.close();
		}
	}
	
	/*public static void main(String[] args) throws Exception {
		CustomerService custservice = new CustomerService();
		
		String card = "1";
		Customer customer = custservice.getCustomerByID(card);

		
		System.out.println(customer);
	}*/

	public static void main(String[] args) throws Exception {
		CustomerService custservice = new CustomerService();
		
		String card = "102";
		List <Object> customer = custservice.getCustomerByID(card);
		
		CustomerDetails c = (CustomerDetails) customer.get(1);
		System.out.println(c.getAvgMonth());
		//System.out.println(c.getShopCount());
	}
}
