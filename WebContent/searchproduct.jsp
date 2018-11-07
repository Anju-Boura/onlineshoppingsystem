<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.*" import="beans.Product" import="dao.ProductDao"%>
    <%@include file="header.jsp" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body style="background-color :#F5FFFA;">
<div style="height :50px; width : auto; background-color :#F0F8FF; margin:100px auto;">
</div>
<% 
String search=request.getParameter("search");
if(search==""){
	response.sendRedirect("home.jsp");
}
//out.println(search);
Connection con=(Connection)application.getAttribute("con");
List<Product> list=ProductDao.getAllProductbysearch(con ,search);
if(list==null){
%>
<H1 style="color:red; font-style:italic;text-align:center;">NO SUCH RESULT FOUND</H1>	
<%
}
request.setAttribute("list",list);  
%>


<div style="margin:auto;width :1170px;background-color:#F5FFFA; overflow:auto;">
<c:forEach items="${list}" var="p">
<a href="detailproduct.jsp?id=${p.getId()}">
<div id="card" style="height :400px; width :320px; float:left; margin-right:60px; margin-top :60px; border:2px solid #ADD8E6; box-shadow : 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);">
  <img src=images/product/${p.getImage()}     alt="Avatar" height="300px" width="290px" style=" padding-left:15px; ">
  <div id="container">
    <center><h3><b>${p.getName()}</b></h4>
    <p style="color :#FF0000; font-size :20px; font-weight:900;">Rs. ${p.getPrice()}</p> </center> 
  </div>
</div>
</a>
</c:forEach>
</div>

<div style="height:200px;">
</div>




</body>
<%@include file="footer.jsp" %>
</html>