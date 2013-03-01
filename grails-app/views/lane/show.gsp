
<%@ page import="com.sourceallies.Lane" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'lane.label', default: 'Lane')}" />
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
			
				<dt><g:message code="lane.id.label" default="Id" /></dt>
				
					<dd><g:fieldValue bean="${laneInstance}" field="id"/></dd>
				
			
				<dt><g:message code="lane.number.label" default="Number" /></dt>
				
					<dd><g:fieldValue bean="${laneInstance}" field="number"/></dd>
				
			
				<dt><g:message code="lane.cars.label" default="Cars" /></dt>
				
					<g:each in="${laneInstance.cars}" var="c">
						<dd><g:link controller="car" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></dd>
					</g:each>
				
			
				<dt><g:message code="lane.dateCreated.label" default="Date Created" /></dt>
				
					<dd><g:formatDate date="${laneInstance?.dateCreated}" /></dd>
				
			
				<dt><g:message code="lane.lastUpdated.label" default="Last Updated" /></dt>
				
					<dd><g:formatDate date="${laneInstance?.lastUpdated}" /></dd>
				
			
			</dl>
			<g:form>
				<g:hiddenField name="id" value="${laneInstance?.id}" />
				<g:actionSubmit data-icon="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" />
			</g:form>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
