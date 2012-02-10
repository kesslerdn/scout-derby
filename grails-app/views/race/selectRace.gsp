<%@ page import="com.sourceallies.Car" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Select Race</title>
	</head>
	<body>
		<a href="#create-car" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-car" class="content scaffold-create" role="main">
			<h1>Select Race</h1>
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
			<g:form action="${actionName}" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'id', 'error')} ">
						<label for="race">
							<g:message code="race.label" default="Race" />
							
						</label>
						<g:select id="race" name="id" from="${com.sourceallies.Race.list()}" optionKey="id" required="true" noSelection="['':'- Select -']" value="${id}"/>
					</div>					
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Next" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
