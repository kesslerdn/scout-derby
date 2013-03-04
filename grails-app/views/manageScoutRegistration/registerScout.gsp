<%@ page import="com.sourceallies.Vehicle" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'vehicle.label', default: 'Vehicle')}" />
        <title>Register Scout</title>
    </head>
    <body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1>Register Scout</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
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
			<g:form data-ajax="false" action="save" >
				<g:hiddenField name="hashKey" value="${hashKey}" />
				<div class="fieldcontain">
					<label for="race"><g:message code="race.label" default="Race" /></label>
					<g:select name="raceId" from="${availableRaces}" optionKey="id" value="${raceInstance?.id}" noSelection="['':'- Select -']" />
				</div>
				<div class="fieldcontain">
					<label for="firstName"><g:message code="owner.firstName.label" default="Owner First Name" /></label>
					<g:textField name="firstName" value="${ownerInstance?.firstName}" />
				</div>
				
				<div class="fieldcontain">
					<label for="lastName"><g:message code="owner.lastName.label" default="Owner Last Name" /></label>
					<g:textField name="lastName" value="${ownerInstance?.lastName}"/>
				</div>
				
				<div class="fieldcontain">
					<label for="vehicleName"><g:message code="vehicle.vehicleName.label" default="Vehicle Name" /></label>
					<g:textField name="vehicleName" value="${vehicleInstance?.vehicleName}" />
				</div>			
				<g:submitButton name="create" data-icon="check" value="Register Scout" />
			</g:form>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
