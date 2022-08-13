<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOMEPAGE</title>
<link rel='stylesheet' href='stylesheet.css'>

</head>
<body>
	<a href="index.do"><img class="home" src="https://www.kindpng.com/picc/m/111-1110719_blue-home-page-icon-png-website-icon-home.png" align="right" width= 5% title="Home Page"/></a>

	<h1>World of Wonder</h1>
		<c:if test="${siteDeleted}"><script>alert("Site successfully deleted");</script></c:if>
		<c:if test="${siteDeleted==false}"> <script>alert("Could not delete site - try again");</script></c:if>

	<div>
		<p>INTRODUCTION STUB----ADD MORE TO THIS</p>
	</div>
	
<!-- Category dropdown and add film option buttons table -->
	<table>
		<tr>
			<td>	
				<form action="categorySites.do" method="get">
					<label for="${category}">Categories:</label>
						<select name="category" id="dropdown" required>
							<c:forEach var="category" items="${categories}" varStatus="loop">
								<option value="${category}">${category}</option>
							</c:forEach>
						</select>
					<input type="submit" value="See Sites" />
				</form>
			</td>
			<td>
				<form action="newSite.do" method="get">
					<p><strong>Do you know of an amazing place you'd like to share?<br>
							   Add your own custom site below!</strong></p><br><br>

					<input type="submit" value="Add a New Site" />
				</form>
				
		</tr>
			
	</table>
<!--  
	<div>
	<form action="index.do" method="GET">
		Film ID: <input type="text" name="fId" /> 
		<input type="submit" value="Show Film" />
	</form><br>
	</div>

-->
	
	<!-- Alphabet to select sites by country first letter -->
	
	
	<br>
	<h2>Or Search for Sites by Country: </h2>
	<table>
		<tr>
		<td></td>
		<c:forEach var="letter" items="${alphabet}">
			<td><a href="countrySites.do?letter=${letter}">${letter}</a></td>
		</c:forEach>
		</tr>
	</table>
	
	<c:choose>
		<c:when test="${! empty sitesByCountry}">
			<ol>
				<c:forEach var="site" items="${sitesByCountry}">
					<li><a href="details.do?id=${site.id}"><img class="carousel" src="${site.image}" title="${site.name}, ${site.country}"/></a></li>
				</c:forEach>
			</ol>
		</c:when>
			
		<c:otherwise>
			<h1>${countryFail}</h1>
		</c:otherwise>
	</c:choose>
	
<br>
	<c:choose>
		<c:when test="${! empty siteList}">
			<ol>
				<c:forEach var="site" items="${siteList}">
					<li><a href="details.do?id=${site.id}"><img class="carousel" src="${site.image}" title="${site.name}, ${site.country}"/></a></li>
				</c:forEach>
			</ol>
		</c:when>
		
		<c:otherwise>
			<h1>${categoryFail}</h1>
		</c:otherwise>
	</c:choose>
	
<!-- DO I STILL WANT THIS PART???
	<c:choose>
		<c:when test="${empty filmList}">
				<h2>${listFail}</h2>
			<c:forEach var="film" items="${allFilms}">
				<a href="getFilm.do?fId=${film.id}">${film.title}</a><br>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<c:forEach var="f" items="${filmList}" varStatus="loop">
							<a href="getFilm.do?fId=${f.id}">${f.title}</a><br>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
-->



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>


