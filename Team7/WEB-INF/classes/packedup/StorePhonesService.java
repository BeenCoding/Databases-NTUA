package packedup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StorePhonesService {


    public void insert(StorePhones store_phones) throws Exception {

        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        String insertNewPhoneSQL = "INSERT INTO store_phones "
                + " (Phone, Store_Id) "
                + " VALUES (?, ?);";

        try {

            con = db.getConnection(); //get Connection

            PreparedStatement stmt = con.prepareStatement(insertNewPhoneSQL);

            stmt.setString(1, store_phones.getPhone());
            stmt.setInt(2, store_phones.getStoreId());

            stmt.executeUpdate();

            stmt.close();
            db.close(); //close connection

        } catch (SQLException e) {

            throw new Exception(e.getMessage());

        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            if (con != null) // if connection is still open, then close.
                con.close();

        }

    }


    public void deletePhone(String phone) throws Exception {
        Connection con = null;

        String sql = "DELETE FROM store_phones WHERE store_phones.Phone= " + phone;


        ConnectionDB db = new ConnectionDB();

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {

            throw new Exception("Error while delete phone: " + e.getMessage());

        } finally {

            if (con != null) // if connection is still open, then close.
                con.close();
        }
    }


    public List<StorePhones> getPhones(String storeId) throws Exception {

        Connection con = null;

        String sql = "SELECT * FROM store_phones WHERE store_phones.Store_Id=? ";


        ConnectionDB db = new ConnectionDB();

        List<StorePhones> phones = new ArrayList<StorePhones>();
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, storeId);

            ResultSet rs = stmt.executeQuery();

            /*Here in .attribute, the name of the attribute as in database =) */
            while (rs.next()) {


                StorePhones phone = new StorePhones(
                        rs.getString("store_phones.Phone"),
                        rs.getInt("store_phones.Store_Id"));

                phones.add(phone);

            }
            rs.close();
            stmt.close();
            return phones;
        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            if (con != null)
                con.close();
        }
    }

}
