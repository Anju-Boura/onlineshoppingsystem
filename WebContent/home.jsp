
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/online_shoppingsite/style.css" type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="jquery2.js"  type="text/javascript" ></script>
 <script src="jquerrycycle.js"  type="text/javascript" ></script>
<style>
ul li ul li{
	color :#fff ;
	clear :left;
	width:40px;;
	
	
}
ul li ul li{
	display : none;
	
}
ul li:hover ul li{
	display : block;
	background-color:#6495ED;
	border : 1px solid #fff;
	width : 100px;
	height :45px;
	padding-top : 10px;
	line-height :20px;
}



#slider{
	
margin : 0px  0px;
height : 450px;
width :100%;


  

}

#slider img{


	height : 450px;
	width :100%;
}
#slider_sec{
float :left;
	
background-color:blue; height :400px;width:530px;
margin-left:10px;


}

#slider_sec img{
	height :400px;
	width :530px;
}
.pic {
		height : 500px;
		width :400px;
		border : 1px solid #000;
		margin :10px;
		margin-top : 100px;
		float :left;
	}
#galery{
		height :700px;
        width :auto;
		
	}
	.workshop{  
		height :400px;
		width :300px;
		
		padding :10px 40px;
		
	}
	.pic p{
		text-align: center;
		font-family :arial;
		font-size :30px;
		font-weight :bold;
		COLOR : RED;
	}
</style>


<script>

$(document).ready(function()
		 {
		  $('#slider').cycle('fade');
		 }

		 );
$(document).ready(function()
		 {
		  $('#slider_sec').cycle('fade');
		 }

		 );
</script>

</head>
<body>

<div style="margin:110px auto; ">
<div id="slider">
<img src="images/picture2.jpg"/>
<img src="images/picture4.jpg"/>
<img src="images/picture1.jpg"/>
<img src="images/picture3.jpg"/>
</div>
</div>
<div id="galery">

<div class="pic">
<img class="workshop"  src="images/girl.jpg" />
<p>50% OFF</p>
</div>
<div class="pic">
<img class="workshop"  src="images/SAMSUNG.jpg"  />
<p>20% OFF</p>
</div>
<div class="pic">
<img class="workshop"  src="images/men.jpg"  />
<p>40% OFF</p>
</div>
</div>
<div style="height:400px; width :auto">
<img src="images/banner.png" style="width:1320px; height:300px;">
</div>
<jsp:include page="footer.jsp"/>




</body>
</html>


