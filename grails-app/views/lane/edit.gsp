

<%@ page import="com.sourceallies.Lane" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'lane.label', default: 'Lane')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
					<li><g:link data-icon="grid" data-ajax="false" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</div>
		<div data-role="content" data-theme="b">
			<g:if test="${flash.message}">
			<div class="message" role="alert">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${laneInstance}">
			<div class="errors" role="alert">
				<g:renderErrors bean="${laneInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${laneInstance?.id}" />
				<g:hiddenField name="version" value="${laneInstance?.version}" />
			
				<div data-role="fieldcontain">
					<label for="number"><g:message code="lane.number.label" default="Number" /></label>
					<g:field type="number" name="number" value="${fieldValue(bean: laneInstance, field: 'number')}" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="cars"><g:message code="lane.cars.label" default="Cars" /></label>
					<g:select name="cars" from="${com.sourceallies.Car.list()}" multiple="multiple" optionKey="id" size="5" value="${laneInstance?.cars*.id}" />
				</div>
			
				<g:actionSubmit data-icon="check" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</g:form>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
