<!doctype html>
<html>
	<head>
		<meta name="layout" content="mobile">
		<title>Race Report</title>
	</head>
	<body>
		<div data-role="header" data-position="fixed">
			<h1>Race Report - ${raceInstance}</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				</ul>
			</div>
		</div>
		<div data-role="content">
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
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
		<div data-role="footer">
		</div>
 		</div>
	</body>
</html>
