package packedup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OffersService {
	
	public void insert(Offers offers) throws Exception {

		Connection con = null;
		ConnectionDB db = new ConnectionDB();
		String insertNewOfferSQL = "INSERT INTO offers "
				+ " (Shelf, Alley, Barcode, Store_Id) "
				+ " VALUES (?, ?, ?, ?);";
		
		try {
					
			con = db.getConnection(); //get Connection		

			PreparedStatement stmt = con.prepareStatement(insertNewOfferSQL);
			
			stmt.setInt(1, offers.GetShelf());
			stmt.setInt(2, offers.getAlley());
			stmt.setInt(3, offers.GetBarcode());
			stmt.setInt(4, offers.GetStoreId());
			
			stmt.executeUpdate();

			stmt.close();
			db.close(); //close connection
			
		} catch (SQLException e) {
			
			throw new Exception(e.getMessage());

		} catch (Exception e) {
						
			throw new Exception(e.getMessage());
			
		} finally {
						
			if(con != null) // if connection is still open, then close.
				con.close();			
			
		}

	}
	
	
	public void deleteOffer(String barcode) throws Exception{
		Connection con = null;
		
		String sql= "DELETE FROM offers WHERE barcode = " + barcode;
                    
		
		ConnectionDB db = new ConnectionDB();
				
		try {
			con = db.getConnection();
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.executeUpdate();
			
			stmt.close();			

		} catch (Exception e) {
			
			throw new Exception( "Error while delete offer: " + e.getMessage() );
			
		} finally {
			
			if(con != null) // if connection is still open, then close.
				con.close();
		}
	}
	
	
	
	public List<Offers> getOffers(String barcode) throws Exception{
		
		Connection con = null;
		
		String sql = "SELECT * FROM offers WHERE offers.barcode=? ";
		
		
		
		ConnectionDB db = new ConnectionDB();
		
		List<Offers> offers = new ArrayList<Offers>();
		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, barcode);

			ResultSet rs = stmt.executeQuery();
			
			/*Here in .attribute, the name of the attribute as in database =) */
			while(rs.next()) {
				
				
				Offers offer = new Offers(
						rs.getInt("offers.shelf"),
						rs.getInt("offers.alley"),
						rs.getInt("offers.barcode"),
						rs.getInt("offers.store_Id"));
				
				offers.add (offer); 
						
			}
			
			rs.close();
			stmt.close();
			return offers;
		} catch (Exception e) {
			
			throw new Exception(e.getMessage());
			
		} finally {
			
			if (con != null)
				con.close();
		}
	}
	
	public static void main(String[] args) throws Exception {
		OffersService offservice = new OffersService();
		String barcode = "1";
		List<Offers> offers = offservice.getOffers(barcode);
		for(Offers offer: offers) {
			System.out.println(offer);
		}
	}
}
