

<%@ page import="com.sourceallies.Role" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
			<g:hasErrors bean="${roleInstance}">
			<div class="errors" role="alert">
				<g:renderErrors bean="${roleInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form data-ajax="false" method="post" >
				<g:hiddenField name="id" value="${roleInstance?.id}" />
				<g:hiddenField name="version" value="${roleInstance?.version}" />
			
				<div data-role="fieldcontain">
					<label for="authority"><g:message code="role.authority.label" default="Authority" /></label>
					<g:textField name="authority" value="${roleInstance?.authority}" />
				</div>
			
				<button type='submit' id="_action_update"  name="_action_update" data-icon="check">Update</button>

			</g:form>
		</div>
		<div data-role="footer" data-theme="b">
		</div>
    </body>
</html>
