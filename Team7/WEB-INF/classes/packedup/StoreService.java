package packedup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

public class StoreService {

	public void insert(Store store) throws Exception {

		Connection con = null;
		ConnectionDB db = new ConnectionDB();
		String insertNewStoreSQL = "INSERT INTO store "
				+ " (Store_Id, Operating_Hours, Size, Street, Number, Postal_Code, City) "
				+ " VALUES (?, ?, ?, ?, ?, ?, ?);";
		
		try {
					
			con = db.getConnection(); //get Connection		

			PreparedStatement stmt = con.prepareStatement(insertNewStoreSQL);
			
			stmt.setInt(1, store.getStoreId());
			stmt.setString(2, store.GetOperatingHours());
			stmt.setInt(3, store.getSize());
			stmt.setString(4, store.getStreet());
			stmt.setInt(5, store.getNumber());
			stmt.setInt(6, store.getPostal());
			stmt.setString(7, store.getCity());
			
			stmt.executeUpdate();

			stmt.close();
			db.close(); //close connection
			
		} catch (SQLIntegrityConstraintViolationException  e) {
			// if am or email already registered
			throw new AppCustomException("Store ID is already used!");			
			
		} catch (Exception e) {
						
			throw new Exception(e.getMessage());
			
		} finally {
						
			if(con != null) // if connection is still open, then close.
				con.close();			
			
		}

	}
	
	public void deleteStore(String id) throws Exception{
		Connection con = null;
		
		String sql= "DELETE FROM store WHERE store_id = " + id;
                    
		
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
			
			throw new Exception( "Error while delete store: " + e.getMessage() );
			
		} finally {
			
			if(con != null) // if connection is still open, then close.
				con.close();
		}
	}
	
	public void updateStore(Store store) throws Exception {
		
		
		Connection con = null;
		
		String sql= "UPDATE store SET Operating_Hours=?, Size=?, Street=?, "
					+ " Number=? , Postal_Code = ?, City = ? WHERE Store_Id=?;";
                    
		
		ConnectionDB db = new ConnectionDB();
				
		try {
			con = db.getConnection();
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//set values to all parameters
			
			
			stmt.setString(1, store.GetOperatingHours());
			stmt.setInt(2, store.getSize());
			stmt.setString(3, store.getStreet());
			stmt.setInt(4, store.getNumber());
			stmt.setInt(5, store.getPostal());
			stmt.setString(6, store.getCity());
			stmt.setInt(7, store.getStoreId());

			stmt.executeUpdate();
			
			stmt.close();			

		} catch (Exception e) {
			
			throw new Exception( "Error while updating store: " + e.getMessage() );
			
		} finally {
			
			if(con != null) // if connection is still open, then close.
				con.close();
		}
	}
	
	
	public List<Store> getStores() throws Exception{
				
		Connection con = null;
		
		String sql = "SELECT * FROM store ";
		
		
		ConnectionDB db = new ConnectionDB();
		
		List<Store> stores = new ArrayList<Store>();
		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			
			/*Here in .attribute, the name of the attribute as in database =) */
			while(rs.next()) {
				Store store= new Store(
						rs.getInt("store.store_Id"),
						rs.getString("store.operating_Hours"),
						rs.getInt("store.size"),
						rs.getString("store.street"),
						rs.getInt("store.number"),
						rs.getInt("store.postal_code"),
						rs.getString("store.city"));
				
				stores.add (store); 
						
			}
			
			rs.close();
			stmt.close();
			return stores;
		} catch (Exception e) {
			
			throw new Exception(e.getMessage());
			
		} finally {
			
			if (con != null)
				con.close();
		}
	}
	
	public Store getStoreByID(String storeid) throws Exception {
		
		Connection con = null;
		
		String sql = "SELECT * FROM store WHERE store.store_Id =?";
		
		ConnectionDB db = new ConnectionDB();
		Store store = null;
		
		try {
			
			con = db.getConnection();
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, storeid);
			
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				
				store = new Store(
						rs.getInt("store.store_Id"),
						rs.getString("store.operating_Hours"),
						rs.getInt("store.size"),
						rs.getString("store.street"),
						rs.getInt("store.number"),
						rs.getInt("store.postal_code"),
						rs.getString("store.city"));	
			}
			
			rs.close();
			stmt.close();
			
			return store;
		} catch( Exception e ) {
			
			throw new Exception("Error while fetching store: " + e.getMessage());
			
		}finally {
			if (con != null) con.close();
		
		}
	}
	/*public static void main(String[] args) throws Exception {
		StoreService storeservice = new StoreService();
		
		String storeid = "1";
		Store store = storeservice.getStoreByID(storeid);
	
		
		System.out.println(store);
	}*/
	
	
}
