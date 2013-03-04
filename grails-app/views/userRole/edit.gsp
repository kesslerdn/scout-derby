

<%@ page import="com.sourceallies.UserRole" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
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
			<g:hasErrors bean="${userRoleInstance}">
			<div class="errors" role="alert">
				<g:renderErrors bean="${userRoleInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form data-ajax="false" method="post" >
				<g:hiddenField name="id" value="${userRoleInstance?.id}" />
				<g:hiddenField name="version" value="${userRoleInstance?.version}" />
			
				<div data-role="fieldcontain">
					<label for="role"><g:message code="userRole.role.label" default="Role" /></label>
					<g:select name="role.id" from="${com.sourceallies.Role.list()}" optionKey="id" value="${userRoleInstance?.role?.id}"  />
				</div>
			
				<div data-role="fieldcontain">
					<label for="user"><g:message code="userRole.user.label" default="User" /></label>
					<g:select name="user.id" from="${com.sourceallies.User.list()}" optionKey="id" value="${userRoleInstance?.user?.id}"  />
				</div>
			
				<g:actionSubmit data-icon="check" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</g:form>
		</div>
		<div data-role="footer" data-theme="b">
		</div>
    </body>
</html>