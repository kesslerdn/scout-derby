

<%@ page import="com.sourceallies.Vehicle" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'vehicle.label', default: 'Vehicle')}" />
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
			<g:hasErrors bean="${vehicleInstance}">
			<div class="errors" role="alert">
				<g:renderErrors bean="${vehicleInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form data-ajax="false" method="post" >
				<g:hiddenField name="id" value="${vehicleInstance?.id}" />
				<g:hiddenField name="version" value="${vehicleInstance?.version}" />
			
				<div data-role="fieldcontain">
					<label for="owner"><g:message code="vehicle.owner.label" default="Owner" /></label>
					<g:select name="owner.id" from="${ownerSelectOptions}" optionKey="id" value="${vehicleInstance?.owner?.id}" noSelection="['null': '']" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="vehicleName"><g:message code="vehicle.vehicleName.label" default="Vehicle Name" /></label>
					<g:textField name="vehicleName" required="required" value="${vehicleInstance?.vehicleName}" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="finishTimes"><g:message code="vehicle.finishTimes.label" default="Finish Times" /></label>
					
<ul>
<g:each in="${vehicleInstance?.finishTimes?}" var="f">
    <li><g:link controller="finishTime" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="finishTime" action="create" params="['vehicle.id': vehicleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'finishTime.label', default: 'FinishTime')])}</g:link>

				</div>
			
				<div data-role="fieldcontain">
					<label for="race"><g:message code="vehicle.race.label" default="Race" /></label>
					<g:select name="race.id" from="${availableRaces}" optionKey="id" value="${vehicleInstance?.race?.id}"  />
				</div>
			
				<button type='submit' id="_action_update"  name="_action_update" data-icon="check">Update</button>

			</g:form>
		</div>
		<div data-role="footer" data-theme="b">
		</div>
    </body>
</html>
