<html>

<head>
	<title>Login</title>
	<meta name='layout' content='derbyMobile'/>
	<style type="text/css">
		.ui-btn-block{
			display: none;
		}
	</style>
</head>

<body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1>Login</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
				</ul>
			</div>
		</div>

	<div data-role="content" data-theme="b">
	<form action='${postUrl}' method='POST' id="loginForm" name="loginForm" autocomplete='off'>
			<g:if test="${flash.message}">
			<div class="message" role="alert">${flash.message}</div>
			</g:if>
		<div class="fieldcontain">
			<label for="username"><g:message code='spring.security.ui.login.username'/></label>
			<g:textField name="j_username" id="username" size="20" />
		</div>
		<div class="fieldcontain">
			<label for="password"><g:message code='spring.security.ui.login.password'/></label>
			<g:passwordField name="j_password" id="password" size="20" />
		</div>
		<s2ui:submitButton elementId='loginButton' form='loginForm' messageCode='spring.security.ui.login.login'/>

		<ul data-role="listview" data-ajax="false" data-inset="true" data-theme="b">
    		<li><g:link controller='register' action='forgotPassword' data-ajax="false"><g:message code='spring.security.ui.login.forgotPassword'/></g:link></li>
			<li><g:link controller='register' data-ajax="false"><g:message code='spring.security.ui.login.register'/></g:link></li>
		</ul>
	</form>
</div>

<script>
$(document).ready(function() {
	$('#username').focus();
});

<s2ui:initCheckboxes/>

</script>

</body>
</html>
