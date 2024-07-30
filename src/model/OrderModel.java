package model;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;


public class OrderModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private int orderID;
    private int customerID;
    private int productID;
    private Date orderDate;
    private int totalAmount;
    private int isDelivered;
    
    
    public OrderModel() 
    {
    	
    }
    public OrderModel(int orderID, int customerID, int productID, Date orderDate,int totalAmount, int isDelivered) 
    {
    	this.orderID=orderID;
    	this.customerID=customerID;
    	this.productID=productID;
    	this.orderDate=orderDate;
    	this.totalAmount=totalAmount;
    	this.isDelivered=isDelivered;
    }
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getIsDelivered() {
		return isDelivered;
	}
	public void setIsDelivered(int isDelivered) {
		this.isDelivered = isDelivered;
	}

}
