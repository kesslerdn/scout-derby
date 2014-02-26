
<%@ page import="com.sourceallies.Vehicle" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'vehicle.label', default: 'Vehicle')}" />
        <title>Derby Roster</title>
    </head>
	<body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1>Roster</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
				</ul>
			</div>
		</div>
		<div data-role="content" data-theme="b">
			<g:if test="${flash.message}">
			<div class="message"><p>${flash.message}</p></div>
			</g:if>
			<ul data-role="listview" data-split-icon="delete" data-filter="true">
				<g:each in="${vehicleInstanceList}" status="i" var="vehicleInstance">
					<li>
						<p>${vehicleInstance.id}: ${vehicleInstance.owner}: ${vehicleInstance.vehicleName}: ${vehicleInstance.race.name}</p>
					</li>
				</g:each>
			</ul>
		</div>
		<div data-role="footer" data-theme="b">
		</div>
    </body>
</html>
