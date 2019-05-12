package beans;

public class Product {
	int customer_id;
	String item_id;
	int quantity;
	
	
	public Product(int customer_id, String item_id, int quantity) {
		super();
		this.customer_id = customer_id;
		this.item_id = item_id;
		this.quantity = quantity;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
