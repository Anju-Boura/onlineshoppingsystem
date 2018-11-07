<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="dao.ProductDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="p" class="beans.Product"></jsp:useBean>  
<jsp:setProperty property="*" name="p"/>  
  

<% Connection conn=(Connection)application.getAttribute("con");
int id=Integer.parseInt(request.getParameter("id"));
int i=ProductDao.updateproduct(conn,p);  
if(i>0){
	response.sendRedirect("showproduct_admin.jsp");
}

%>


</body>
</html>