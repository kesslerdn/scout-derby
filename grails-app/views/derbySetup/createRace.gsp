

<%@ page import="com.sourceallies.Race" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
        <title>Setup Race</title>
    </head>
    <body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1>Setup Race</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
					<li>
						<g:link data-icon="arrow-l" controller="manageDerby" data-ajax="false">Manage Derby</g:link>
					</li>
				</ul>
			</div>
		</div>
		<div data-role="content" data-theme="b">
			<g:if test="${flash.message}">
			<div class="message" role="alert">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${raceInstance}">
			<div class="errors" role="alert">
				<g:renderErrors bean="${raceInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form data-ajax="false" action="saveRace" >
				
				<div data-role="fieldcontain">
					<label for="derby"><g:message code="race.derby.label" default="Derby" /></label>
					<g:select name="derby.id" from="${derbySelectOptions}" optionKey="id" value="${raceInstance?.derby?.id}" noSelection="['':'- Select -']"/>
				</div>
			
				<div data-role="fieldcontain">
					<label for="name"><g:message code="race.name.label" default="Name" /></label>
					<g:textField name="name" value="${raceInstance?.name}" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="numberOfLanes"><g:message code="race.numberOfLanes.label" default="Number Of Lanes" /></label>
					<g:select name="numberOfLanes" from="${raceInstance.constraints.numberOfLanes.inList}" value="${fieldValue(bean: raceInstance, field: 'numberOfLanes')}" valueMessagePrefix="race.numberOfLanes" noSelection="['':'- Select -']"/>
				</div>
			
				<button type='submit' id="create"  name="create" data-icon="check">Create</button>
			</g:form>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
