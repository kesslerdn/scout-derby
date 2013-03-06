
<%@ page import="com.sourceallies.Race" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
					<li><g:link data-icon="grid" data-ajax="false" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</div>
		<div data-role="content" data-theme="b">
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
			</g:if>
			<dl>
			
				<dt><g:message code="race.id.label" default="Id" /></dt>
				
					<dd><g:fieldValue bean="${raceInstance}" field="id"/></dd>
				
			
				<dt><g:message code="race.name.label" default="Name" /></dt>
				
					<dd><g:fieldValue bean="${raceInstance}" field="name"/></dd>
				
			
				<dt><g:message code="race.numberOfLanes.label" default="Number Of Lanes" /></dt>
				
					<dd><g:fieldValue bean="${raceInstance}" field="numberOfLanes"/></dd>
				
			
				<dt><g:message code="race.vehicles.label" default="Vehicles" /></dt>
				
					<g:each in="${raceInstance.vehicles}" var="c">
						<dd><g:link controller="vehicle" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></dd>
					</g:each>
				
			
				<dt><g:message code="race.currentHeat.label" default="Current Heat" /></dt>
				
					<dd><g:fieldValue bean="${raceInstance}" field="currentHeat"/></dd>
				
			
				<dt><g:message code="race.dateCreated.label" default="Date Created" /></dt>
				
					<dd><g:formatDate date="${raceInstance?.dateCreated}" /></dd>
				
			
				<dt><g:message code="race.derby.label" default="Derby" /></dt>
				
					<dd><g:link controller="derby" action="show" id="${raceInstance?.derby?.id}">${raceInstance?.derby?.encodeAsHTML()}</g:link></dd>
				
			
				<dt><g:message code="race.lanes.label" default="Lanes" /></dt>
				
					<g:each in="${raceInstance.lanes}" var="l">
						<dd><g:link controller="lane" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></dd>
					</g:each>
				
			
				<dt><g:message code="race.lastUpdated.label" default="Last Updated" /></dt>
				
					<dd><g:formatDate date="${raceInstance?.lastUpdated}" /></dd>
				
			
			</dl>
			<g:form>
				<g:hiddenField name="id" value="${raceInstance?.id}" />
				<button type="submit" name="_action_delete" data-icon="delete">Delete</button>
			</g:form>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
