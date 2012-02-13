

<%@ page import="com.sourceallies.Car" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="mobile">
        <g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
		<div data-role="header" data-position="inline">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
			<g:hasErrors bean="${carInstance}">
			<div class="errors" role="alert">
				<g:renderErrors bean="${carInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${carInstance?.id}" />
				<g:hiddenField name="version" value="${carInstance?.version}" />
			
				<div data-role="fieldcontain">
					<label for="owner"><g:message code="car.owner.label" default="Owner" /></label>
					<g:select name="owner.id" from="${com.sourceallies.Owner.list()}" optionKey="id" value="${carInstance?.owner?.id}" noSelection="['null': '']" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="carName"><g:message code="car.carName.label" default="Car Name" /></label>
					<g:textField name="carName" required="required" value="${carInstance?.carName}" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="finishTimes"><g:message code="car.finishTimes.label" default="Finish Times" /></label>
					
<ul>
<g:each in="${carInstance?.finishTimes?}" var="f">
    <li><g:link controller="finishTime" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="finishTime" action="create" params="['car.id': carInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'finishTime.label', default: 'FinishTime')])}</g:link>

				</div>
			
				<g:actionSubmit data-icon="check" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</g:form>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
