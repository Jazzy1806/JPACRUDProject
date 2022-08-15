<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>World of Wonder: Delete Site</title>
<jsp:include page="navbar.jsp" />
<jsp:include page="bootstrapHead.jsp" />
<link rel='stylesheet' href='stylesheet.css'>
</head>
<body>
	<table id="actions">
		<tr>
			<td rowspan=4><img class="form_img" src="${site.image}"
				width=90% title="Site image" /></td>
			<td colspan=3><h2>
					<strong>Sure you want to delete this site?</strong>
				</h2></td>
		</tr>
		<tr>

			<td align=left><c:if test="${! empty site}">
					<td colspan=3 class="text-wrap col-md-offset-1" id="site_info">
						<h1>
							<strong>Site Name: ${site.name}</strong>
						</h1>
						<br>
						<ul style="list-style-type: none">
							<li><strong>Country: </strong>${site.country}</li>
							<li><strong>Continent: </strong>${site.continent}</li>
							<li class="text-wrap"><strong>Description: </strong>${site.description}</li>
							<li><strong>Category: </strong>${site.category}</li>
						</ul>
					</td>
				</c:if>
		</tr>
		<tr class="action_items .justify-content-end">
			<td class="buffer"></td>
			<td>
				<form action="editSite.do" method="get">
					<input type="hidden"
						value="${site.id}" name="id" /> <input class="action_button2"
						type="submit" value="Whoops! Let's just edit" />
				</form>
			</td>
			<td>
				<form action="delete.do" method="post">
					<input type="hidden"
						value="${site.id}" name="id" /> <input class="action_button2"
						type="submit" value="Yep, delete it!" />
				</form>
			</td>
			<td>
				<form action="newSite.do" method="get">
					<input
						class="action_button2" type="submit" value="No, add a new site" />
				</form>
			</td>
			<td class="buffer"></td>
			<td class="buffer"></td>
			<td class="buffer"></td>
		</tr>
	</table>

	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>