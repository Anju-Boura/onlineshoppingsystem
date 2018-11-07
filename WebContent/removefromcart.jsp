<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, beans.Cart"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% List<Cart> list=(List<Cart>)session.getAttribute("cart");
  int id=Integer.parseInt(request.getParameter("id"));
  int index=isExisting(id,list);
  if(index>=0){
	  list.remove(index);
	  response.sendRedirect("showcart.jsp");
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