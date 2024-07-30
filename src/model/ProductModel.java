package model;
import java.io.File;
import java.io.Serializable;

import javax.servlet.http.Part;

import Utills.StringUtills;

public class ProductModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private int productID;
	private String productName;
	private int price;
	private int quantity;
	private String imageUrlFromPart;
	
	
	/*Default Constructor*/
	public ProductModel() {
	}

	/*Constructor with parameter*/
	public ProductModel(int productID, String productName, int price, int quantity, Part imagePart) 
	{
		super();
		this.productID = productID;
		this.productName = productName;
		this.price = price;
		this.quantity = quantity;
		this.imageUrlFromPart = getImageUrl(imagePart);
		
		
	}
	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getImageUrlFromPart() {
		return imageUrlFromPart;
	}
	public void setImageUrlFromPart(Part part) {
		this.imageUrlFromPart = getImageUrl(part);
	}

	public void setImageUrlFromDB(String imageUrl) {
		this.imageUrlFromPart = imageUrl;
	}
	private String getImageUrl(Part part) {
		// Define the directory path to store uploaded user images. This path should be configured elsewhere in the application.
	    String savePath = StringUtills.IMAGE_DIR;

	    // Create a File object representing the directory to store uploaded images.
	    File fileSaveDir = new File(savePath);

	    // Initialize the variable to store the extracted image file name.
	    String imageUrlFromPart = null;

	    // Check if the directory to store uploaded images already exists.
	    if (!fileSaveDir.exists()) {
	        // If the directory doesn't exist, create it.
	    	// user mkdirs() method to create multiple or nested folder
	        fileSaveDir.mkdir();
	    }

	    // Get the Content-Disposition header from the request part. This header contains information about the uploaded file, including its filename.
	    String contentDisp = part.getHeader("content-disposition");

	    // Split the Content-Disposition header into individual parts based on semicolons.
	    String[] items = contentDisp.split(";");

	    // Iterate through each part of the Content-Disposition header.
	    for (String s : items) {
	        // Check if the current part starts with "filename" (case-insensitive trim is used).
	        if (s.trim().startsWith("filename")) {
	            // Extract the filename from the current part.
	            // The filename is assumed to be enclosed in double quotes (").
	            // This part removes everything before the equal sign (=) and the double quotes surrounding the filename.
	            imageUrlFromPart = s.substring(s.indexOf("=") + 2, s.length() - 1);
	            break; // Exit the loop after finding the filename
	        }
	    }

	    // If no filename was extracted from the Content-Disposition header, set a default filename.
	    if (imageUrlFromPart == null || imageUrlFromPart.isEmpty()) {
	        imageUrlFromPart = "product.jpg";
	    }

	    // Return the extracted or default image file name.
	    return imageUrlFromPart;
	}

}
