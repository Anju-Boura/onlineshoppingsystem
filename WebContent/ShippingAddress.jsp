<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,dao.OrderDao,dao.CustomerDao,beans.Customer,service.Message"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

Connection con =(Connection)application.getAttribute("con");
int oid=Integer.parseInt(request.getParameter("id"));
int cid=Integer.parseInt(request.getParameter("cid"));
String address=request.getParameter("address");
String productids=request.getParameter("productids");
System.out.println(productids);
String quantity=request.getParameter("quantity");
double total=Double.parseDouble(request.getParameter("total"));
int status=OrderDao.saveOrder(con,oid,cid,productids,quantity,total,address);
Customer c=CustomerDao.getCustomerbyid(con,cid);

if(status>0){
	String msg="Dear "+c.getName()+",Your order has been placed,it will be delivered within one week.Thankyou for shopping :) .";
	String s=Message.sendSms(msg,String.valueOf(c.getNumber()));
	System.out.println(s);		
			
			

}

%>






</body>
</html>