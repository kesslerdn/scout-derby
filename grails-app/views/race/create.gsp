<%@ page import="com.sourceallies.Race" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-race" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-race" class="content scaffold-create" role="main">
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
			<g:form action="save" >
				<fieldset class="form">
					
					<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'derby', 'error')} required">
						<label for="derby">
							<g:message code="race.derby.label" default="Derby" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="derby" name="derby.id" from="${com.sourceallies.Derby.list()}" optionKey="id" required="true" value="${raceInstance?.derby?.id}" noSelection="['':'- Select -']" class="many-to-one"/>
					</div>
					<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'name', 'error')} required">
						<label for="name">
							<g:message code="race.name.label" default="Name" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="name" required="" value="${raceInstance?.name}"/>
					</div>
					<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'numberOfLanes', 'error')} required">
						<label for="numberOfLanes">
							<g:message code="race.numberOfLanes.label" default="Number Of Lanes" />
							<span class="required-indicator">*</span>
						</label>
						<g:select name="numberOfLanes" from="${raceInstance.constraints.numberOfLanes.inList}" required="true" noSelection="['':'- Select -']" value="${fieldValue(bean: raceInstance, field: 'numberOfLanes')}" valueMessagePrefix="race.numberOfLanes"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
