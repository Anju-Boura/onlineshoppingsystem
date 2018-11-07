package dao;
import java.sql.*;

public class OrderDao {
	
public static int saveOrder(Connection con, int oid, int cid,String productids,String quantity,double total,String  address) {
	int status=0;
	try {
	String sql="insert into orderdetails( orderid ,customerid,productids,quantity,total,address) values(?,?,?,?,?,?)";
	
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setInt(1,oid);
	ps.setInt(2,cid);
	ps.setString(3,productids);
	ps.setString(4,quantity);
	ps.setDouble(5,total);
	ps.setString(6,address);
	
	
	status =ps.executeUpdate();
	
	
	
}
	catch(Exception e) {
		
		System.out.println(e);
	}
	return status;

}


public static int saveAddress(Connection con,int id, String address) {
	int status=0;
	try {
		PreparedStatement ps=con.prepareStatement("insert into shippingAddress values(?,?)");
		ps.setInt(1,id);
		ps.setString(2,address);
		status=ps.executeUpdate();
	}
	catch(Exception e) {
		System.out.println(e);
	}
	return status;

}

}