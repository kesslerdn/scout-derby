<html>

<head>
<title><g:message code='spring.security.ui.resetPassword.title'/></title>
<meta name='layout' content='mobile'/>
	<style type="text/css">
		.ui-btn-block{
			display: none;
		}
	</style>
</head>

<body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1>Reset Password</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
				</ul>
			</div>
		</div>

	<div data-role="content" data-theme="b">
	<g:form action='resetPassword' name='resetPasswordForm' autocomplete='off'>
	<g:hiddenField name='t' value='${token}'/>
	<div class="sign-in">

	<div class="fieldcontain">
		<label for="password">Password</label>
		<g:passwordField name="password" id="password" size="40" />
	</div>
                        
	<div class="fieldcontain">
		<label for="password2">Password (again)</label>
		<g:passwordField name="password2" id="password2" size="40" />
	</div>

	<s2ui:submitButton elementId='reset' form='resetPasswordForm' messageCode='spring.security.ui.resetPassword.submit'/>

	</div>
	</g:form>

</div>

<script>
$(document).ready(function() {
	$('#password').focus();
});
</script>

</body>
</html>
