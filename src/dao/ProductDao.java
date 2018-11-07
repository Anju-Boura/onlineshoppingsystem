package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import beans.Product;

public class ProductDao {
	
	
	
		public static int save(Product p,Connection con){  
		   int status=0;  
			    try{  
			        
			        PreparedStatement ps=con.prepareStatement(  
			        "insert into product(name,category,price,quantity,description,image) values(?,?,?,?,?,?)");  
			        ps.setString(1,p.getName());  
			        ps.setString(2,p.getCategory());  
			        ps.setDouble(3,p.getPrice());  
			        ps.setInt(4,p.getQuantity());  
		            ps.setString(5,p.getDescription()); 	
		            ps.setString(6,p.getImage()); 
			        status=ps.executeUpdate();  
			    }
			    catch(Exception e){System.out.println(e);}  
			    return status;  
			}  
			public static List<Product> getAllProducts(Connection con,int number){ 
				String sql=null;
				
				List<Product> list=new ArrayList<Product>();  
				if(number==1) {
				 sql="select * from product where category='mens'";
				}
				else if(number==2) {
					sql="select * from product where category='womens'";
					
				}
				else if(number==3) {
					sql="select * from product where category='electronics'";
					
				}
				else if(number==4) {
					sql="select * from product  where category='kids'";
					
					
				}
			        try{  
				        
				        PreparedStatement ps=con.prepareStatement(sql);  
				        ResultSet rs=ps.executeQuery();  
				        while(rs.next()){  
				        	
				            Product p=new Product();  
				            p.setId(rs.getInt("id"));  
				            p.setName(rs.getString("name"));  
				            p.setQuantity(rs.getInt("quantity"));  
				            p.setCategory(rs.getString("category"));  
				            p.setPrice(rs.getDouble("price"));  
				            p.setDescription(rs.getString("description")); 
				            p.setImage(rs.getString("image"));
				            list.add(p);  
				            
				        }  
				    }catch(Exception e){System.out.println(e);}  
				    return list; 
				} 
			public static Product getProductbyid(Connection con,int id){  
					    Product p=null;  
					    try{  
						        
					        PreparedStatement ps=con.prepareStatement("select * from product where id=?");  
						        ps.setInt(1,id);  
						        ResultSet rs=ps.executeQuery();  
						        while(rs.next()){  
						             p=new Product();  
						        	
						        	    p.setId(rs.getInt("id"));  
							            p.setName(rs.getString("name"));  
							            p.setQuantity(rs.getInt("quantity"));  
							            p.setCategory(rs.getString("category"));  
							            p.setPrice(rs.getDouble("price"));  
							            p.setDescription(rs.getString("description")); 
							            p.setImage(rs.getString("image"));
					                 }  
					             }catch(Exception e){System.out.println(e);}  
					        return p;  
						}  

			
			public static List<Product> getAllProductbysearch(Connection con ,String search) {
				
				List<Product> list=new ArrayList<Product>();  
				try {
					//String sql ="select * from product where name like '%shirt%'";
				PreparedStatement ps=con.prepareStatement("select * from product where name like '%"+search + "%' or category like '%"+search +"%'");
							//PreparedStatement ps=con.prepareStatement(sql);
					ResultSet rs=ps.executeQuery();
					if(rs.next()==false){
						list=null;
						
						}
					else {
					
					do{  
			        	
			            Product p=new Product();  
			            p.setId(rs.getInt("id"));  
			            p.setName(rs.getString("name"));  
			            p.setQuantity(rs.getInt("quantity"));  
			            p.setCategory(rs.getString("category"));  
			            p.setPrice(rs.getDouble("price"));  
			            p.setDescription(rs.getString("description")); 
			            p.setImage(rs.getString("image"));
			            list.add(p);  
			            System.out.println(rs.getInt("id"));
			            
			        }
					while(rs.next());
					 
 
			    }
				}
				catch(Exception e)
				{System.out.println(e);} 
				
			    return list; 
							
				}
			public static List<Product> showProducts(Connection con){
				List<Product> list=new ArrayList<Product>();  
				try {
					
				PreparedStatement ps=con.prepareStatement("select * from product");
							
					ResultSet rs=ps.executeQuery();
					while(rs.next()){  
			        	
			            Product p=new Product();  
			            p.setId(rs.getInt("id"));  
			            p.setName(rs.getString("name"));  
			            p.setQuantity(rs.getInt("quantity"));  
			            p.setCategory(rs.getString("category"));  
			            p.setPrice(rs.getDouble("price"));  
			            p.setDescription(rs.getString("description")); 
			            p.setImage(rs.getString("image"));
			            list.add(p);  
			            System.out.println(rs.getInt("id"));
			            
			        }  
			    }
				catch(Exception e)
				{System.out.println(e);} 
				
			    return list; 
							
				}
			public static int updateproduct(Connection con, Product p) {
				int status=0;  
			    try{  
			    	//System.out.println(p); 
			        PreparedStatement ps=con.prepareStatement("update product set name=?,category=?,price=?,quantity=?,description=?,image=? where id=?");  
			        ps.setString(1,p.getName());  
			        ps.setString(2,p.getCategory());  
			        ps.setDouble(3,p.getPrice());  
			        System.out.println(p.getPrice());
			        ps.setInt(4,p.getQuantity());  
		            ps.setString(5,p.getDescription()); 	
		            ps.setString(6,p.getImage()); 
		           // System.out.println(p.getImage());
		            ps.setInt(7,p.getId()); 
		            //System.out.println(id);
			        status=ps.executeUpdate();  
			        System.out.println("status="+status);
			    }
			    catch(Exception e){System.out.println(e);
			    	e.printStackTrace();
			    }  
			    return status; 
				
			}
			public static int deleteProductbyid(Connection con,int id) {
				  int status=0;  
					    try{  
					        
					        PreparedStatement ps=con.prepareStatement("delete from product where id=?");  
					        ps.setInt(1,id);  
					        status=ps.executeUpdate();  
					    }catch(Exception e){System.out.println(e);}  
					  
					    return status;  

				
				
			
			}
			public static int updateQuantity(Connection con, int id,int quant) {
				int status=0;
				try {
					PreparedStatement ps1=con.prepareStatement("select * from product where id=?");
					ps1.setInt(1,id);
					ResultSet rs=ps1.executeQuery();
					
					rs.next();
					System.out.println(rs.getInt(1)+rs.getString(2));
					
					PreparedStatement ps=con.prepareStatement("update product set quantity=?  where id=?"); 
					
					ps.setInt(1,rs.getInt("quantity")-quant);
					ps.setInt(2, id);
					status=ps.executeUpdate();
				}
				catch(Exception e) {
					System.out.println(e);
				}
				return status;
				
				
				
			}
				
			

}



