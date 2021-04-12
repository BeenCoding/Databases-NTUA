package packedup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class InformationService {

	public Information getInfo() throws Exception{
		
		Connection con = null;
		
		String hot_pair = "SELECT first_prod.Name as n1,second_prod.Name as n2, count(*) AS freq" + 
				" FROM " + 
				"(SELECT DISTINCT contains.Barcode, Datetime,Card_Id,Name" + 
				" FROM contains" + 
				" join product" + 
				" where contains.Barcode = product.Barcode) AS first_prod" + 
				" join" + 
				" (SELECT DISTINCT contains.Barcode, Datetime,Card_Id,Name" + 
				" FROM contains" + 
				" join product" + 
				" where contains.Barcode = product.Barcode) AS second_prod" + 
				" WHERE(" + 
				" first_prod.Datetime = second_prod.Datetime AND" + 
				" first_prod.Card_Id = second_prod.Card_Id AND" + 
				" first_prod.Barcode != second_prod.Barcode AND" + 
				" first_prod.Barcode < second_prod.Barcode" + 
				")" + 
				" GROUP BY first_prod.Barcode,second_prod.Barcode" + 
				" ORDER BY freq DESC" + 
				" LIMIT 10";
		
		String hot_rafi = "SELECT maxFreqPerShop2.Store_Id as sid, Alley,Shelf" + 
				"		FROM(" + 
				"		SELECT Store_Id,MAX(counter) AS m" + 
				"		FROM(" + 
				"			SELECT Alley,Shelf,O.Store_Id, COUNT(*) AS counter" + 
				"			FROM offers AS O, contains AS C, transaction AS T" + 
				"			WHERE C.Card_Id = T.Card_Id  and C.Datetime = T.Datetime and O.Store_Id = T.Store_Id  and O.Barcode = C.Barcode" + 
				"			GROUP BY Alley,Shelf,O.Store_Id) AS timesShelfVisited" + 
				"		GROUP BY timesShelfVisited.Store_Id) AS maxFreqPerShop," + 
				"			(SELECT Alley,Shelf,O.Store_Id, COUNT(*) AS counter" + 
				"			FROM offers AS O, contains AS C, transaction AS T" + 
				"			WHERE C.Card_Id = T.Card_Id  and C.Datetime = T.Datetime and O.Store_Id = T.Store_Id  and O.Barcode = C.Barcode" + 
				"			GROUP BY Alley,Shelf,O.Store_Id) AS maxFreqPerShop2" + 
				"		WHERE maxFreqPerShop.Store_Id = maxFreqPerShop2.Store_Id and maxFreqPerShop.m = maxFreqPerShop2.counter" + 
				"		GROUP BY maxFreqPerShop2.Store_Id";
		
		String brand_perc = "SELECT allproducts.Category_id as cid ,allproducts.categoryName as cname ,(Brand_products_p_cat/Total_products_p_cat)*100 as percentage" + 
				" from" + 
				"(" + 
				" SELECT product.Category_id,count(contains.Barcode) as Total_products_p_cat,category.Name as categoryName" + 
				" FROM product,contains,category" + 
				" WHERE product.Barcode = contains.Barcode" + 
				" and category.Category_Id = product.Category_id" + 
				" GROUP BY product.Category_id" + 
				" ORDER BY product.Category_id" + 
				") as allproducts" + 
				" LEFT JOIN" + 
				"(" + 
				" SELECT product.Category_id,count(contains.Barcode) as Brand_products_p_cat,category.Name" + 
				" FROM product,contains,category" + 
				" WHERE product.Barcode = contains.Barcode" + 
				" and category.Category_Id = product.Category_id" + 
				" and Brand_Name=1" + 
				" GROUP BY product.Category_id" + 
				" ORDER BY product.Category_id" + 
				") as brandproducts" + 
				" on allproducts.Category_id = brandproducts.Category_id";
		
		String revenue_per_hour = "SELECT hours,SUM(Total_Amount) AS Tot_amount_per_hour" + 
				" FROM(SELECT hour(Datetime) AS hours,Total_Amount" + 
				"           FROM transaction " + 
				"           ORDER BY hours asc) AS pinakas" + 
				" GROUP BY hours" + 
				" ORDER BY hours ASC";
		
		
		String custom_q1 = "SELECT Pets.Family_Members as fmembers ,noPets.avgWithoutPet,Pets.avgWithPet" + 
				" FROM" + 
				"	(SELECT Family_Members,avg(Total_Amount) AS avgWithoutPet" + 
				"	 FROM transaction" + 
				"	 left join customer" + 
				"	 on transaction.Card_Id = customer.Card" + 
				" WHERE Pet=0" + 
				" GROUP BY Family_Members" + 
				" ORDER BY Family_Members) AS noPets" + 
				" join" + 
				"	(SELECT Family_Members,avg(Total_Amount) AS avgWithPet" + 
				" 	FROM transaction" + 
				" 	left join customer" + 
				" 	on transaction.Card_Id = customer.Card" + 
				"	WHERE Pet=1" + 
				" 	GROUP BY Family_Members" + 
				" 	ORDER BY Family_Members) AS Pets" + 
				" on noPets.Family_Members = Pets.Family_Members";
		
		String elderly_groups = "SELECT allCust.hours," + 
				" youngCust.TotNumberOfCust/allCust.TotNumberOfCust *100 AS custYoungerThan35," + 
				" midCust.TotNumberOfCust/allCust.TotNumberOfCust *100 AS custBetween35and65," + 
				" seniorCust.TotNumberOfCust/allCust.TotNumberOfCust *100 AS custOlderThan65" + 
				" FROM(SELECT hours,count(*) AS TotNumberOfCust" + 
				"	   FROM(SELECT hour(Datetime) AS hours, DOB" + 
				"		      FROM transaction,customer" + 
				"		     WHERE transaction.Card_Id = customer.Card" + 
				"		     ORDER BY hours asc) AS pinakas" + 
				"                     GROUP BY hours) AS allCust" + 
				" LEFT JOIN" + 
				" (SELECT hours,count(*) AS TotNumberOfCust" + 
				" FROM(SELECT hour(Datetime) AS hours, DOB" + 
				"	   FROM transaction,customer" + 
				"	  WHERE transaction.Card_Id = customer.Card" + 
				"	  and (year(CURDATE())- YEAR(DOB)) < 35" + 
				"	  ORDER BY hours asc) AS pinakas" + 
				"          GROUP BY hours) AS youngCust" + 
				" on allCust.hours = youngCust.hours" + 
				" LEFT JOIN" + 
				" (SELECT hours,count(*) AS TotNumberOfCust" + 
				" FROM(SELECT hour(Datetime) AS hours, DOB" + 
				"	   FROM transaction,customer" + 
				"	   WHERE transaction.Card_Id = customer.Card" + 
				"	   and (year(CURDATE())- YEAR(DOB)) <= 65" + 
				"	   and (year(CURDATE())- YEAR(DOB)) >= 35" + 
				"	   ORDER BY hours asc) AS pinakas" + 
				"	   GROUP BY hours) AS midCust" + 
				" on allCust.hours = midCust.hours" + 
				" LEFT JOIN" + 
				" (SELECT hours,count(*) AS TotNumberOfCust" + 
				" FROM(SELECT hour(Datetime) AS hours, DOB" + 
				"	    FROM transaction,customer" + 
				"	    WHERE transaction.Card_Id = customer.Card" + 
				"	    and (year(CURDATE())- YEAR(DOB)) > 65" + 
				"	    ORDER BY hours asc) AS pinakas" + 
				"	    GROUP BY hours) AS seniorCust" + 
				" on allCust.hours = seniorCust.hours";
		
		String custom_q2 = "SELECT " + 
				"case" + 
				"	when year(CURDATE())-year(DOB) <30 then '18-29' " + 
				"	when year(CURDATE())-year(DOB) between 30 and 49 then '30-49'" + 
				"	when year(CURDATE())-year(DOB) between 50 and 65 then '50-65'" + 
				"	when year(CURDATE())-year(DOB) >65 then '65+'" + 
				" END AS age_range,sum(Price) AS TotalAmountSpentOnAlcohol" + 
				" FROM contains,customer,product" + 
				" WHERE " + 
				" contains.Card_Id = customer.Card" + 
				" and contains.Barcode = product.Barcode" + 
				" and product.Category_id = 3" + 
				" GROUP BY age_range" + 
				" ORDER BY age_range asc";
		
		ConnectionDB db = new ConnectionDB();
		Information infdetails = null;
		
		try {
			
			con = db.getConnection();
			
			PreparedStatement hotPair = con.prepareStatement(hot_pair);
			PreparedStatement hotRafi = con.prepareStatement(hot_rafi);
			PreparedStatement brandPerc = con.prepareStatement(brand_perc);
			PreparedStatement revenuePerHour = con.prepareStatement(revenue_per_hour);
			PreparedStatement elderlyGroups = con.prepareStatement(elderly_groups);

			PreparedStatement custom1 = con.prepareStatement(custom_q1);
			PreparedStatement custom2 = con.prepareStatement(custom_q2);

			
			ResultSet rshotPair = hotPair.executeQuery();
			ResultSet rshotRafi = hotRafi.executeQuery();
			ResultSet rsbrandPerc = brandPerc.executeQuery();
			ResultSet rsrevenuePerHour = revenuePerHour.executeQuery();
			ResultSet rselderlyGroups = elderlyGroups.executeQuery();
			
			ResultSet rsCustom1 = custom1.executeQuery();
			ResultSet rsCustom2 = custom2.executeQuery();
			
			
			LinkedHashMap<String,String> hot = new LinkedHashMap<String,String>();
			LinkedHashMap<Integer,List<Integer>> rafi = new LinkedHashMap<Integer,List<Integer>>();
			Map<String,Float> perc = new HashMap<String, Float>();
			LinkedHashMap<Integer,Float> revenue = new LinkedHashMap<Integer, Float>();
			LinkedHashMap<Integer,List<Float>> elderly = new LinkedHashMap<Integer,List<Float>>();
			
			LinkedHashMap<Integer,List<Float>> cq1 = new LinkedHashMap<Integer,List<Float>>();
			LinkedHashMap<String,Float> cq2 = new LinkedHashMap<String,Float>();
						
			
			while(rshotPair.next()) {
				hot.put(rshotPair.getString("n1"), rshotPair.getString("n2"));
			}
			
			while(rshotRafi.next()) {
				List<Integer> lista = new ArrayList<Integer>();
				lista.add(rshotRafi.getInt("Alley"));
				lista.add(rshotRafi.getInt("Shelf"));
				rafi.put(rshotRafi.getInt("sid"), lista);
			}
			
			while(rsbrandPerc.next()) {
				perc.put(rsbrandPerc.getString("cname"), rsbrandPerc.getFloat("percentage"));
			}
			
			while(rsrevenuePerHour.next()) {
				revenue.put(rsrevenuePerHour.getInt("hours"), rsrevenuePerHour.getFloat("Tot_amount_per_hour"));
			}
			
			while(rselderlyGroups.next()) {
				List<Float> list = new ArrayList<Float> ();
				list.add(rselderlyGroups.getFloat("custYoungerThan35"));
				list.add(rselderlyGroups.getFloat("custBetween35and65"));
				list.add(rselderlyGroups.getFloat("custOlderThan65"));
				elderly.put(rselderlyGroups.getInt("hours"), list);
			}
			
			while(rsCustom1.next()) {
				List<Float> l = new ArrayList<Float> ();
				l.add(rsCustom1.getFloat("avgWithoutPet"));
				l.add(rsCustom1.getFloat("avgWithPet"));
				cq1.put(rsCustom1.getInt("fmembers"), l);
			}
			
			while(rsCustom2.next()) {
				cq2.put(rsCustom2.getString("age_range"),rsCustom2.getFloat("TotalAmountSpentOnAlcohol"));
			}
			
			infdetails  = new Information(perc,revenue,elderly,hot,rafi,cq1,cq2);
			
			rsbrandPerc.close();
			rshotPair.close();
			rshotRafi.close();
			rsrevenuePerHour.close();
			rselderlyGroups.close();
			rsCustom1.close();
			rsCustom2.close();
			hotPair.close();
			hotRafi.close();
			brandPerc.close();
			revenuePerHour.close();
			elderlyGroups.close();
			custom1.close();
			custom2.close();

			return infdetails;
		} catch( Exception e ) {
			
			throw new Exception("Error while fetching information: " + e.getMessage());
			
		}finally {
			if (con != null) con.close();
		
		}
	
	}
	
}
