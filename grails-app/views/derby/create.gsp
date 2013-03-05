

<%@ page import="com.sourceallies.Derby" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'derby.label', default: 'Derby')}" />
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
			<g:hasErrors bean="${derbyInstance}">
			<div class="errors" role="alert">
				<g:renderErrors bean="${derbyInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form data-ajax="false" action="save" >
			
				<div data-role="fieldcontain">
					<label for="city"><g:message code="derby.city.label" default="City" /></label>
					<g:textField name="city" maxlength="25" value="${derbyInstance?.city}" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="state"><g:message code="derby.state.label" default="State" /></label>
					<g:select name="state" from="${derbyInstance.constraints.state.inList}" value="${derbyInstance?.state}" valueMessagePrefix="derby.state"  noSelection="['':'- Select -']" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="locationName"><g:message code="derby.locationName.label" default="Location Name" /></label>
					<g:textField name="locationName" maxlength="25" value="${derbyInstance?.locationName}" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="date"><g:message code="derby.date.label" default="Date" /></label>
					<g:datePicker name="date" precision="day" value="${derbyInstance?.date}"  />
				</div>
			
				<div data-role="fieldcontain">
					<label for="organizationNumber"><g:message code="derby.organizationNumber.label" default="Organization Number" /></label>
					<g:textField name="organizationNumber" value="${derbyInstance?.organizationNumber}" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="type"><g:message code="derby.type.label" default="Type" /></label>
					<g:select name="type" from="${derbyInstance.constraints.type.inList}" value="${derbyInstance?.type}" valueMessagePrefix="derby.type"  noSelection="['':'- Select -']" />
				</div>
			
				<button type='submit' id="create"  name="create" data-icon="check">Create</button>
			</g:form>
		</div>
		<div data-role="footer" data-theme="b">
		</div>
    </body>
</html>
