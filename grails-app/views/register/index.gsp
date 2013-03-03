<html>

<head>
	<meta name='layout' content='derbyMobile'/>
	<title><g:message code='spring.security.ui.register.title'/></title>
	<style type="text/css">
		.ui-btn-block{
			display: none;
		}
	</style>
</head>

<body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1>Register</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
				</ul>
			</div>
		</div>

<div data-role="content" data-theme="b">
<g:form action='register' name='registerForm'>
	<g:hasErrors bean="${command}">
		<div class="errors" role="alert">
			<g:renderErrors bean="${command}" as="list" />
		</div>
	</g:hasErrors>
	<g:if test="${flash.error}">
		<div class="errors" role="alert">${flash.error}</div>
	</g:if>
	<g:if test="${flash.message}">
		<div class="message" role="alert">${flash.message}</div>
	</g:if>
	<g:if test='${emailSent}'>
	<br/>
	<g:message code='spring.security.ui.register.sent'/>
	</g:if>
	<g:else>

	<div class="fieldcontain">
		<label for="username">Username</label>
		<g:textField name="username" id="username" size="40" />
	</div>
                        
	<div class="fieldcontain">
		<label for="email">E-mail</label>
		<g:textField name="email" id="email" size="40" />
	</div>
                        
	<div class="fieldcontain">
		<label for="password">Password</label>
		<g:passwordField name="password" id="password" size="40" />
	</div>
                        
	<div class="fieldcontain">
		<label for="password2">Password (again)</label>
		<g:passwordField name="password2" id="password2" size="40" />
	</div>
	
	<s2ui:submitButton elementId='create' form='registerForm' messageCode='spring.security.ui.register.submit'/>

	</g:else>

</g:form>
</div>

<script>
$(document).ready(function() {
	$('#username').focus();
});
</script>

</body>
</html>
