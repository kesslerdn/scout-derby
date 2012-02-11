<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Race Report</title>
	</head>
	<body>
		<a href="#create-car" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-car" class="content scaffold-create" role="main">
			<h1>Race Report - ${raceInstance}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<g:link controller="race" action="report" id="${id}">Update Race Stats</g:link>
			<table>
				<thead>
					<tr>	
						<th>Place</th>		
						<th>Car #</th>					
						<th>Car Name</th>					
						<th>Car Owner</th>					
						<th>Average Time</th>									
					</tr>
				</thead>
				<tbody>
				<g:each in="${cars}" status="i" var="car">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:ordinalFormat value="${start + i + 1}"/></td>															
						<td>${car.id}</td>								
						<td>${car.carName}</td>								
						<td>${car.owner}</td>	
						<td>${car.averageTime()} seconds</td>	
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carInstanceTotal}" id="${id}"/>
			</div>
		</div>
	</body>
</html>
