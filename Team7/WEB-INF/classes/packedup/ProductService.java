package packedup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

public class ProductService {

    public void deleteProduct(String barcode) throws Exception {
        Connection con = null;

        String sql = "DELETE FROM product WHERE barcode = " + barcode;


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

            throw new Exception("Error while delete product: " + e.getMessage());

        } finally {

            if (con != null) // if connection is still open, then close.
                con.close();
        }
    }

    public void updateProduct(Product product) throws Exception {


        Connection con = null;

        String sql = "UPDATE product SET Name=?, Price=?, Brand_Name=?, "
                + " First_Transaction=? , Category_Id= ? WHERE Barcode=?;";


        ConnectionDB db = new ConnectionDB();

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(sql);

            //set values to all parameters


            stmt.setString(1, product.GetName());
            stmt.setFloat(2, product.getPrice());
            stmt.setBoolean(3, product.getBrandName());
            stmt.setDate(4, product.getFirstTransaction());
            stmt.setInt(5, product.getCategoryId());
            stmt.setInt(6, product.getBarcode());


            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {

            throw new Exception("Error while updating store: " + e.getMessage());

        } finally {

            if (con != null) // if connection is still open, then close.
                con.close();
        }
    }


    public void insert(Product product) throws Exception {

        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        String insertNewProductSQL = "INSERT INTO product "
                + " (Barcode, Name, Price, Brand_Name, First_Transaction, Category_id) "
                + " VALUES (?, ?, ?, ?, ?, ?);";

        try {

            con = db.getConnection(); //get Connection

            PreparedStatement stmt = con.prepareStatement(insertNewProductSQL);

            stmt.setInt(1, product.getBarcode());
            stmt.setString(2, product.GetName());
            stmt.setFloat(3, product.getPrice());
            stmt.setBoolean(4, product.getBrandName());
            stmt.setDate(5, product.getFirstTransaction());
            stmt.setInt(6, product.getCategoryId());

            stmt.executeUpdate();

            stmt.close();
            db.close(); //close connection

        } catch (SQLIntegrityConstraintViolationException e) {
            // if am or email already registered
            throw new AppCustomException("Barcode is already used!");

        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            if (con != null) // if connection is still open, then close.
                con.close();

        }

    }

    public Product getByID(String barcode) throws Exception {

        Connection con = null;

        String sql = "SELECT * FROM product WHERE product.barcode =?";

        ConnectionDB db = new ConnectionDB();
        Product product = null;

        try {

            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, barcode);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                product = new Product(
                        rs.getInt("product.barcode"),
                        rs.getString("product.name"),
                        rs.getFloat("product.price"),
                        rs.getBoolean("product.brand_name"),
                        rs.getDate("product.first_transaction"),
                        rs.getInt("product.category_id"));
            }

            rs.close();
            stmt.close();

            return product;
        } catch (Exception e) {

            throw new Exception("Error while fetching product: " + e.getMessage());

        } finally {
            if (con != null) con.close();

        }
    }


    public List<Product> getProducts() throws Exception {

        Connection con = null;

        String sql = "SELECT * FROM product ";


        ConnectionDB db = new ConnectionDB();

        List<Product> products = new ArrayList<Product>();
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            /*Here in .attribute, the name of the attribute as in database =) */
            while (rs.next()) {


                Product product = new Product(
                        rs.getInt("product.barcode"),
                        rs.getString("product.name"),
                        rs.getFloat("product.price"),
                        rs.getBoolean("product.brand_name"),
                        rs.getDate("product.first_transaction"),
                        rs.getInt("product.category_id"));

                products.add(product);

            }

            rs.close();
            stmt.close();
            return products;
        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            if (con != null)
                con.close();
        }
    }
	
	/*public static void main(String[] args) throws Exception {
		ProductService prodservice = new ProductService();
	
		List <Product> products = prodservice.getProducts();
		
		System.out.println(products);
	}*/

}
