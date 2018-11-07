<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,beans.Cart,java.sql.*,dao.OrderDao,dao.ProductDao"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
    <%@include file="header.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">  
var request;  
function sendInfo()  


{  
	
	var v1= document.getElementsByName("orderid")[0].value;
	var v2= document.getElementsByName("cid")[0].value;
	var v3= document.getElementsByName("productids")[0].value;
	var v4= document.getElementsByName("quantity")[0].value;
	var v5= document.getElementsByName("total")[0].value;
	var v6= document.getElementsByName("address")[0].value;
	
	
	
	
	if(v1=="" || v6==""){
		alert("oops!!! some value is missing");
		
	}
	else{

   
var url="ShippingAddress.jsp?id="+v1+"&address="+v6+"&cid="+v2+"&productids="+v3+"&quantity="+v4+"&total="+v5; 
alert("inserted Successfully");
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}
	
}

  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById("result").innerHTML=val;  
}  
}  
  
</script> 

</head>
<body bgcolor="#DCDCDC">
<%!
int cid;
String productids;
String quantity;
Double total;


%>
<% 
List<Cart> list=(List<Cart>)session.getAttribute("cart");
///System.out.println(list);
Connection con=(Connection)application.getAttribute("con");

//String in=(String)session.getAttribute("sum");
//System.out.println("hello     "+in);

//System.out.println(in.equals("0"));
if(session.getAttribute("sum").equals("0")){
	System.out.println("hello"+session.getAttribute("sum"));
%>
<SCRIPT>
alert("nothing is selected...select the product for buy!!!!!!!");
</SCRIPT>





<%
request.getRequestDispatcher("home.jsp").include(request,response);

}
else{
	
 total=(Double)session.getAttribute("sum");


cid=(Integer)session.getAttribute("id");
productids="";
quantity="";
for(Cart c : list)
{
	System.out.println(c.getQuantity());
	productids+=c.getP().getId()+" ,";
	quantity+=c.getQuantity()+" ,";
	
}

productids=productids.substring(0, productids.length()-1);
quantity=quantity.substring(0,quantity.length()-1);

System.out.println(productids);



Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);  
ResultSet rs=stmt.executeQuery("select * from orderdetails");
rs.last();
int orderid=rs.getInt("orderid");
orderid+=1;

//for updating the quantity of products

for(Cart c:list)
{
	int productid =c.getP().getId();
	
	int quant=c.getQuantity();
	System.out.println("hello"+productid+"   "+quant);
    int i=	ProductDao.updateQuantity(con, productid, quant);
    System.out.println(i);
	}
%>

<div  style=" color : red; background-color :#F5FFFA; width:auto; height :1px; margin:100px auto;"></div>




<DIV style="overflow:auto; margin:0px auto;text-align:center;">
<div style="background-color :white; border-radius:10px;float:left;height:400px;padding-top:20px; text-align:center;width:620px;margin-left:30px;">
<p style="color :blue; font-weight:bold;font-style:italic;">ORDER ID &nbsp;&nbsp; : &nbsp;&nbsp;<%="00B111"+orderid %></p>
<%for(Cart c:list)
{
	%>
	<p style="color :red;font-style:italic;font-size:25px;"><%=c.getP().getName()%>&nbsp;&nbsp;:&nbsp;&nbsp;Rs.<%=c.getP().getPrice()+" * "+c.getQuantity()+"    :      Rs. "+c.getP().getPrice()*c.getQuantity() %></p>
	<% 
}
%>
<p style="font-weight :bold;font-style:italic;font-size:30px;">TOTAL &nbsp;&nbsp;&nbsp;Rs.&nbsp<%=total%></p>
</div>
<div style="background-color:white;border-radius:10px; height:400px;padding-top:20px; text-align:center;width:620px;float:left;margin-left:20px; ">
<p STYLE="color :blue; font-weight:bold;font-style:italic;font-size:20px;">SHIPPING  ADDRESS</p>
<form>
 <input type="hidden" name="orderid" value=<%=orderid%>>
 <input type="hidden" name="cid" value=<%=cid%>>
 <input type="hidden" name="productids" value=<%=productids%>>
 <input type="hidden" name="quantity" value=<%=quantity%>>
 <input type="hidden" name="total" value=<%=total%>>
 
 <textarea id="address" placeholder="Enter the full address" autofocus name="address" style="height:100px; width:450px;border-radius:20px; font-size:18px; "></textarea><br/>
 <input type="submit"  value="SUBMIT" STYLE="MARGIN-TOP:30PX; height:40px; width:150px;color:blue; background-color:#F5FFFA;" onClick="sendInfo()">
 <%System.out.println("submit"); %>
   
</form>
</div>
</DIV>
<div style="text-align:center; width:auto; height:700px;;background-color:white; margin-top:50px;">
<img src="images/thanks.png" style="height:120px; width:150PX; TEXT-ALIGN:center; margin-top:40px;"><br/>
<a href="home.jsp"><input type="button" value="CONTINUE SHOPPING" style="height:50px;width:350px; margin-top:10px; color:blue; font-size:20px; font-weight:bold;background-color:red; "></a>
</div>







 
<%
}
%>
<div>
<span id="result" style="height:300px; width:200px;"></span>

 </div>

<jsp:include page="footer.jsp"/>





</body>
</html>
