package beans;

public class Item {
	String item_id;
	String brand;
	String item_name;
	int gender;
	String size;
	double price;
	int capacity;
	String category;
	String color;
	String pic_location;
	
	
	
	public String getPic_location() {
		return pic_location;
	}
	public void setPic_location(String pic_location) {
		this.pic_location = pic_location;
	}
	public Item() {
		super();
		
	}
	public Item(String item_id, String brand, String item_name, int gender,
			String size, double price, int capacity, String category,String color, String pic_location) {
		super();
		this.item_id = item_id;
		this.brand = brand;
		this.item_name = item_name;
		this.gender = gender;
		this.size = size;
		this.price = price;
		this.capacity = capacity;
		this.category = category;
		this.color = color;
		this.pic_location = pic_location;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	

}
