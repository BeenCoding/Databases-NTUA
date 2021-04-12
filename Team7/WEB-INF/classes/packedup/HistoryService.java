package packedup;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HistoryService {

    public void updateHistory(History history) throws Exception {


        Connection con = null;

        String sql = "INSERT INTO history "
                + " (Start_Date, Price, End_Date, Barcode) "
                + " VALUES (?, ?, ?, ?);";

        ConnectionDB db = new ConnectionDB();

        try {
            //open connection and get Connection object
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(sql);

            //set values to all parameters


            stmt.setDate(1, history.getStartDate());
            stmt.setFloat(2, history.getPrice());
            stmt.setDate(3, history.getEndDate());
            stmt.setInt(4, history.getBarcode());

            //execute the SQL statement (INSERT)
            stmt.executeUpdate();

            //close PreparedStatement to release resources
            stmt.close();

        } catch (Exception e) {

            throw new Exception("Error while updating history: " + e.getMessage());

        } finally {

            if (con != null) // if connection is still open, then close.
                con.close();
        }
    }


    public Date getLastDate(String barcode) throws Exception {

        Connection con = null;

        String sql = "SELECT End_Date "
                + "FROM history "
                + "WHERE Barcode = ? "
                + "ORDER BY End_Date Desc "
                + "LIMIT 1";

        ConnectionDB db = new ConnectionDB();
        Date d = null;

        try {

            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, barcode);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                d = rs.getDate("End_Date");
            }

            rs.close();
            stmt.close();

            return d;
        } catch (Exception e) {

            throw new Exception("Error while fetching latest date: " + e.getMessage());

        } finally {
            if (con != null) con.close();

        }
    }


    public void deleteHistory(String barcode) throws Exception {
        Connection con = null;

        String sql = "DELETE FROM history WHERE barcode = " + barcode;


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

            throw new Exception("Error while delete history: " + e.getMessage());

        } finally {

            if (con != null) // if connection is still open, then close.
                con.close();
        }
    }

    public List<History> getHistoryByID(String barcode) throws Exception {

        Connection con = null;

        String sql = "SELECT * FROM history WHERE barcode=?";

        ConnectionDB db = new ConnectionDB();

        List<History> all_history = new ArrayList<History>();
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, barcode);

            ResultSet rs = stmt.executeQuery();

            /*Here in .attribute, the name of the attribute as in database =) */
            while (rs.next()) {


                History history = new History(
                        rs.getDate("history.start_date"),
                        rs.getFloat("history.price"),
                        rs.getDate("history.end_date"),
                        rs.getInt("history.barcode"));

                all_history.add(history);

            }

            rs.close();
            stmt.close();
            return all_history;
        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            if (con != null)
                con.close();
        }
    }

    public static void main(String[] args) throws Exception {
        HistoryService hs = new HistoryService();

        String barcode = "5";
        Date h = hs.getLastDate(barcode);


        System.out.println(h);
    }

}
