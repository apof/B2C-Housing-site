<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Listing" %>

<% String name=(String)session.getAttribute("name"); %>
<% String surname=(String)session.getAttribute("surname"); %>
<% String username=(String)session.getAttribute("username"); %>
<% String idUser=(String)session.getAttribute("idUser"); %>
<% String password=(String)session.getAttribute("password"); %>
<% String mail=(String)session.getAttribute("mail"); %>
<% String phone=(String)session.getAttribute("phone"); %>
<% Listing listing1=(Listing)session.getAttribute("listing1"); %>
<% Listing listing2=(Listing)session.getAttribute("listing2"); %>
<% Listing listing3=(Listing)session.getAttribute("listing3"); %>


<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/home.css">
</head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}

#snackbar {
    visibility: hidden;
    min-width: 250px;
    margin-left: -125px;
    background-color: #DEB887;
    color: #000000;
    text-align: center;
    border-radius: 2px;
    padding: 16px;
    position: fixed;
    z-index: 1;
    left: 50%;
    bottom: 30px;
    font-size: 17px;
}

#snackbar.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;} 
    to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;} 
    to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
}
</style>
<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-red w3-card-2 w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
     
    <a class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
    	  href = "EditProfileServlet"> Edit Profil </a>
    <a href="mailServlet" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Messages</a>
	<a href="logOutServlet" class="w3-bar-item2 w3-button w3-black w3-padding-large w3-hover-white">Log out</a>
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
    <a href="#" class="w3-bar-item w3-button w3-padding-large">Edit Profil</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">Pending or Not</a>
    <a href="" class="w3-bar-item w3-button w3-padding-large">Log out</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 4</a>
  </div>
</div>

<!-- Header -->
<header class="w3-container w3-red w3-center" style="padding:128px 16px">
  <h1 class="w3-margin w3-jumbo">Looking for Residence?</h1>
  <form action="searchPropertyServlet" method="post" id="search">
	<input type="text" name="box1" placeholder="Country"/>
	<input type="text" name="box2" placeholder="Town"/>
	<input type="text" name="box3" placeholder="Neighborhood"/><br><br>
	<input id="checkin" min="" onchange="updatedate();" name="box4" placeholder="CheckIn" class="textbox-n" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="date" required/>
	<input id="checkout" min="" name="box5" placeholder="CheckOut" class="textbox-n" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="date" required/>
	<input type="number" name="box6" placeholder="People" required/><br><br>
	<button class="button" style="vertical-align:middle" onclick="checkDates()"><span>Go</span></button>  
	</form>
</header>

	
<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1>Reccomended for You</h1>
    </div>

    <div class="w3-container">
		<div class="row">
			<div class="col-sm-6 wowload fadeInUp"><div class="rooms"><img src="${listing1.getMediumUrl()}" class="img-responsive"><div class="info"><h3>${listing1.getId()}</h3><p><b>Price/day:</b>${listing1.getPrice()},<b>Type:</b>${listing1.getRoomType()}<br><b>Bed(s):</b>${listing1.getBeds()},<b>Review(s):</b>${listing1.getNumberOfReviews()}<br><b>Star(s):</b>${listing1.getReviewScoresValue()/2}</p>
			<a href="<c:url value="RoomDetailBServlet" >
          	<c:param name="BedsNum" value="${listing1.getBeds()}"/>
          	<c:param name="BedRoomsNum" value="${listing1.getBedrooms()}"/>
          	<c:param name="BathsNum" value="${listing1.getBathrooms()}"/>
          	<c:param name="RoomType" value="${listing1.getRoomType()}"/>
          	<c:param name="SquareSpace" value="${listing1.getSquareFeet()}"/>

          	<c:param name="Am" value="${listing1.getAmenities()}"/>
          	
            <c:param name="Description" value="${listing1.getDescription()}"/>
            <c:param name="MinNights" value="${listing1.getMinimumNights()}"/>
            <c:param name="Lat" value="${listing1.getLatitude()}"/>
            <c:param name="Lon" value="${listing1.getLongitude()}"/>
            <c:param name="Street" value="${listing1.getStreet()}"/>
            <c:param name="Neighbourhood" value="${listing1.getNeighbourhood()}"/>
            <c:param name="Transit" value="${listing1.getTransit()}"/>
            <c:param name="Id" value="${listing1.getId()}"/>
          	</c:url>"
			class="button">Check Details</a></div></div></div>
		</div>
		<div class="row">
			<div class="col-sm-6 wowload fadeInUp"><div class="rooms"><img src="${listing2.getMediumUrl()}" class="img-responsive"><div class="info"><h3>${listing2.getId()}</h3><p><b>Price/day:</b>${listing2.getPrice()},<b>Type:</b>${listing2.getRoomType()}<br><b>Bed(s):</b>${listing2.getBeds()},<b>Review(s):</b>${listing2.getNumberOfReviews()}<br><b>Star(s):</b>${listing2.getReviewScoresValue()/2}</p>
			<a href="<c:url value="RoomDetailBServlet" >
          	<c:param name="BedsNum" value="${listing2.getBeds()}"/>
          	<c:param name="BedRoomsNum" value="${listing2.getBedrooms()}"/>
          	<c:param name="BathsNum" value="${listing2.getBathrooms()}"/>
          	<c:param name="RoomType" value="${listing2.getRoomType()}"/>
          	<c:param name="SquareSpace" value="${listing2.getSquareFeet()}"/>

          	<c:param name="Am" value="${listing2.getAmenities()}"/>
          	
            <c:param name="Description" value="${listing2.getDescription()}"/>
            <c:param name="MinNights" value="${listing2.getMinimumNights()}"/>
            <c:param name="Lat" value="${listing2.getLatitude()}"/>
            <c:param name="Lon" value="${listing2.getLongitude()}"/>
            <c:param name="Street" value="${listing2.getStreet()}"/>
            <c:param name="Neighbourhood" value="${listing2.getNeighbourhood()}"/>
            <c:param name="Transit" value="${listing2.getTransit()}"/>
            <c:param name="Id" value="${listing2.getId()}"/>
          	</c:url>"
			class="button">Check Details</a></div></div></div>
		</div>
		<div class="row">
			<div class="col-sm-6 wowload fadeInUp"><div class="rooms"><img src="${listing3.getMediumUrl()}" class="img-responsive"><div class="info"><h3>${listing3.getId()}</h3><p><b>Price/day:</b>${listing3.getPrice()},<b>Type:</b>${listing3.getRoomType()}<br><b>Bed(s):</b>${listing3.getBeds()},<b>Review(s):</b>${listing3.getNumberOfReviews()}<br><b>Star(s):</b>${listing3.getReviewScoresValue()/2}</p>
			<a href="<c:url value="RoomDetailBServlet" >
          	<c:param name="BedsNum" value="${listing3.getBeds()}"/>
          	<c:param name="BedRoomsNum" value="${listing3.getBedrooms()}"/>
          	<c:param name="BathsNum" value="${listing3.getBathrooms()}"/>
          	<c:param name="RoomType" value="${listing3.getRoomType()}"/>
          	<c:param name="SquareSpace" value="${listing3.getSquareFeet()}"/>

          	<c:param name="Am" value="${listing3.getAmenities()}"/>
          	
            <c:param name="Description" value="${listing3.getDescription()}"/>
            <c:param name="MinNights" value="${listing3.getMinimumNights()}"/>
            <c:param name="Lat" value="${listing3.getLatitude()}"/>
            <c:param name="Lon" value="${listing3.getLongitude()}"/>
            <c:param name="Street" value="${listing3.getStreet()}"/>
            <c:param name="Neighbourhood" value="${listing3.getNeighbourhood()}"/>
            <c:param name="Transit" value="${listing3.getTransit()}"/>
            <c:param name="Id" value="${listing3.getId()}"/>
          	</c:url>"
			class="button">Check Details</a></div></div></div>
		</div>
	</div>
  </div>
</div>


<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity">  
  <div class="w3-xlarge w3-padding-32">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
 </div>
 <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>


<script>
// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>

<script>
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
if(dd<10){
	dd='0'+dd
	} 
if(mm<10){
    mm='0'+mm
    } 
today = yyyy+'-'+mm+'-'+dd;
document.getElementById("checkin").min= today;
</script>

<script src="js/home.js"></script>

</body>
</html>
