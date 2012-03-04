<!doctype html>
<html>
	<head>
		<meta name="layout" content="mobile">
		<title>Race Report</title>
	</head>
	<body>
		<div data-role="header" data-position="inline">
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
			<g:link controller="race" action="report" id="${id}" data-ajax="false">Update Race Stats</g:link>
			
			<g:each in="${cars}" status="i" var="car">
				<div data-role="collapsible">
					<h3><g:ordinalFormat value="${i + 1}"/>: ${car.owner}: ${car.averageTime()} seconds</h3>
					<p><b>Place: </b><g:ordinalFormat value="${i + 1}"/></p>
					<p><b>Car #: </b>${car.id}</p>
					<p><b>Car Name: </b>${car.carName}</p>
					<p><b>Car Owner: </b>${car.owner}</p>
					<p><b>Average Time: </b>${car.averageTime()} seconds</p>
				</div>
			</g:each>
			<g:if test="${showMoreSize > 0}">
			<g:link data-role="button" action="report" params="[max:max, id:id]">Show ${showMoreSize} More</g:link>
			</g:if>
		</div>
		<div data-role="footer">
		</div>
 		</div>
	</body>
</html>
