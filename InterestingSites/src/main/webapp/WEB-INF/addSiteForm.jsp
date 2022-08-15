<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>World of Wonder: Add Site</title>
<jsp:include page="navbar.jsp"/>
<jsp:include page="bootstrapHead.jsp"/>
<link rel='stylesheet' href='stylesheet.css'>
</head>
<body>
	<table id="actions">
		<tr>
			<td rowspan=4><img class="form_img"
				src="https://i.insider.com/5f5a895be6ff30001d4e82b3?width=1000&format=jpeg&auto=webp"
				width=70% title="Puppy taking in a view" /></td>
			<td colspan=3><h2><strong>A new site? How exciting! Let's get some details...</strong></h2></td>
		</tr>
		<tr>
			<td class="form_buffer"></td>
			
			<td align=left>
				<h4 class="head2">*All fields are required*</h4>
				<form action="newSite.do" method="POST">
					<label for="name">Name of Attraction: </label><br> 
						<input type="text" name="name" required /> <br> 
					<label for="country">Country: </label><br> 
						<input type="text" name="country" required /> <br> 
					<label for="${continent}">Continent:</label><br> 
						<select name="continent" id="dropdown" required>
							<c:forEach var="continent" items="${continents}" varStatus="loop">
								<option value="${continent}">${continent}</option>
							</c:forEach>
						</select><br>
					<label for="description">Description: </label> <br> 
						<input type="text" name="description" required> <br> 
					<label for="latitude">Latitude: </label><br> 
						<input type="number" name="latitude" step="any" required> <br> 
					<label for="longitude">Longitude: </label> <br> 
						<input type="number" name="longitude" step="any" required> <br>
					<label for="${category}">Categories:</label><br> 
						<select name="category" id="dropdown" required>
							<c:forEach var="category" items="${categories}" varStatus="loop">
								<option value="${category}">${category}</option>
							</c:forEach>
						</select><br>

					<label for="image">Image URL: </label><br> 
						<input type="text" name="image" required> <br> 
					<br><input class="action_button" type="submit" value="Add Site" />
				</form>
			</td>
			<td class="form_buffer"></td>
		</tr>
	</table>
	
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>