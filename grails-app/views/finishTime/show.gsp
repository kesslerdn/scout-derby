
<%@ page import="com.sourceallies.FinishTime" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'finishTime.label', default: 'FinishTime')}" />
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
			
				<dt><g:message code="finishTime.id.label" default="Id" /></dt>
				
					<dd><g:fieldValue bean="${finishTimeInstance}" field="id"/></dd>
				
			
				<dt><g:message code="finishTime.seconds.label" default="Seconds" /></dt>
				
					<dd><g:fieldValue bean="${finishTimeInstance}" field="seconds"/></dd>
				
			
				<dt><g:message code="finishTime.laneNumber.label" default="Lane Number" /></dt>
				
					<dd><g:fieldValue bean="${finishTimeInstance}" field="laneNumber"/></dd>
				
			
				<dt><g:message code="finishTime.vehicle.label" default="Vehicle" /></dt>
				
					<dd><g:link controller="vehicle" action="show" id="${finishTimeInstance?.vehicle?.id}">${finishTimeInstance?.vehicle?.encodeAsHTML()}</g:link></dd>
				
			
				<dt><g:message code="finishTime.dateCreated.label" default="Date Created" /></dt>
				
					<dd><g:formatDate date="${finishTimeInstance?.dateCreated}" /></dd>
				
			
				<dt><g:message code="finishTime.lastUpdated.label" default="Last Updated" /></dt>
				
					<dd><g:formatDate date="${finishTimeInstance?.lastUpdated}" /></dd>
				
			
			</dl>
			<g:form>
				<g:hiddenField name="id" value="${finishTimeInstance?.id}" />
				<g:actionSubmit data-icon="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" />
			</g:form>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
