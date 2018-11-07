<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,beans.Customer,dao.CustomerDao"%>
    <%@include file="header.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#heading{
margin-top:112px;
width:auto;
height : 50px;
color : red;
background-color : grey;

}






</style>
<title>Insert title here</title>


</head>
<body>
<%
Customer c=null;
if(session.getAttribute("id")==null){
	
	response.sendRedirect("home.jsp");
	
}
else{


int id=(Integer)session.getAttribute("id");
System.out.println(id);
Connection con=(Connection)application.getAttribute("con");
 c=CustomerDao.getCustomerbyid(con,id);
 System.out.println(c.getName());




%>

<div id="heading"> 
<CENTER><h1>your profile</h1></CENTER>
</div>
<DIV style="text-align:center;">
<img src="images/contact.jpg" height="100px" width="100px">

<div class="container jumbotron">
  
  <form class="form-horizontal">
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">NAME:</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" id="name"  name="name" value="<%=c.getName()%>">
      </div>
      <div class="col-sm-1">
      <a href='' onclick="this.href='EditProfile?id=<%=id%>&name=name&value='+document.getElementById('name').value"><button type="button" class="btn btn-success">EDIT</button></a>
      
      
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">EMAIL ID:</label>
      <div class="col-sm-9">          
        <input type="email" class="form-control" id="email" name="email" value= "<%=c.getEmail()%>" >
      </div>
      <div class="col-sm-1">
       <a href='' onclick="this.href='EditProfile?id=<%=id%>&name=email&value='+document.getElementById('email').value"><button type="button" class="btn btn-success">EDIT</button></a>
      
      </div>
    </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="contact">CONTACT NO.:</label>
      <div class="col-sm-9">          
        <input type="text" class="form-control" id="contact" name="contact" value= "<%=c.getNumber()%>" >
      </div>
      <div class="col-sm-1">
      <a href='' onclick="this.href='EditProfile?id=<%=id%>&name=contact&value='+document.getElementById('contact').value"><button type="button" class="btn btn-success">EDIT</button></a>
      
      </div>
      </div>
      <div class="form-group">
    <label class="control-label col-sm-2" for="address">ADDRESS:</label>
      <div class="col-sm-9">    
      <textarea  class="form-control" id="address" name="address" style="height:100px;"><%=c.getAddress()%></textarea>
       </div>
       <div class="col-sm-1">
      <a href='' onclick="this.href='EditProfile?id=<%=id%>&name=address&value='+document.getElementById('address').value"><button type="button" class="btn btn-success">EDIT</button></a>
      
      </div>
       
       
       </div>
       
       
  </form>
</div>








<%
}
%>    
   
  </form>
</div>
<jsp:include page="footer.jsp"/>






</body>
</html>