package beans;

public class Customer {
	int customer_id;   //automatic created when insert
	String firstname;
	String lastname;
	String username;
	String email;
	String password;
	String bio;
	String shopping_address;
	
	public String getUsername() {
		return username;
	}




	public void setUsername(String username) {
		this.username = username;
	}




	public Customer() {
		
	}
	
	
	
	
	public Customer(int customer_id, String firstname, String lastname, String username,
			String email, String password, String bio, String shopping_address) {
		super();
		this.customer_id = customer_id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.password = password;
		this.username = username;
		this.email = email;
		this.bio = bio;
		
		this.shopping_address = shopping_address;
	}

	



	public Customer(String firstname, String lastname, String username,  String email,String password,
			String bio, String shopping_address) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.password = password;
		this.username = username;
		this.email = email;
		this.bio = bio;
		this.shopping_address = shopping_address;
//		System.err.println("create a new customer");
	}




	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getShopping_address() {
		return shopping_address;
	}
	public void setShopping_address(String shopping_address) {
		this.shopping_address = shopping_address;
	}

}
