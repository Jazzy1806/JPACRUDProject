<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>World of Wonder: Edit Site</title>
<jsp:include page="navbar.jsp"/>
<jsp:include page="bootstrapHead.jsp"/>
<link rel='stylesheet' href='stylesheet.css'>
</head>
<body>
	<table id="actions">
		<tr>
			<td rowspan=4><img class="form_img"
				src="https://media.istockphoto.com/photos/giving-a-hand-picture-id1307265321?k=20&m=1307265321&s=170667a&w=0&h=uhGY_OzY7nHWYCEqYCrnYJEw1rp7R4y2PO-rN4USI6I="
				width=70% title="Image of old sailor map" /></td>
			<td colspan=3><h2><strong>Did we get something wrong? Help us out...</strong></h2></td>
		</tr>
		<tr>
			<td class="form_buffer"></td>
		
			<td align=left>
				<h4 class="head2">*All fields must have a value*</h4>
			    <form class="forms" action="editSite.do" method="POST">
			  		 <label for="name">Name of Attraction: </label><br> 
						<input type="text" name="name" value="${site.name}" required /> <br> 
					<label for="country">Country: </label><br> 
						<input type="text" name="country" value="${site.country}" required /> <br> 
					<label for="${continent}">Continent:</label><br> 
						<select name="continent" id="dropdown" required>
							<c:forEach var="continent" items="${continents}" varStatus="loop">
								<option value="${continent}">${continent}</option>
							</c:forEach>
						</select><br>
					<label for="description">Description: </label> <br> 
						<input type="text" name="description" value="${site.description}" required> <br> 
					<label for="latitude">Latitude: </label><br> 
						<input type="number" name="latitude" value="${site.latitude}" step="any" required> <br> 
					<label for="longitude">Longitude: </label> <br> 
						<input type="number" name="longitude" value="${site.longitude}" step="any" required> <br>
					<label for="${category}">Categories:</label><br> 
						<select name="category" id="dropdown" required>
							<c:forEach var="category" items="${categories}" varStatus="loop">
								<option value="${category}">${category}</option>
							</c:forEach>
						</select><br>
					<label for="image">Image URL: </label><br> 
						<input type="text" name="image" value="${site.image}" required> <br> 
				
						<input type="hidden" value="${site.id}" name="id"/>
					<br><input  class="action_button" type="submit" value="Edit Site" />
				</form>
			</td>
			<td class="form_buffer"></td>
	      </tr>
    </table>

<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>