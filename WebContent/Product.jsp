<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Puppy Mills</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/Navbar.css">
<link rel="stylesheet" type="text/css" href="css/Product.css">
<link rel="stylesheet" type="text/css" href="css/Login.css">

</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
<script src="js/login.js"></script>

<%  

String size = request.getParameter("size");
String search = request.getParameter("search");

String sizeNQ;
String searchNQ;

if(size == null){
	size = "All";
	sizeNQ = size;
	size = "\"" + size + "\"";
}else{
	sizeNQ = size;
	size = "\"" + size + "\"";
}

if(search == null){
	search = "";
	searchNQ = search;
	search = "\"" + search + "\"";
}else{
	searchNQ = search;
	search = "\"" + search + "\"";
}

%>

<%

session = request.getSession(true);

String userId = (String)session.getAttribute("userId");
String username = (String)session.getAttribute("name");
String admin = (String)session.getAttribute("admin");


String productId = request.getParameter("id");

%>


<div id="myNav" class="overlay">

  <div class="overlay-content">

    <div class="login">

      <form action="loginServlet" method="post">
      <div class="input-group input-group-lg">

        <span class="input-group-addon"></span>
        <input name="name" type="text" class="form-control" placeholder="Username">

      </div>

      <div class="input-group input-group-lg">

        <span class="input-group-addon"></span>
        <input name="password" type="password" class="form-control" placeholder="Password">

      </div>

      <button type="submit" class="btn btn-primary loginBtn">Login</button>

      </form>

      <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

    </div>

  </div>

</div>

  <div class="example3">
    <nav class="navbar navbar-static-top">
      <div class="container removeSideMargins fillWidth">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar3">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="Mainpage.jsp"><img class="logo" src="images/logo.png" alt="Dispute Bills">
          </a>
        </div>
        <div id="navbar3" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right navUL" id="navbar">
            <li class="fillWidth">
              <div class="input-group fillWidth">
                <input type="text" class="form-control fillWidth" id="searchBar" placeholder="Search 4 Puppers!">
                <span class="input-group-btn"><button class="btn btn-default search">Search</button></span>
              </div>
              </form>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Categories <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
              	<li><a href="Mainpage.jsp?size=All&search=<%= searchNQ %>">All</a></li>
              	<li class="divider"></li>
                <li><a href="Mainpage.jsp?size=Medium&search=<%= searchNQ %>">Medium</a></li>
                <li><a href="Mainpage.jsp?size=Large&search=<%= searchNQ %>">Large</a></li>
                <li class="divider"></li>
                <li><a href="Mainpage.jsp?size=Large&search=<%= searchNQ %>">Special</a></li>
              </ul>
            </li>
            <li class="dropdown account">
              <a href="#" class="dropdown-toggle userDisplay" data-toggle="dropdown" role="button" aria-expanded="false">Account <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="listOrderCustomer.jsp">List Orders</a></li>
                <li class="divider"></li>
                <li><a href="logout.jsp">Log out</a></li>
              </ul>
            </li>
            <li class="loginOption"><a href="#" onclick="openNav()">Login</a></li>
            <li><a href="showcart.jsp">Shopping Cart</a></li>
            <li><a href="NewAccount.html" class="newAccount">Create Account</a></li>
            <li><a href="adminPage.jsp" class="adminPortal" style="display: none !important;">Admin Portal</a></li>
          </ul>
        </div>
        <!--/.nav-collapse -->
      </div>
      <!--/.container-fluid -->
    </nav>
  </div>

<div class="jumbotron removeMargins">
  <div class="container removeSideMargins fillWidth">

    <div class="media">
      <div class="media-left media-top fillWidth">
          <img class="media-object picture">
      </div>

      <div class="media-body fillWidth">
        <div class="jumbotron description fillWidth ">

          <h2 class="media-heading name"></h2>
          <p class="dogDescription"></p>
          <p class="dogPrice"></p>

      </div>
      <a href="#" id="buyBtn">
        <div class="jumbotron fillWidth buyBtn">
          <h2>Add to Cart</h2>
          	<form action="addcart.jsp" id="addToCart" method="post">
 				<input type="hidden" id="productId" name="productId" value="ERROR">
 				<input type="hidden" id="breed" name="breed" value="ERROR">
 				<input type="hidden" id="price" name="price" value="ERROR">
			</form>
        </div>
      </a>

    </div>
  </div>

  </div>
</div>



<div class="commentSection">

  <div class="jumbotron comment">
    <form action="InsertReview.jsp" id="commentForm" method="get">
      <div class="form-group">
        <textarea class="form-control" form="commentForm" id="exampleTextarea" rows="4" name="review" placeholder="Comment..."></textarea>
      </div>
      <input name="accountNum" value="<%= userId %>" class="hide">
      <input name="productID" value="<%= productId %>" class="hide">
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>



</div>




<script type="text/javascript">



function setUser(){
	
	var userId = "<%= userId %>";
	var username = "<%= username %>";
	var admin = "<%= admin %>";
	
	//console.log(admin);
	//console.log(userId);
	//console.log(username);
	if(userId == "null" || username == "null"){
		notLoggedIn();
	}else{
		loggedIn(username);
	}
	
	if(admin != "null"){
		adminPortal();
	}
	
}

function adminPortal(){
	
	$(".adminPortal").attr("style", "");
}

function notLoggedIn(){
	$(".account").attr("style", "display: none !important;");
}

function loggedIn(username){
	$(".loginOption").attr("style", "display: none !important;");
	username = escapeHtml(username);
	$(".userDisplay").html(username + '<span class="caret"></span>');
	$(".newAccount").attr("style", "display: none !important;");

}


function escapeHtml(unsafe) {
    return unsafe
         .replace(/&/g, "&amp;")
         .replace(/</g, "&lt;")
         .replace(/>/g, "&gt;")
         .replace(/"/g, "&quot;")
         .replace(/'/g, "&#039;");
 }



$(document).ready(function(){

  getComments();
  getProduct();
	setUser();
  
})

function getComments(){
  $.get( "getReview.json", { "productId": "<%= productId %>"}, function(result){
	    console.log(result);
    // console.log(result);
    $.each(result, function(i, comment){
      generateListings(comment);
      // console.log(dog["image"]);
      // console.log(dog["name"]);
      // console.log(dog["desc"]);
    });
  });
}

function generateListings(comment){

  $(".commentSection").append('<div class="jumbotron comment"><div class="commentName"><h3>' + escapeHtml(comment["name"]) + '</h3></div><hr><div class="commentBody"><p>' + escapeHtml(comment["review"]) + '</p></div></div>');

}

function getProduct(){
  $.get( "getSpecificProduct.json", { "productId": "<%= productId %>"}, function(result){
    // console.log(result);
    console.log(result);
    $.each(result, function(i, listing){
      generateProduct(listing);
    });
  });
}

function generateProduct(listing){

  $(".name").html(escapeHtml(listing["pName"]));
  $(".dogDescription").html(escapeHtml(listing["desc"]));
  $(".dogPrice").html("Only $" + listing["price"] + "!");
  $(".picture").attr("src", escapeHtml(listing["image"]));
  
  $("#productId").attr("value", listing["pid"]);
  $("#breed").attr("value", escapeHtml(listing["pName"]));
  $("#price").attr("value", listing["price"]);
  
  $(".buyBtn").click(function(){
  
  	$("#addToCart").submit();
	  
  });
  
}




</script>
<!-- Use downloaded version of Bootstrap -->
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>