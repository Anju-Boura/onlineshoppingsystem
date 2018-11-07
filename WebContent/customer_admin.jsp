<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.*" import="beans.Customer" import="dao.CustomerDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
    <%@include file="headeradmin.html" %>
    <%@include file="navigation_admin.html"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
body{
margin :0px;

}

</style>
</head>
<body>
<center><h3 style="color:red; margin-top:30px;">CUSTOMER DETAILS</h3></center>  
<div style="height:50px;">
	</div>
	  
	<%  
	Connection con=(Connection)application.getAttribute("con");
	List<Customer> list=CustomerDao.showCustomer(con);
	request.setAttribute("list",list);  
	%>  
	  
<center><table class="table table-striped" style="width:1200px;">  
	<thead class="thead-dark"><tr><th>Id</th><th>Name</th><th>EMAIL</th><th>MOBILE NO</th>  
	<th>ADDRESS</th></tr></thead>
	<tbody>
	 
	<c:forEach items="${list}" var="u">  
	<tr><th>${u.getId()}</th><td>${u.getName()}</td><td>${u.getEmail()}</td>  
	<td>${u.getNumber()}</td><td>${u.getAddress()}</td>
	
	
    </c:forEach>  
    </tbody>
	
	</table> 
	</center> 

</body>
</html>