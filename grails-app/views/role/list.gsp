
<%@ page import="com.sourceallies.Role" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
	<body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
					<li><g:link data-icon="grid" data-ajax="false" controller="admin">Admin</g:link></li>
					<li><g:link data-icon="plus" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</div>
		<div data-role="content" data-theme="b">
			<g:if test="${flash.message}">
			<div class="message"><p>${flash.message}</p></div>
			</g:if>
			<ul data-role="listview" data-split-icon="delete" data-filter="true">
				<g:each in="${roleInstanceList}" status="i" var="roleInstance">
					<li>
						<g:link action="edit" id="${roleInstance.id}">${roleInstance}</g:link>
						<g:link action="delete" id="${roleInstance.id}" data-ajax="false"><g:message code="default.button.delete.label" default="Delete" /></g:link>
					</li>
				</g:each>
			</ol>
			<g:if test="${showMoreSize > 0}">
			<g:link data-role="button" action="list" params="[max:max]">Show ${showMoreSize} More</g:link>
			</g:if>
		</div>
		<div data-role="footer" data-theme="b">
		</div>
    </body>
</html>