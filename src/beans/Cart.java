package beans;

public class Cart {
	Product p;
	int Quantity;
	public Cart(Product p, int quantity) {
		super();
		this.p = p;
		Quantity = quantity;
	}
	public Product getP() {
		return p;
	}
	public void setP(Product p) {
		this.p = p;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	
	

}
