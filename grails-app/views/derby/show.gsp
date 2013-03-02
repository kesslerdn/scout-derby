
<%@ page import="com.sourceallies.Derby" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'derby.label', default: 'Derby')}" />
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
			
				<dt><g:message code="derby.id.label" default="Id" /></dt>
				
					<dd><g:fieldValue bean="${derbyInstance}" field="id"/></dd>
				
			
				<dt><g:message code="derby.city.label" default="City" /></dt>
				
					<dd><g:fieldValue bean="${derbyInstance}" field="city"/></dd>
				
			
				<dt><g:message code="derby.state.label" default="State" /></dt>
				
					<dd><g:fieldValue bean="${derbyInstance}" field="state"/></dd>
				
			
				<dt><g:message code="derby.locationName.label" default="Location Name" /></dt>
				
					<dd><g:fieldValue bean="${derbyInstance}" field="locationName"/></dd>
				
			
				<dt><g:message code="derby.date.label" default="Date" /></dt>
				
					<dd><g:formatDate date="${derbyInstance?.date}" /></dd>
				
			
				<dt><g:message code="derby.organizationNumber.label" default="Organization Number" /></dt>
				
					<dd><g:fieldValue bean="${derbyInstance}" field="organizationNumber"/></dd>
				
			
				<dt><g:message code="derby.dateCreated.label" default="Date Created" /></dt>
				
					<dd><g:formatDate date="${derbyInstance?.dateCreated}" /></dd>
				
			
				<dt><g:message code="derby.lastUpdated.label" default="Last Updated" /></dt>
				
					<dd><g:formatDate date="${derbyInstance?.lastUpdated}" /></dd>
				
			
				<dt><g:message code="derby.races.label" default="Races" /></dt>
				
					<g:each in="${derbyInstance.races}" var="r">
						<dd><g:link controller="race" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></dd>
					</g:each>
				
			
			</dl>
			<g:form>
				<g:hiddenField name="id" value="${derbyInstance?.id}" />
				<g:actionSubmit data-icon="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" />
			</g:form>
		</div>
		<div data-role="footer" data-theme="b">
		</div>
    </body>
</html>
