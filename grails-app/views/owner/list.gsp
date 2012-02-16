
<%@ page import="com.sourceallies.Owner" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="mobile">
        <g:set var="entityName" value="${message(code: 'owner.label', default: 'Owner')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
	<body>
		<div data-role="header" data-position="inline">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link data-icon="plus" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</div>
		<div data-role="content">
			<g:if test="${flash.message}">
			<div class="message"><p>${flash.message}</p></div>
			</g:if>
			<ul data-role="listview" data-split-icon="gear" data-filter="true">
				<g:each in="${ownerInstanceList}" status="i" var="ownerInstance">
					<li>
						<g:link action="show" id="${ownerInstance.id}">${ownerInstance}</g:link>
						<g:link action="edit" id="${ownerInstance.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					</li>
				</g:each>
			</ol>
			<g:if test="${showMoreSize > 0}">
			<g:link data-role="button" action="list" params="[max:max]">Show ${showMoreSize} More</g:link>
			</g:if>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
