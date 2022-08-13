<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>World of Wonder: Delete Site</title>
<link rel='stylesheet' href='stylesheet.css'>
</head>
<body>
	<h1>World of Wonder</h1>

	<a href="index.do"><img class="home"
		src="https://www.kindpng.com/picc/m/111-1110719_blue-home-page-icon-png-website-icon-home.png"
		title="Home Page" /></a>

	<br>
	<h1>Are you sure you want to delete this site? </h1>

		<c:if test="${! empty site}">
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
		</c:if>
	<form action="editSite.do" method="get">
		<label>Whoops! I just want to edit this site: </label>
		<input type="hidden" value="${site.id}" name="id" /> 
		<input class="button3" type="submit" value="Edit Site" />
	</form>
	<form action="delete.do" method="post">
		<label>Yep, I'm sure - delete it! </label>
		<input type="hidden" value="${site.id}" name="id" /> <input
			class="danger" type="submit" value="Delete Site" />
	</form>
	<form action="newSite.do" method="get">
		<label>Actually, I want to add a new site instead: </label>
		 <input class="button3" type="submit" value="Add Site" />
	</form>
</body>
</body>
</html>