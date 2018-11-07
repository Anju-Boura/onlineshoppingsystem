<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.*" import="dao.ProductDao" import="beans.Product" import="beans.Cart"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int i=Integer.parseInt(request.getParameter("id"));
int quantity=Integer.parseInt(request.getParameter("quantity"));

Connection con=(Connection)application.getAttribute("con");
Product p=ProductDao.getProductbyid(con ,i);
String user=(String)session.getAttribute("activeuser");
if(user==null){
%>
	<script>
	alert("you are not logged in...login first");
	</script>
<%@include file="registration.html"%>
<%
}
else{
	out.println("welcome="+user);
	
	if(session.getAttribute("cart")==null){
		List<Cart> list= new ArrayList<Cart>();
		list.add(new Cart(p,quantity));
		session.setAttribute("cart", list);
		response.sendRedirect("showcart.jsp");
	}
	else{
		List<Cart> list=(List<Cart>)session.getAttribute("cart");
		int index=isExisting(i,list);
		if(index!=-1){
			int quan=list.get(index).getQuantity()+quantity
					
					
					
					;
			list.get(index).setQuantity(quan);
			response.sendRedirect("showcart.jsp");
			
			
		}
		else{
		
		list.add(new Cart(p,quantity));
		session.setAttribute("cart", list);
		response.sendRedirect("showcart.jsp");
		}
		
		
	}
	
	
	
	
}
%>
<%!

int isExisting(int id,List<Cart> list){
	
	for(int i=0;i<list.size();i++){
		if(list.get(i).getP().getId()==id){
		 return i;
		 
		}
		
	} 
	return -1;
	
	
	
}
%>





</body>
</html>