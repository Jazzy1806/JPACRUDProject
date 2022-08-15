<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<!DOCTYPE html>
<html>
<head>

<title>HOMEPAGE</title>
<jsp:include page="navbar.jsp"/>
<jsp:include page="bootstrapHead.jsp"/>
<link rel='stylesheet' href='stylesheet.css'>
</head>
<body>
		<c:if test="${siteDeleted}"><script>alert("Site successfully deleted");</script></c:if>
		<c:if test="${siteDeleted==false}"> <script>alert("Could not delete site - try again");</script></c:if>
	
		<c:if test="${! empty categories}">
		<div class="row row-cols-1 row-cols-md-2 g-2">
		
		<div class="card mb-3" style="max-width: 540px;">
		  <div class="row g-0">
			    <div class="col-md-4">
			      <img class="landing_img" src="https://www.intrax.de/blog/wp-content/uploads/2019/06/bit-cloud-1169970-unsplash-684x1024.jpg" class="img-fluid rounded-start" alt="...">
			    </div>
			    <div class="col-md-8">
			      <div class="card-body">
			        <h5 class="card-title">Search By Category</h5>
			        <p class="card-text">
			          <form action="categorySites.do" method="get">
						<label for="${category}">Categories:</label>
						<select name="category" id="dropdown" required>
							<c:forEach var="category" items="${categories}" varStatus="loop">
								<option value="${category}">${category}</option>
							</c:forEach>
						</select>
						<input type="submit" value="See Sites" />
					</form>
			       </p>
			      </div>
			    </div>
		  </div>
		</div>


		<div class="card mb-3" style="max-width: 540px;">
		  <div class="row g-0">
			    <div class="col-md-4">
			      <img class="landing_img" src="https://www.aluxurytravelblog.com/wp-content/uploads/2020/07/Road-Trip-1.jpg" class="img-fluid rounded-start" alt="...">
			    </div>
			    <div class="col-md-8">
			      <div class="card-body">
			        <h5 class="card-title">Not seeing your favorite site? Share it with us!</h5>
			        <p class="card-text">
				<form action="newSite.do" method="get">
					<input type="submit" value="Add a New Site" />
				</form>
			       </p>
			      </div>
			    </div>
		  </div>
		</div></div>
		</c:if>

	
	<br>
	<c:choose>
		<c:when test="${! empty sitesByContinent}">
			<div class="row row-cols-1 row-cols-md-3 g-${sitesByContinentSize}">
				<c:forEach var="site" items="${sitesByContinent}">
			  <div class="col">
			    <div class="card h-100">
			      <a href="details.do?id=${site.id}"><img class="card-img-top " src="${site.image}" alt="${site.name}, ${site.country}"/></a>
			      <div class="card-body">
			        <h5 class="card-title">${site.name}</h5>
			        <p class="card-text">${site.country}</p>
			      </div>
			    </div>
			  </div>
				</c:forEach>
			</div>
		</c:when>
		<c:otherwise>
			<h1>${continentFail}</h1>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${! empty siteList}">
			<div class="row row-cols-1 row-cols-md-3 g-${siteListSize}">
				<c:forEach var="site" items="${siteList}">
			  <div class="col">
			    <div class="card h-100">
			   		 <a href="details.do?id=${site.id}"><img class="card-img-top" src="${site.image}" title="${site.name}, ${site.country}"/></a>
			      <div class="card-body">
			        <h5 class="card-title">${site.name}</h5>
			        <p class="card-text">${site.country}</p>
			      </div>
			    </div>
			  </div>
				</c:forEach>
			</div>
		</c:when>
		<c:otherwise>
			<h1>${categoryFail}</h1>
		</c:otherwise>
	</c:choose>

<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>


