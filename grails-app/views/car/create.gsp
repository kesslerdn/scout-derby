<%@ page import="com.sourceallies.Car" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-car" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-car" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${raceInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${raceInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:hasErrors bean="${ownerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${ownerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:hasErrors bean="${carInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${carInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'race', 'error')} ">
						<label for="race">
							<g:message code="race.label" default="Race" />
							
						</label>
						<g:select name="raceId" from="${com.sourceallies.Race.list()}" optionKey="id" required="true" noSelection="['':'- Select -']" value="${raceInstance?.id}" class="many-to-one"/>
					</div>
					<div class="fieldcontain ${hasErrors(bean: ownerInstance, field: 'firstName', 'error')} ">
						<label for="firstName">
							<g:message code="owner.firstName.label" default="Owner First Name" />
							
						</label>
						<g:textField name="firstName" value="${ownerInstance?.firstName}" required="true"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: ownerInstance, field: 'lastName', 'error')} ">
						<label for="lastName">
							<g:message code="owner.lastName.label" default="Owner Last Name" />
							
						</label>
						<g:textField name="lastName" value="${ownerInstance?.lastName}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'name', 'error')} ">
						<label for="name">
							<g:message code="car.name.label" default="Car Name" />
							
						</label>
						<g:textField name="name" value="${carInstance?.name}" required="true"/>
					</div>
					
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
