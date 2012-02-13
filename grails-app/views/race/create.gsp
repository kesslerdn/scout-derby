

<%@ page import="com.sourceallies.Race" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="mobile">
        <g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
		<div data-role="header" data-position="fixed">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link data-icon="grid" data-ajax="false" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</div>
		<div data-role="content">
			<g:if test="${flash.message}">
			<div class="message" role="alert">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${raceInstance}">
			<div class="errors" role="alert">
				<g:renderErrors bean="${raceInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form action="save" >
				
				<div data-role="fieldcontain">
					<label for="derby"><g:message code="race.derby.label" default="Derby" /></label>
					<g:select name="derby.id" from="${com.sourceallies.Derby.list()}" optionKey="id" value="${raceInstance?.derby?.id}" noSelection="['null':'']"/>
				</div>
			
				<div data-role="fieldcontain">
					<label for="name"><g:message code="race.name.label" default="Name" /></label>
					<g:textField name="name" required="required" value="${raceInstance?.name}" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="numberOfLanes"><g:message code="race.numberOfLanes.label" default="Number Of Lanes" /></label>
					<g:select name="numberOfLanes" from="${raceInstance.constraints.numberOfLanes.inList}" value="${fieldValue(bean: raceInstance, field: 'numberOfLanes')}" valueMessagePrefix="race.numberOfLanes" noSelection="['null':'']"/>
				</div>
			
				<g:submitButton name="create" data-icon="check" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</g:form>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
