
<%@ page import="com.sourceallies.Car" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="mobile">
        <g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
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
			
				<dt><g:message code="car.id.label" default="Id" /></dt>
				
					<dd><g:fieldValue bean="${carInstance}" field="id"/></dd>
				
			
				<dt><g:message code="car.owner.label" default="Owner" /></dt>
				
					<dd><g:link controller="owner" action="show" id="${carInstance?.owner?.id}">${carInstance?.owner?.encodeAsHTML()}</g:link></dd>
				
			
				<dt><g:message code="car.carName.label" default="Car Name" /></dt>
				
					<dd><g:fieldValue bean="${carInstance}" field="carName"/></dd>
				
			
				<dt><g:message code="car.dateCreated.label" default="Date Created" /></dt>
				
					<dd><g:formatDate date="${carInstance?.dateCreated}" /></dd>
				
			
				<dt><g:message code="car.finishTimes.label" default="Finish Times" /></dt>
				
					<g:each in="${carInstance.finishTimes}" var="f">
						<dd><g:link controller="finishTime" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></dd>
					</g:each>
				
			
				<dt><g:message code="car.lastUpdated.label" default="Last Updated" /></dt>
				
					<dd><g:formatDate date="${carInstance?.lastUpdated}" /></dd>
				
			
			</dl>
			<g:form>
				<g:hiddenField name="id" value="${carInstance?.id}" />
				<g:actionSubmit data-icon="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" />
			</g:form>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
