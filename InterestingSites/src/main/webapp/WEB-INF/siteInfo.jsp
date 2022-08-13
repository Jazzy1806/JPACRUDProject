<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOMEPAGE</title>
<link rel='stylesheet' href='stylesheet.css'>

</head>
<body>
	<h1>World of Wonder</h1>

	<a href="index.do"><img class="home" src="https://www.kindpng.com/picc/m/111-1110719_blue-home-page-icon-png-website-icon-home.png" align="right" width= 5% title="Home Page"/></a>

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
	
	<img src="${site.image}" title="Image of ${site.name}"/>
	<h2>Site Details:</h2>
		<ul>
			<li>Site Name: ${site.name}</li>
			<li>Country: ${site.country}</li>
			<li>Description: ${site.description}</li>
			<li>Latitude: ${site.latitude}</li>
			<li>Longitude: ${site.longitude}</li>
			<li>Category: ${site.category}</li>
		</ul>

	<form action="editSite.do" method="get">
		<input type="hidden" value="${site.id}" name="id" /> 
		<input class="button3" type="submit" value="Edit Site" />
	</form>
	<form action="confirmDelete.do" method="get">
		<input type="hidden" value="${site.id}" name="id" /> <input
			class="danger" type="submit" value="Delete Site" />
	</form>
	<form action="newSite.do" method="get">
		 <input class="button3" type="submit" value="Add Site" />
	</form>













<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>


