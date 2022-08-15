<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Google Map Hello World Example</title>
<style type="text/css">
div#map_container {
	width: 100%;
	height: 350px;
}
</style>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDG5LaUdpH_g-BO3DaAAJwEnqL361Z8-PU"></script>

<script type="text/javascript">
  function loadMap() {
    var latlng = new google.maps.LatLng(4.3695030, 101.1224120);
    var myOptions = {
      zoom: 4,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_container"),myOptions);
	
    var marker = new google.maps.Marker({
      position: latlng, 
      map: map, 
      title:"my hometown, Malim Nawar!"
    }); 
  
  }
</script>
<link rel='stylesheet' href='stylesheet.css'>
</head>

<body onload="loadMap()">
	<div id="map_container"></div>
</body>

</html>

