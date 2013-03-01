<html>

<head>
<title><g:message code='spring.security.ui.forgotPassword.title'/></title>
<meta name='layout' content='mobile'/>
	<style type="text/css">
		.ui-btn-block{
			display: none;
		}
	</style>
</head>

<body>

		<div data-role="header" data-position="inline" data-theme="b">
			<h1>Forgot Password</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
				</ul>
			</div>
		</div>

<div data-role="content" data-theme="b">
	<g:form action='forgotPassword' name="forgotPasswordForm" autocomplete='off'>

	<g:if test="${flash.message}">
		<div class="message" role="alert">${flash.message}</div>
	</g:if>
	<g:if test='${emailSent}'>
	<br/>
	<g:message code='spring.security.ui.forgotPassword.sent'/>
	</g:if>
	<g:else>

	<div class="fieldcontain">
		<label for="username">Username</label>
		<g:textField name="username" id="username" size="25" />
	</div>

	<s2ui:submitButton elementId='reset' form='forgotPasswordForm' messageCode='spring.security.ui.forgotPassword.submit'/>

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
