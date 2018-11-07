<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="dao.ProductDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<jsp:useBean id="p" class="beans.Product"></jsp:useBean>  
<jsp:setProperty property="*" name="p"/>  
  

<% Connection conn=(Connection)application.getAttribute("con");
int i=ProductDao.save(p,conn);  
if(i>0){
%>
	<script>
	alert("data is successfully inserted");
	</script>
	<%@include file="admin_panel.jsp" %>
<% 
}

else{  
%>
	<script>
	alert("data is not inserted");
	</script>
<%@include file="admin_panel.jsp" %>  
<% 
}
%>



</body>
</html>