package packedup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PurchasesService {

	public List<Purchases> PurchasesFilter(String shopname, String datestart, String dateend, String tpieces, String tcost, String paymethod, String cat) throws Exception{
		
		
		Connection con = null;
		
		String sqltemp = "SELECT DISTINCT Datetime,Store_Id,Card_Id,Payment_Method,Total_Pieces,Total_Amount " + 
						 "FROM( SELECT T.Store_Id,T.Card_Id,T.Datetime,T.Total_Pieces,T.Payment_Method,T.Total_Amount,P.Category_Id " + 
						 		"FROM product as P,transaction as T,contains as C " + 
						 		"WHERE C.Barcode = P.Barcode AND T.Datetime = C.Datetime AND T.Card_Id = C.Card_Id) as A " + 
						 "WHERE 1=1 ";
		if(!"".equals(shopname)) {
			sqltemp += " AND Store_Id = " + shopname;
		}
		if(!"".equals(datestart)) {
			sqltemp += " AND Datetime >= " + "'" + datestart + "'"  ;
		}
		if(!"".equals(dateend)) {
			sqltemp += " AND Datetime < " + "'" + dateend + "'"  ;
		}
		if(!"".equals(tpieces)) {
			sqltemp += " AND Total_Pieces = " + tpieces;
		}
		if(!"".equals(paymethod)) {
			sqltemp += " AND Payment_Method = " + "'" +paymethod + "'";
		}
		if(!"".equals(tcost)) {
			sqltemp += " AND Total_Amount = " + tcost;
		}
		if(!"".equals(cat)) {
			sqltemp += " AND " + cat + " = all (SELECT P.Category_Id "
					+ "FROM contains as C, product as P "
					+ "WHERE C.Barcode = P.Barcode AND C.Datetime = A.Datetime AND C.Card_Id = A.Card_Id) "
					+ "GROUP BY Datetime";
		}
		

		ConnectionDB db = new ConnectionDB();
		
		List<Purchases> purchases = new ArrayList<Purchases>();
		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqltemp);

			System.out.println(stmt);
			
			ResultSet rs = stmt.executeQuery();
			int counter = 0;
			while(rs.next()) {
				Purchases transaction = new Purchases(
						rs.getTimestamp("A.datetime"),
						rs.getFloat("A.total_amount"),
						rs.getString("A.payment_method"),
						rs.getInt("A.total_pieces"),
						rs.getInt("A.card_id"),
						rs.getInt("A.store_id"));
				counter += 1;
				purchases.add (transaction); 
						
			}
			System.out.println(counter);
			rs.close();
			stmt.close();
			return purchases;
		} catch (Exception e) {
			
			throw new Exception(e.getMessage());
			
		} finally {
			
			if (con != null)
				con.close();
		}
		
	}
	
	public static void main(String[] args) throws Exception {
		PurchasesService purchservice = new PurchasesService();
		
		String shopname = "";
		String datestart = "";
		String dateend = "";
		String tpieces = "";
		String tcost = "";
		String paymethod = "";
		String category = "1";
		List<Purchases> purchase = purchservice.PurchasesFilter(shopname,datestart,dateend,tpieces,tcost,paymethod,category);
		
		
		
		System.out.println(purchase);
	}
	
}
