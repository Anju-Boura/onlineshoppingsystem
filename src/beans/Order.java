package beans;
import beans.Cart;
import java.util.*;

public class Order {
	private int orderid;
	private double total;
	private int  customerid;
	private List<Cart> list;
	
	
	
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getCustomerid() {
		return customerid;
	}
	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}
	public List<Cart> getList() {
		return list;
	}
	public void setList(List<Cart> list) {
		this.list = list;
	}
	
	
	
	
	
	
	
 
}
