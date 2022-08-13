<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>World of Wonder: Add Site</title>
<link rel='stylesheet' href='stylesheet.css'>
</head>
<body>
	<h1>World of Wonder</h1>

	<a href="index.do"><img class="home" src="https://www.kindpng.com/picc/m/111-1110719_blue-home-page-icon-png-website-icon-home.png" title="Home Page" /></a>
	<br>
	<table id="actions">
		<tr>
			<th colspan=3><h2>A new site? How exciting! Let's get some details...</h2></th>
		</tr>
		<tr>
			<td colspan=3><img
				src="https://c4.wallpaperflare.com/wallpaper/192/557/190/old-map-map-compass-ropes-wallpaper-preview.jpg"
				width=70% title="Image of old sailor map" /></td>
			<td align=left>
				<h2 class="head2">All fields are required:</h2>
				<form action="newSite.do" method="POST">
					<label for="name">Name of Attraction: </label><br> 
						<input type="text" name="name" required /> <br> 
					<label for="country">Country: </label><br> 
						<input type="text" name="country" required /> <br> 
					<label for="description">Description: </label> <br> 
						<input type="text" name="description" required> <br> 
					<label for="latitude">Latitude: </label><br> 
						<input type="text" name="latitude" required> <br> 
					<label for="longitude">Longitude: </label> <br> 
						<input type="text" name="longitude" required> <br>
					<label for="${category}">Categories:</label><br> 
						<select name="category" id="dropdown" required>
							<c:forEach var="category" items="${categories}" varStatus="loop">
								<option value="${category}">${category}</option>
							</c:forEach>
						</select><br>

					<label for="image">Image URL: </label><br> 
						<input type="text" name="image" required> <br> 
					<br><input type="submit" value="Add Site" />
				</form>
			</td>
		</tr>
	</table>
</body>
</body>
</html>