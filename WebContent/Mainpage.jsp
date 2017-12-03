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
<link rel="stylesheet" type="text/css" href="css/Login.css">

<style type="text/css">
.slide0{
  background-image: url('images/0.jpg');
  height: 700px;
  background-repeat: no-repeat;
  background-position: 50% 30%;
  background-size: cover;
}
.slide1{
  background-image: url('images/1.jpg');
  height: 700px;
  background-repeat: no-repeat;
  background-position: 50% 30%;
  background-size: cover;
}
.slide2{
  background-image: url('images/2.jpg');
  height: 700px;
  background-repeat: no-repeat;
  background-position: 50% 30%;
  background-size: cover;
}
.slide3{
  background-image: url('images/3.png');
  height: 700px;
  background-repeat: no-repeat;
  background-position: 50% 30%;
  background-size: cover;
}
.slide4{
  background-image: url('images/4.png');
  height: 700px;
  background-repeat: no-repeat;
  background-position: 50% 30%;
  background-size: cover;
}
.carousel-caption h1{
  font-size: 5.4em;
  font-family: 'Pacifico', cursive;
  padding-bottom: .4em;
}
.carousel-caption p{
  font-size: 2em;
}
</style>
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



<div id="theCarousel" class="carousel slide" data-ride="carousel">

  <!-- defining the carousel slides -->
  <ol class="carousel-indicators">
    <li data-target="#theCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#theCarousel" data-slide-to="1"></li>
    <li data-target="#theCarousel" data-slide-to="2"></li>
    <li data-target="#theCarousel" data-slide-to="3"></li>
    <li data-target="#theCarousel" data-slide-to="4"></li>
  </ol>

  <div class="carousel-inner">
  <div class="item active"><div class="slide0"><div class="carousel-caption">
    <a href="#"><p>Slide 0 Link</p></a>
  </div></div></div>


  <div class="item"><div class="slide1"><div class="carousel-caption">
    <a href="#"><p>Slide 1 Link</p></a>
  </div></div></div>


  <div class="item"><div class="slide2"><div class="carousel-caption">
    <a href="#"><p>Slide 2 Link</p></a>
  </div></div></div>


  <div class="item"><div class="slide3"><div class="carousel-caption">
    <a href="#"><p>Slide 3 Link</p></a>
  </div></div></div>


  <div class="item"><div class="slide4"><div class="carousel-caption">
    <a href="#"><p>Slide 4 Link</p></a>
  </div></div></div></div>


<!-- backwards and forwards buttons! -->

  <a class="left carousel-control" href="#theCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#theCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>

</div>

<hr>
<div class="outerDiv" id="outerDiv">
</div>



<div class="pageNav">

  <nav>
    <ul class="pagination">

      <!-- <li class="active"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
      <li><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
      <li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li> -->

    </ul>

</div>
<script type="text/javascript">

var totalPage = 0;
var currentPage = 1;

// $(document).ready(function(){
//
//   var dogRequest = new XMLHttpRequest();
//   dogRequest.open("POST", "placeholder.json", true);
//   dogRequest.onreadystatechange = function(){
//     var doggos = JSON.parse(dogRequest.responseText);
//     console.log(doggos[0]);
//     console.log("wtf");
//   };
//   dogRequest.send();
//
// })

// var slides = [".slide0", ".slide1", ".slide2", ".slide3", ".slide4"];

<%

	session = request.getSession(true);

	String userId = (String)session.getAttribute("userId");
	String username = (String)session.getAttribute("name");
	String admin = (String)session.getAttribute("admin"); //Administrator or null


%>

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

  getDoggos();
  getPopularDoggos();
  initNavButtons();
  setUser();
  
})

function getDoggos(){
  	console.log("size: " + <%= size %>);
	$.post( "allProducts.json", { "category": <%= size %>, "breed": <%= search %>}, function(result){
   
    // console.log(result);
    // currentPage = 2;
    dogsPerPage = 10;
    // result = JSON.parse(result);
    //console.log(result.length + "length");
    totalPage = Math.ceil(result.length/dogsPerPage);
    generatePageNav(currentPage, totalPage);
    //console.log(totalPage + "fdsf");
    // console.log(totalPage);
    // console.log(doggo.length);
    var maxIndex = currentPage*dogsPerPage;
    if(maxIndex > result.length){
      maxIndex = result.length;
    }
    clearProducts();
    for(i = (currentPage - 1)*dogsPerPage; i < maxIndex; i++){
      //console.log(i);
      generateListings(result[i]);
    }
    initNavButtons();

    // $.each(result, function(i, dog){
    //   generateListings(dog);
    //   // console.log(i);
    //   // console.log(dog["image"]);
    //   // console.log(dog["name"]);
    //   // console.log(dog["desc"]);
    // });
  });
}

function getPopularDoggos(){
  $.post( "listTop5.json", function(result){
	  console.log("sss");
    console.log(result);
    // var popDoggo = JSON.parse(result);
    $.each(result, function(i, dog){
      generateSlides(i, dog);
      // console.log(dog["image"]);
      // console.log(dog["name"]);
      // console.log(dog["desc"]);
    });
  });
}

function clearProducts(){

  $("#outerDiv").html("");

}

function generateListings(dog){
  $("#outerDiv").append('<div class="dogContainer displayInline"><div class="row fillHeight"><div class="fillWidth fillHeight"><div class="thumbnail fillHeight"><img src="' + dog["image"] + '" class="dogImage" alt="..."><div class="caption"><h4>' + escapeHtml(dog["pName"]) + '</h4><p>Only $' + dog["price"] + '!</p><p><a href="Product.jsp?id=' + dog["pid"] + '" class="btn btn-primary" role="button" style="margin-bottom:4px;white-space: normal;">Adopt Me!</a></p></div></div></div></div></div>');
  // console.log(dog["image"]);
}

function generateSlides(i, dog){

  $(".slide"+i).attr("style", "background-image: url('"+dog["image"]+"');");
  $(".slide"+i+" .carousel-caption a p").html("Popular: " + escapeHtml(dog["pName"]));
  $(".slide"+i+" .carousel-caption a").attr("href", "Product.jsp?id=" + dog["pid"]);

  // console.log(dog["image"]);
}

function generatePageNav(currentPageNav, totalPageNav){

  $(".pageNav .pagination").html("");

  if(currentPageNav != 1){
    $(".pageNav .pagination").append('<li><a href="#" class="prevPage" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>');
  }

  //console.log(totalPageNav + "totalPageNav");
  for(i = 1; i <= totalPageNav; i++){
    if(i == currentPageNav){
      $(".pageNav .pagination").append('<li class="active"><a href="#">' + i + '</a></li>');
    }else{
      $(".pageNav .pagination").append('<li><a class="numberedPage" href="#">' + i + '</a></li>');
    }
  }

  if(currentPageNav != totalPageNav){
    $(".pageNav .pagination").append('<li><a href="#" class="nextPage"aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>');
  }

}

function initNavButtons(){

  $(".nextPage").click(function(){
    currentPage++;
    getDoggos();
  });

  $(".prevPage").click(function(){
    currentPage--;
    getDoggos();
  });

  $(".numberedPage").click(function(){
    currentPage = $(this).html();
    getDoggos();
  });

  $(".search").click(function(){
	  var search = $("#searchBar").val()
	  window.location.replace("Mainpage.jsp?size=<%= sizeNQ %>&search=" + search);
  });

}

// $(document).ready(function(){
//
//   $.getJSON("placeholder.json", function(result){
//     $.each(result, function(i, field){
//       console.log(field);
//     });
//   });
// })

</script>
<!-- Use downloaded version of Bootstrap -->
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
