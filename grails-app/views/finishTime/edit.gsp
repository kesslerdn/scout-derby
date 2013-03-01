

<%@ page import="com.sourceallies.FinishTime" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="${message(code: 'finishTime.label', default: 'FinishTime')}" />
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
			<g:hasErrors bean="${finishTimeInstance}">
			<div class="errors" role="alert">
				<g:renderErrors bean="${finishTimeInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${finishTimeInstance?.id}" />
				<g:hiddenField name="version" value="${finishTimeInstance?.version}" />
			
				<div data-role="fieldcontain">
					<label for="seconds"><g:message code="finishTime.seconds.label" default="Seconds" /></label>
					<g:field type="number" name="seconds" value="${fieldValue(bean: finishTimeInstance, field: 'seconds')}" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="laneNumber"><g:message code="finishTime.laneNumber.label" default="Lane Number" /></label>
					<g:field type="number" name="laneNumber" value="${fieldValue(bean: finishTimeInstance, field: 'laneNumber')}" />
				</div>
			
				<div data-role="fieldcontain">
					<label for="car"><g:message code="finishTime.car.label" default="Car" /></label>
					<g:select name="car.id" from="${com.sourceallies.Car.list()}" optionKey="id" value="${finishTimeInstance?.car?.id}"  />
				</div>
			
				<g:actionSubmit data-icon="check" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</g:form>
		</div>
		<div data-role="footer">
		</div>
    </body>
</html>
