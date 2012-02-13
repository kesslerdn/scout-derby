

<%@ page import="com.sourceallies.Owner" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="mobile">
        <g:set var="entityName" value="${message(code: 'owner.label', default: 'Owner')}" />
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
			<g:hasErrors bean="${ownerInstance}">
			<div class="errors" role="alert">
				<g:renderErrors bean="${ownerInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${ownerInstance?.id}" />
				<g:hiddenField name="version" value="${ownerInstance?.version}" />
			
				<div data-role="fieldcontain">
					<label for="firstName"><g:message code="owner.firstName.label" default="First Name" /></label>
					<g:textField name="firstName" required="required" value="${ownerInstance?.firstName}" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="car"><g:message code="owner.car.label" default="Car" /></label>
					<g:select name="car.id" from="${com.sourceallies.Car.list()}" optionKey="id" value="${ownerInstance?.car?.id}"  />
				</div>
			
				<div data-role="fieldcontain">
					<label for="lastName"><g:message code="owner.lastName.label" default="Last Name" /></label>
					<g:textField name="lastName" value="${ownerInstance?.lastName}" />
				</div>
			
				<g:actionSubmit data-icon="check" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</g:form>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
