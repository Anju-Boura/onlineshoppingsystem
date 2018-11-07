<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="headeradmin.html" %>
    <%@include file="navigation_admin.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <h2 style="text-align:center; color:red;">EMAIL</h2>
  <form class="form-horizontal" action="EmailServlet" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-10">
        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
      </div>
    </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="sub">SUBJECT:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pwd" placeholder="Enter SUBJECT" name="sub">
      </div>
      </div>
      <div class="form-group">
    <label class="control-label col-sm-2" for="body">BODY:</label>
      <div class="col-sm-10">    
      <textarea  class="form-control" id="body" name="body" style="height:100px;"></textarea>
       </div>
       </div>
       
          <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">SEND</button>
      </div>
    </div>
  </form>
</div>




</body>
</html>