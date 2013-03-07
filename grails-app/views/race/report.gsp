<!doctype html>
<html>
	<head>
		<meta name="layout" content="derbyMobile">
		<title>Race Report</title>
	</head>
	<body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1>${raceInstance}</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
					<li><g:link data-icon="check" controller="donate">Donate</g:link></li>
					<li><a data-icon="info" href="mailto:help@mobilederby.org?subject=MobileDerby.org%20Help">Contact</a></li>
				</ul>
			</div>
		</div>
		<div data-role="content" data-theme="b">
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
			</g:if>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<g:link controller="race" action="report" id="${id}" data-ajax="false">Update Race Stats</g:link>
			
			<g:each in="${vehicles}" status="i" var="vehicle">
				<div data-role="collapsible">
					<h3><g:ordinalFormat value="${i + 1}"/>: ${vehicle.owner}: <g:formatNumber number="${vehicle.averageTime()}" type="number" maxFractionDigits="3" roundingMode="HALF_UP" /> seconds</h3>
					<p><b>Place: </b><g:ordinalFormat value="${i + 1}"/></p>
					<p><b>Vehicle #: </b>${vehicle.id}</p>
					<p><b>Vehicle Name: </b>${vehicle.vehicleName}</p>
					<p><b>Vehicle Owner: </b>${vehicle.owner}</p>
					<p><b>Average Time: </b> <g:formatNumber number="${vehicle.averageTime()}" type="number" maxFractionDigits="3" roundingMode="HALF_UP" /> seconds</p>
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
