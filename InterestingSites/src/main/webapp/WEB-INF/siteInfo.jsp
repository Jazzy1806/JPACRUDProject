<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>HOMEPAGE</title>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDG5LaUdpH_g-BO3DaAAJwEnqL361Z8-PU&callback=loadMap"></script>

<jsp:include page="navbar.jsp"/>
<jsp:include page="bootstrapHead.jsp"/>
<link rel='stylesheet' href='stylesheet.css'>

<script type="text/javascript">
  function loadMap() {
	var latitude = parseFloat(document.getElementById("latitude").innerHTML);
	var longitude = parseFloat(document.getElementById("longitude").innerHTML);
	  
    var latlng = new google.maps.LatLng(latitude, longitude);
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

</head>
<body onload="loadMap()">
	<c:choose>
		<c:when test="${siteAdded == true}">
			<h2>${addMessage}</h2>
		</c:when>
		<c:otherwise>
			<h2>${addFail}</h2>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${siteUpdated == true}">
			<h2>${editMessage}</h2>
		</c:when>
		<c:otherwise>
			<h2>${editFail}</h2>
		</c:otherwise>
	</c:choose>
	<div class="table-responsive">
		<table>
			<tbody>
				<tr>
					<td  rowspan=3><img class="detail_img" src="${site.image}" title="Image of ${site.name}"/></td>
					<td class="buffer"></td>
					<td colspan=3 class="text-wrap col-md-offset-1" id="site_info">
						<h1><strong>Site Name: ${site.name}</strong></h1><br>
						<ul style="list-style-type: none">
							<li><strong>Country: </strong>${site.country}</li>
							<li class="text-wrap"><strong>Description: </strong>${site.description}</li>
							<li><strong>Category: </strong>${site.category}</li>
							<li>Latitude: <h4 id="latitude">${site.latitude}</h4></li>
							<li>Longitude: <h4 id="longitude">${site.longitude}</h4></li>
						</ul>
					</td>
				</tr>
				<tr class="action_items .justify-content-end">
					<td class="buffer"></td>
					<td>
						<form action="editSite.do" method="get">
							<input type="hidden" value="${site.id}" name="id" /> 
							<input class="action_button" type="submit" value="Edit Site" />
						</form>
					</td>
					<td>	
						<form action="confirmDelete.do" method="get">
							<input type="hidden" value="${site.id}" name="id" /> 
							<input class="action_button" type="submit" value="Delete Site" />
						</form>
					</td>
					<td>
						<form action="newSite.do" method="get">
							 <input class="action_button" type="submit" value="Add Site" />
						</form>
					</td>
					<td class="buffer"></td>
					<td class="buffer"></td>
					<td class="buffer"></td>
		       </tr>
		       <tr>
		       	  <td></td>
	      		  <td colspan=3>
					<div id="map_container" ></div>
				  </td>
			   </tr>
			</tbody>
		</table>
	</div>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>