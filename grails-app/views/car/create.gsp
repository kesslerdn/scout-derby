<%@ page import="com.sourceallies.Car" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
			<g:hasErrors bean="${carInstance}">
			<div class="errors" role="alert">
				<g:renderErrors bean="${carInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form action="save" >
				<div class="fieldcontain">
					<label for="race"><g:message code="race.label" default="Race" /></label>
					<g:select name="raceId" from="${availableRaces}" optionKey="id" value="${raceInstance?.id}" noSelection="['null':'']" required="true"/>
				</div>
				<div class="fieldcontain">
					<label for="firstName"><g:message code="owner.firstName.label" default="Owner First Name" /></label>
					<g:textField name="firstName" value="${ownerInstance?.firstName}" required="true"/>
				</div>
				
				<div class="fieldcontain">
					<label for="lastName"><g:message code="owner.lastName.label" default="Owner Last Name" /></label>
					<g:textField name="lastName" value="${ownerInstance?.lastName}"/>
				</div>
				
				<div class="fieldcontain">
					<label for="carName"><g:message code="car.carName.label" default="Car Name" /></label>
					<g:textField name="carName" value="${carInstance?.carName}" required="true"/>
				</div>			
				<g:submitButton name="create" data-icon="check" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</g:form>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
