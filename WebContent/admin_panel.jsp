<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="headeradmin.html"%>
<%@include file="navigation_admin.html"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
body{
margin :0px;
background-color :#F5F5F5;
}
input[type=text], select,input[type=file] {
    width: 100%;
    padding: 12px 20px;
    margin: 15px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}
textarea{
    width: 100%;
    padding: 12px 20px;
    margin: 15px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    height : 90px;
    
}

#form{
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
    width : 500px;
    align : center;
    margin : auto;
    
    
}
#upper{
background-color:#F5FFFA;
backgound-color :white;
width : 900px ;
margin : auto;
margin-top :-17px;
box-shadow : 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);


}
</style>
</head>
<body>

<div id="upper"> 
<CENTER><h3>ADD PRODUCT</h3></CENTER>


<div id="form">
  <form action="Insertproduct" method="post" enctype="multipart/form-data">
  <label for="pcategory">CATEGORY</label>
    <select id="pcategory" name="category">
      <option value="mens">MENS</option>
      <option value="womens">WOMENS</option>
      <option value="electronics">ELECTRONICS AND GADGETS</option>
      <option value="kids">kids</option>
    </select>
    
    <label for="pname">PRODUCT Name</label>
    <input type="text" id="pname" name="name" placeholder="PRODUCT NAME....">

    <label for="pquantity">QUANTITY</label>
    <input type="text" id="pquantity" name="quantity" placeholder="enter the quantity of the product..">
    <label for="price">PRICE</label>
    <input type="text" id="price" name="price" placeholder="enter the price of the product..">
     <label for="image">IMAGE</label><br/>
    <input type="file" id="image" name="image"><br/>
     <label for="description">DESCRIPTION</label>
    <textarea id="description" name="description" ></textarea>
    

    
    <input type="submit" value="Submit">
  </form>
</div>
</div>

</body>
</html>