package packedup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SalesService {

	public List<Sales> getSalesView() throws Exception{
		
		
		Connection con = null;
		
		String sql = "SELECT * FROM SalesPerStorePerCategory ";
		
		
		ConnectionDB db = new ConnectionDB();
		
		List<Sales> sales = new ArrayList<Sales>();
		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Sales sale = new Sales(
						rs.getInt("SalesPerStorePerCategory.store_Id"),
						rs.getInt("SalesPerStorePerCategory.category_Id"),
						rs.getString("SalesPerStorePerCategory.Category"),
						rs.getFloat("SalesPerStorePerCategory.totalAmount"));
				
				sales.add (sale); 
						
			}
			
			rs.close();
			stmt.close();
			return sales;
		} catch (Exception e) {
			
			throw new Exception(e.getMessage());
			
		} finally {
			
			if (con != null)
				con.close();
		}
	}
	
}
