<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.*" import="beans.Product" import="dao.ProductDao"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
    <%@include file="headeradmin.html" %>
    <%@include file="navigation_admin.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

button{
height :40px;
width :80px;
background-color:orange;
color : green;
font-size:20px;
}
h1{
color :red;
}
</style>
</head>
<body>
	<center><h3 style="margin-top:20px;color:red;">PRODUCT LIST</h3></center>  
	  <div style="height:50px;">
	</div>
	<%  
	Connection con=(Connection)application.getAttribute("con");
	List<Product> list=ProductDao.showProducts(con);
	request.setAttribute("list",list);  
	%>  
	  
<center><table class="table table-striped" style="width:1200px;">  
	<thead class="thead-dark"><tr><th>Id</th><th>Name</th><th>category</th><th>price</th>  
	<th>quantity</th><th>image</th><th>description</th><th>edit</th><th>delete</th></tr> </thead>
	<tbody>
	
	 
	<c:forEach items="${list}" var="u">  
	<tr><th>${u.getId()}</th><td>${u.getName()}</td><td>${u.getCategory()}</td>  
	<td>${u.getPrice()}</td><td>${u.getQuantity()}</td><td><img src=images/product/${u.getImage()} height="100px" width="100px"></td> 
	<td>${u.getDescription()}</td>   
	<td><a href="editform.jsp?id=${u.getId()}"><button type="button">EDIT</button></a></td>  
    <td><a href="deleteproduct_admin.jsp?id=${u.getId()}"><button type="button">delete</button></a></td></tr>  
    </c:forEach>  
    </tbody>
	</table> 
	</center> 


</body>
</html>
