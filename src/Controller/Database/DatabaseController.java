package Controller.Database;


import java.sql.Connection
;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.sql.Statement;


import Utills.StringUtills;
import model.CartModel;
import model.OrderModel;
import model.PasswordEncryption;
import model.ProductModel;
import model.UserLoginModel;
import model.UserModel;

public class DatabaseController {
    
    // Get database connection
    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName(StringUtills.DRIVER_NAME);
        return DriverManager.getConnection(StringUtills.LOCALHOST_URL, StringUtills.LOCALHOST_USERNAME, StringUtills.LOCALHOST_PASSWORD);
    }

    // Check if username is taken
    public boolean isUsernameTaken(String username) {
        String query = "SELECT COUNT(*) FROM customer WHERE username = ?";
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            return rs.next() && rs.getInt(1) > 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // Check if email is taken
    public boolean isEmailTaken(String email) {
        String query = "SELECT COUNT(*) FROM customer WHERE email = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next() && rs.getInt(1) > 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // Register user
    public int userRegister(UserModel user) {
        if (isUsernameTaken(user.getUserName()) || isEmailTaken(user.getEmail())) {
            return -1; // Username or email already taken
        }
        String query = StringUtills.USER_DETAIL;
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            st.setString(1, user.getFirstName());
            st.setString(2, user.getLastName());
            st.setString(3, user.getAddress());
            st.setString(4, user.getPhoneNumber());
            st.setString(5, user.getEmail());
            st.setString(6, user.getUserName());
            st.setString(7, PasswordEncryption.encrypt(user.getUserName(), user.getPassword()));
            int rowsAffected = st.executeUpdate();

            if (rowsAffected > 0) {
                return 1; // Registration successful
            } else {
                return 0; // Registration failed
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return -2; // Internal error
        }
    }

    // Check if user exists
    public boolean isUserExists(String username) {
        String query = "SELECT COUNT(*) FROM customer WHERE Username = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            return rs.next() && rs.getInt(1) > 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // Validate user credentials
    public boolean validateUser(UserLoginModel loginModel) {
        String query = "SELECT Password FROM customer WHERE Username = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, loginModel.getUserName());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String encryptedPass = rs.getString("Password");
                String decryptedPass = PasswordEncryption.decrypt(encryptedPass, loginModel.getUserName());
                return decryptedPass.equals(loginModel.getPassword());
            }
            return false;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // Get user login info
    public int getUserLoginInfo(UserLoginModel loginModel) {
        String query = StringUtills.LOGIN_CHECK;
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, loginModel.getUserName());
            ResultSet result = st.executeQuery();
            if (result.next()) {
                String userDb = result.getString(StringUtills.USERNAME);
                String encryptedPass = result.getString(StringUtills.PASSWORD);
                String decryptedPass = PasswordEncryption.decrypt(encryptedPass, userDb);
                if (userDb.equals(loginModel.getUserName()) && decryptedPass.equals(loginModel.getPassword())) {
                    return 1; // Login successful
                }
                return 0; // Incorrect username or password
            }
            return -1; // User does not exist
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return -2; // Internal error
        }
    }

    // Add a product
    public int addProduct(ProductModel product) {
        String query = StringUtills.ADD_PRODUCT;
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, product.getProductID());
            st.setString(2, product.getProductName());
            st.setInt(3, product.getPrice());
            st.setInt(4, product.getQuantity());
            st.setString(5, product.getImageUrlFromPart());
            
            int rowsAffected = st.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
            if (rowsAffected > 0) {
                return 1; // Registration successful
            } else {
                return 0; // Registration failed
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return -1; // Internal error
        }
    }

    // Get product information
    public ArrayList<ProductModel> getProductInfo() {
        String query = StringUtills.GET_PRODUCT;
        ArrayList<ProductModel> products = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query);
             ResultSet result = st.executeQuery()) {
            while (result.next()) {
                ProductModel product = new ProductModel();
                product.setProductID(result.getInt("ProductID"));
                product.setProductName(result.getString("ProductName"));
                product.setPrice(result.getInt("Price"));
                product.setQuantity(result.getInt("Quantity"));
                product.setImageUrlFromDB(result.getString("image"));
                products.add(product);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return products;
    }

    // Delete a product
    public int deleteProductInfo(int productID) {
        String query = StringUtills.DELETE_PRODUCT;
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, productID);
            return st.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return -1; // Error occurred
        }
    }

    // Update product information
    public int updateProductInfo(int productID, String productName, int price, int quantity) {
        String query = StringUtills.UPDATE_QUERRY;
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, productName);
            st.setInt(2, price);
            st.setInt(3, quantity);
            st.setInt(4, productID);
            
            return st.executeUpdate() > 0 ? 1 : 0; // Update successful or failed
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return -1; // Internal error
        }
    }

    // Add item to cart


    // Check if user is admin
    public boolean isUserAdmin(String userName) {
        String query = "SELECT is_admin FROM customer WHERE Username = ?";
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, userName);
            ResultSet rs = st.executeQuery();
            return rs.next() && rs.getInt("is_admin") == 1;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return false; // Error occurred, default to non-admin
        }
    }

    // Get user information
    public ArrayList<UserModel> getUserInfo() {
        String query = StringUtills.GET_USER;
        ArrayList<UserModel> users = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query);
             ResultSet result = st.executeQuery()) {
            while (result.next()) {
                UserModel userDetail = new UserModel();
                userDetail.setFirstName(result.getString("FirstName"));
                userDetail.setLastName(result.getString("LastName"));
                userDetail.setUserName(result.getString("Username"));
                userDetail.setPassword(result.getString("Password"));
                userDetail.setPhoneNumber(result.getString("PhoneNumber"));
                userDetail.setAddress(result.getString("Address"));
                userDetail.setEmail(result.getString("Email"));
                users.add(userDetail);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return users;
    }
    public UserModel getUserByUsername(String username) {
        String query = "SELECT * FROM customer WHERE Username = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                UserModel user = new UserModel();
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));
                user.setUserName(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setAddress(rs.getString("Address"));
                user.setEmail(rs.getString("Email"));
                
                return user;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return null;
    }
 // Update user details
    public int updateUserDetails(UserModel user) {
        String query = "UPDATE customer SET firstName = ?, lastName = ?, address = ?, phoneNumber = ?, email = ? WHERE username = ?";
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, user.getFirstName());
            st.setString(2, user.getLastName());
            st.setString(3, user.getAddress());
            st.setString(4, user.getPhoneNumber());
            st.setString(5, user.getEmail());
            st.setString(6, user.getUserName());
            return st.executeUpdate() > 0 ? 1 : 0; // Update successful or failed
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return -1; // Internal error
        }
    }

    // Change user password
    public int changeUserPassword(String username, String newPassword) {
        String encryptedPassword = PasswordEncryption.encrypt(username, newPassword);
        String query = "UPDATE customer SET password = ? WHERE username = ?";
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, encryptedPassword);
            st.setString(2, username);
            return st.executeUpdate() > 0 ? 1 : 0; // Password change successful or failed
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return -1; // Internal error
        }
    }
    public ArrayList<ProductModel> getProductInfo(String searchTerm) {
        String query = "SELECT * FROM Product WHERE ProductName LIKE ?";
        ArrayList<ProductModel> products = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, "%" + searchTerm + "%");
            ResultSet result = st.executeQuery();
            while (result.next()) {
                ProductModel product = new ProductModel();
                product.setProductID(result.getInt("ProductID"));
                product.setProductName(result.getString("ProductName"));
                product.setPrice(result.getInt("Price"));
                product.setQuantity(result.getInt("Quantity"));
                product.setImageUrlFromDB(result.getString("image"));
                products.add(product);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return products;
    }
 // Get cart items for a customer

    public int getCustomerIDByUserName(String userName) {
        String query = "SELECT CustomerID FROM Customer WHERE Username = ?";
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, userName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("CustomerID");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return -1; // Return -1 or handle it as needed
    }
 // Add item to cart
    public boolean addToCart(CartModel cartItem) {
        String insertQuery = "INSERT INTO Cart (CustomerID, ProductID, CartQuantity, CartAmount) VALUES (?, ?, ?, ?)";
        String updateQuery = "UPDATE Product SET Quantity = Quantity - ? WHERE ProductID = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement insertSt = conn.prepareStatement(insertQuery)) {
            
            // Insert into Cart table
            insertSt.setInt(1, cartItem.getCustomerId());
            insertSt.setInt(2, cartItem.getProductId());
            insertSt.setInt(3, cartItem.getCartQuantity());
            insertSt.setInt(4, cartItem.getCartAmount());
            
            int rowsInserted = insertSt.executeUpdate();
            System.out.println("Rows inserted into Cart: " + rowsInserted); // Debug line
            
            if (rowsInserted > 0) {
                // Update product quantity in the Product table
                try (PreparedStatement updateSt = conn.prepareStatement(updateQuery)) {
                    updateSt.setInt(1, cartItem.getCartQuantity());
                    updateSt.setInt(2, cartItem.getProductId());
                    
                    int rowsUpdated = updateSt.executeUpdate();
                    System.out.println("Rows updated in Product: " + rowsUpdated); // Debug line
                    
                    return rowsUpdated > 0;
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            System.out.println("Error in addToCart: " + ex.getMessage()); // Debug line
        }
        
        return false;
    }

 // Get or create cart ID for a customer
    public int getOrCreateCartID(int customerID) {
        String selectQuery = "SELECT CartID FROM Cart WHERE CustomerID = ?";
        String insertQuery = "INSERT INTO Cart (CustomerID) VALUES (?)";
        String newCartQuery = "SELECT LAST_INSERT_ID()";
        
        try (Connection conn = getConnection();
             PreparedStatement selectSt = conn.prepareStatement(selectQuery);
             PreparedStatement insertSt = conn.prepareStatement(insertQuery);
             PreparedStatement newCartSt = conn.prepareStatement(newCartQuery)) {

            // Check for existing cart
            selectSt.setInt(1, customerID);
            ResultSet rs = selectSt.executeQuery();
            if (rs.next()) {
                return rs.getInt("CartID");
            } else {
                // No existing cart found, so create a new one
                insertSt.setInt(1, customerID);
                insertSt.executeUpdate();
                
                // Retrieve the newly created cart ID
                ResultSet newCartRs = newCartSt.executeQuery();
                if (newCartRs.next()) {
                    return newCartRs.getInt(1); // Assuming LAST_INSERT_ID() returns the new CartID
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Better to log the exception
        }
        return -1; // Handle this return value appropriately in your application
    }

    public ArrayList<CartModel> getCartItems(int customerId) {
        ArrayList<CartModel> cartItems = new ArrayList<>();
        String query = "SELECT * FROM Cart WHERE CustomerID = ?";
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, customerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartModel cartItem = new CartModel();
                cartItem.setCartId(rs.getInt("CartID"));
                cartItem.setCustomerId(rs.getInt("CustomerID"));
                cartItem.setProductId(rs.getInt("ProductID"));
                cartItem.setCartQuantity(rs.getInt("CartQuantity"));
                cartItems.add(cartItem);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return cartItems;
    }
    public boolean deleteCartItem(int cartID) {
        String query = "DELETE FROM Cart WHERE CartID = ?";
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, cartID);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    public ProductModel getProductByID(int productID) {
        String query = "SELECT * FROM Product WHERE ProductID = ?";
        ProductModel product = null;
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                // Create and populate ProductModel
                product = new ProductModel();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setPrice(rs.getInt("Price"));
                product.setQuantity(rs.getInt("Quantity"));
                
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return product;
    }
    public boolean updateCartItemQuantity(int cartID, int quantity) {
        String query = "UPDATE Cart SET CartQuantity = ? WHERE CartID = ?";
        try (Connection conn = getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, quantity);
            st.setInt(2, cartID);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    public boolean addOrder(int customerID, int productID, int totalAmount, int quantity) {
        String query = "INSERT INTO order (CustomerID, ProductID, OrderDate, TotalAmount, Quantity) VALUES (?, ?, NOW(), ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, customerID);
            pstmt.setInt(2, productID);
            pstmt.setInt(3, totalAmount); // Changed to double for totalAmount
            pstmt.setInt(4, quantity);

            int rowsAffected = pstmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected); // Log rows affected
            return rowsAffected > 0;

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    public boolean updateOrderStatus(int orderId, int isDelivered) {
        String sql = "UPDATE `order` SET isDelivered = ? WHERE OrderID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, isDelivered);
            pstmt.setInt(2, orderId);
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    public ArrayList<OrderModel> getOrders(int customerID) {
        ArrayList<OrderModel> orders = new ArrayList<>();
        String query = "SELECT * FROM `order` WHERE CustomerID = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, customerID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("OrderID");
                int productId = rs.getInt("ProductID");
                Date orderDate = rs.getDate("OrderDate");
                int totalAmount = rs.getInt("TotalAmount");
                int isDelivered = rs.getInt("isDelivered");

                OrderModel order = new OrderModel(orderId, customerID, productId, orderDate, totalAmount,isDelivered);
                orders.add(order);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return orders;
    }
    public ArrayList<OrderModel> getAllOrders() {
        ArrayList<OrderModel> orders = new ArrayList<>();
        String query = "SELECT * FROM `order`";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                OrderModel order = new OrderModel();
                order.setOrderID(rs.getInt("OrderID"));
                order.setCustomerID(rs.getInt("CustomerID"));
                order.setProductID(rs.getInt("ProductID"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setTotalAmount(rs.getInt("TotalAmount"));
                order.setIsDelivered(rs.getInt("isDelivered"));
                orders.add(order);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return orders;
    }

    


        
  }




   

