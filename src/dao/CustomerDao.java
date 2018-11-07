package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import beans.Customer;
import java.util.*;
public class CustomerDao {
	
	public static int save(Customer bean,Connection conn){
		int status=0;
		try{
			
			PreparedStatement ps=conn.prepareStatement("insert into customerdetails(name,email,password,phoneno,address) values(?,?,?,?,?)");
			ps.setString(1,bean.getName());
			ps.setString(2,bean.getEmail());
			ps.setString(3,bean.getPassword());
			ps.setLong(4,bean.getNumber());
			ps.setString(5,bean.getAddress());
			status=ps.executeUpdate();
			
			
		}catch(Exception e){System.out.println(e);}
		
		return status;
	}
	public static boolean checkLogin(String emaill,String pass,Connection conn) {
		boolean status=false;
		try {
		PreparedStatement ps=conn.prepareStatement("select * from customerdetails where EMAIL=? and PASSWORD=?");
		ps.setString(1,emaill);
		ps.setString(2, pass);
		
	     ResultSet rs=ps.executeQuery();
	     if(rs.next()) {
	    	 status=true;
	     }
	     else {
	    	 status=false;
	     }
	     
	    
		
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return status;
			
		
	}
public static String getUser(String emaill,String pass,Connection conn) {
	String name=null;
	try {
	PreparedStatement ps=conn.prepareStatement("select NAME from customerdetails where EMAIL=? and PASSWORD=?");
	ps.setString(1,emaill);
	ps.setString(2, pass);
	
	
     ResultSet rs=ps.executeQuery();
     if(rs.next()) {
    	 name=rs.getString("NAME");
    	
    	 
     }
    }
	catch(Exception e) {
		System.out.println(e);
	}
	return name;
		
	
}
public static int getID(String emaill,String pass,Connection conn) {
	int idc=0;
	try {
	PreparedStatement ps=conn.prepareStatement("select id from customerdetails where EMAIL=? and PASSWORD=?");
	ps.setString(1,emaill);
	ps.setString(2, pass);
	
	
     ResultSet rs=ps.executeQuery();
     if(rs.next()) {
    	 idc=rs.getInt("id");
    	
    	 
     }
    }
	catch(Exception e) {
		System.out.println(e);
	}
	return idc;
		
	
}
public static Customer getCustomerbyid(Connection con,int id) {
	Customer c=null;
	try {
		
		PreparedStatement ps=con.prepareStatement("select * from customerdetails where id=?");
		ps.setInt(1,id);
	    ResultSet rs=ps.executeQuery();
	    if(rs.next()) {
	    	c=new Customer();
	    	c.setAddress(rs.getString("address"));
	    	c.setName(rs.getString("name"));
	    	c.setEmail(rs.getString("email"));
	    	c.setNumber(rs.getLong("phoneno"));
	    	c.setId(rs.getInt("id"));
	    	c.setPassword(rs.getString("password"));
	    	
	    	
	    	
	    }
	}
	    catch(Exception e) {
	    System.out.println(e);	
	    }
	return c;
	}
public static List<Customer> showCustomer(Connection con){
	
	List<Customer>  list=new ArrayList<Customer>();
try {
	PreparedStatement ps=con.prepareStatement("select * from customerdetails");
	ResultSet rs=ps.executeQuery();

	while(rs.next()) {
		Customer c=new Customer();
		c.setId(rs.getInt("id"));
		c.setName(rs.getString("name"));
		c.setEmail(rs.getString("email"));
		c.setNumber(rs.getLong("phoneno"));
		c.setPassword(rs.getString("password"));
		c.setAddress(rs.getString("address"));
		list.add(c);
}
	
}
catch(Exception e) {
	System.out.println(e);
	
}
return list;
	
}

public static List<String> getemails(Connection con){
	
	List<String>  list=new ArrayList<String>();
try {
	PreparedStatement ps=con.prepareStatement("select * from customerdetails");
	ResultSet rs=ps.executeQuery();

	while(rs.next()) {
		String email=rs.getString("email");
		list.add(email);
		
		
		
}
	
}
catch(Exception e) {
	System.out.println(e);
	
}
return list;
	
}

public static int editname(Connection con,int id,String value) {
	try {
	PreparedStatement ps=con.prepareStatement("update customerdetails set name=? where id=?");
	ps.setString(1,value);
	ps.setInt(2,id );
	return ps.executeUpdate();
	}
	catch(Exception e) {
		System.out.println(e);
		return 0;
	}
}

public static int editemail(Connection con,int id,String value) {
	try {
	PreparedStatement ps=con.prepareStatement("update customerdetails set email=? where id=?");
	ps.setString(1,value);
	ps.setInt(2,id );
	return ps.executeUpdate();
	}
	catch(Exception e) {
		System.out.println(e);
		return 0;
	}
}

public static int editcontact(Connection con,int id,String value) {
	try {
	PreparedStatement ps=con.prepareStatement("update customerdetails set phoneno=? where id=?");
	ps.setString(1,value);
	ps.setInt(2,id );
	return ps.executeUpdate();
	}
	catch(Exception e) {
		System.out.println(e);
		return 0;
	}
}
public static int editaddress(Connection con,int id,String value) {
	try {
	PreparedStatement ps=con.prepareStatement("update customerdetails set address=? where id=?");
	ps.setString(1,value);
	ps.setInt(2,id );
	return ps.executeUpdate();
	}
	catch(Exception e) {
		System.out.println(e);
		return 0;
	}
}
}
	
	



	

