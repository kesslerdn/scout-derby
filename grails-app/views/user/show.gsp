
<%@ page import="com.sourceallies.User" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
			
				<dt><g:message code="user.id.label" default="Id" /></dt>
				
					<dd><g:fieldValue bean="${userInstance}" field="id"/></dd>
				
			
				<dt><g:message code="user.username.label" default="Username" /></dt>
				
					<dd><g:fieldValue bean="${userInstance}" field="username"/></dd>
				
			
				<dt><g:message code="user.password.label" default="Password" /></dt>
				
					<dd><g:fieldValue bean="${userInstance}" field="password"/></dd>
				
			
				<dt><g:message code="user.accountExpired.label" default="Account Expired" /></dt>
				
					<dd><g:formatBoolean boolean="${userInstance?.accountExpired}" /></dd>
				
			
				<dt><g:message code="user.accountLocked.label" default="Account Locked" /></dt>
				
					<dd><g:formatBoolean boolean="${userInstance?.accountLocked}" /></dd>
				
			
				<dt><g:message code="user.email.label" default="Email" /></dt>
				
					<dd><g:fieldValue bean="${userInstance}" field="email"/></dd>
				
			
				<dt><g:message code="user.enabled.label" default="Enabled" /></dt>
				
					<dd><g:formatBoolean boolean="${userInstance?.enabled}" /></dd>
				
			
				<dt><g:message code="user.passwordExpired.label" default="Password Expired" /></dt>
				
					<dd><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></dd>
				
			
			</dl>
			<g:form>
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<button type="submit" name="_action_delete" value="Delete" data-icon="delete">Delete</button>
			</g:form>
		</div>
		<div data-role="footer" data-theme="b">
		</div>
    </body>
</html>
