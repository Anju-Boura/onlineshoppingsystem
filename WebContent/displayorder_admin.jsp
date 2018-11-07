<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
     <%@include file="headeradmin.html" %>
    <%@include file="navigation_admin.html"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>

</style>
</head>
<body>

<center><h3 style="margin-top:30px; color:red;">ORDER DETAILS</h3></center>  
	  
	<%  
	Connection con=(Connection)application.getAttribute("con");
	PreparedStatement ps=con.prepareStatement("select * from orderdetails");
	ResultSet rs=ps.executeQuery();
	
	
	//request.setAttribute("list",rs); 
	
	%>  
	<div style="height:50px;">
	</div>
	  
<center><table class="table table-striped" style="width:1200px;">  
	<thead class="thead-dark"> <tr><th>order Id</th><th>customer id</th><th>product ids</th> 
	<th>quantity</th><th>total</th><th>Shipping address</th></tr></thead> 
	<tbody><%while(rs.next())
		{
		%>
	
	 
	
	<tr><th><%=rs.getInt("orderid")%></th><td><%=rs.getInt("customerid")%></td><td><%=rs.getString("productids")%></td> <td><%=rs.getString("quantity")%></td> 
	<td><%=rs.getDouble("total")%></td><td><%=rs.getString("address")%></td>
	
	
	<%
	}
	 
	%>
	</tbody>
	
	
     
	</table> 
	</center> 

</body>
</html>