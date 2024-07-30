package model;
import java.io.Serializable;

public class CartModel implements Serializable{
	private static final long serialVersionUID = 1L;
	private int customerId;
	private int cartId;
	private int productId; 
	private int cartAmount;
	private int cartQuantity;
	
	 /**
     * Default constructor.
     */
    public CartModel() {
        
    }
    
    public CartModel(int customerId, int cartId, int productId, int cartAmount, int cartQuantity) {
        super();
        this.customerId = customerId;
        this.cartId = cartId;
        this.productId = productId;
        this.cartAmount = cartAmount;
        this.cartQuantity = cartQuantity;
    }
    
    public int getCustomerId() {
        return customerId;
    }
    
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    
    public int getCartId() {
        return cartId;
    }
    
    public void setCartId(int cartId) {
        this.cartId = cartId;
    }
    
    public int getProductId() {
        return productId;
    }
    
    public void setProductId(int productId) {
        this.productId = productId;
    }
    
    public int getCartAmount() {
        return cartAmount;
    }
    
    public void setCartAmount(int cartAmount) {
        this.cartAmount = cartAmount;
    }
    
    public int getCartQuantity() {
        return cartQuantity;
    }
    
    public void setCartQuantity(int cartQuantity) {
        this.cartQuantity = cartQuantity;
    }


	

}
