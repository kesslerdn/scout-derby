
<%@ page import="com.sourceallies.Owner" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'owner.label', default: 'Owner')}" />
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
			
				<dt><g:message code="owner.id.label" default="Id" /></dt>
				
					<dd><g:fieldValue bean="${ownerInstance}" field="id"/></dd>
				
			
				<dt><g:message code="owner.firstName.label" default="First Name" /></dt>
				
					<dd><g:fieldValue bean="${ownerInstance}" field="firstName"/></dd>
				
			
				<dt><g:message code="owner.car.label" default="Car" /></dt>
				
					<dd><g:link controller="car" action="show" id="${ownerInstance?.car?.id}">${ownerInstance?.car?.encodeAsHTML()}</g:link></dd>
				
			
				<dt><g:message code="owner.dateCreated.label" default="Date Created" /></dt>
				
					<dd><g:formatDate date="${ownerInstance?.dateCreated}" /></dd>
				
			
				<dt><g:message code="owner.lastName.label" default="Last Name" /></dt>
				
					<dd><g:fieldValue bean="${ownerInstance}" field="lastName"/></dd>
				
			
				<dt><g:message code="owner.lastUpdated.label" default="Last Updated" /></dt>
				
					<dd><g:formatDate date="${ownerInstance?.lastUpdated}" /></dd>
				
			
			</dl>
			<g:form>
				<g:hiddenField name="id" value="${ownerInstance?.id}" />
				<g:actionSubmit data-icon="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" />
			</g:form>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
