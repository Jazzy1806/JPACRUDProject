<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title class="head">World of Wonder: Edit Site</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link rel='stylesheet' href='stylesheet.css'>
</head>
<body>
	<h1>World of Wonder</h1>

	<a href="index.do"><img class="home" src="https://www.kindpng.com/picc/m/111-1110719_blue-home-page-icon-png-website-icon-home.png"  title="Home Page"/></a>

<br>
 
	<table id="actions">
		<tr>
			<th colspan=3><h2>Did we get something wrong? Help us out...</h2></th>
		</tr>
		<tr>
			<td colspan=3><img
				src="https://c4.wallpaperflare.com/wallpaper/192/557/190/old-map-map-compass-ropes-wallpaper-preview.jpg"
				width=70% title="Image of old sailor map" /></td>
			<td align=left>
				<h2 class="head2">All fields must have a value:</h2>
	 <div >
	  
	    <form class="forms" action="editSite.do" method="POST">
	  		 <label for="name">Name of Attraction: </label><br> 
				<input type="text" name="name" value="${site.name}" required /> <br> 
			<label for="country">Country: </label><br> 
				<input type="text" name="country" value="${site.country}" required /> <br> 
			<label for="description">Description: </label> <br> 
				<input type="text" name="description" value="${site.description}" required> <br> 
			<label for="latitude">Latitude: </label><br> 
				<input type="text" name="latitude" value="${site.latitude}" required> <br> 
			<label for="longitude">Longitude: </label> <br> 
				<input type="text" name="longitude" value="${site.longitude}" required> <br>
			<label for="${category}">Categories:</label><br> 
				<select name="category" id="dropdown" required>
					<c:forEach var="category" items="${categories}" varStatus="loop">
						<option value="${category}">${category}</option>
					</c:forEach>
				</select><br>
			<label for="image">Image URL: </label><br> 
				<input type="text" name="image" value="${site.image}" required> <br> 
		
				<input type="hidden" value="${site.id}" name="id"/>
			<br><input type="submit" value="Edit Site" />
					
		</form>
	 </div>
	    <br>
	    <br>
	      </tr>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  </body>
</body>
</html>