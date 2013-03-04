<!doctype html>
<html>
<head>
	<meta name="layout" content="derbyMobile">
	<title>Scout Registraion Error</title>
</head>
<body>
	<div data-role="header" data-position="inline" data-theme="b">
		<h1>Scout Registraion Error</h1>
		<div data-role="navbar">
			<ul>
				<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label" /></a></li>
			</ul>
		</div>
	</div>
	<div data-role="content" data-theme="b" style="text-align: center">
			<g:if test="${flash.message}">
			<div class="message" role="alert">${flash.message}</div>
			</g:if>
		<p>Your request was not able to be processed.</p>
	</div>
	<div data-role="footer"></div>
</body>
</html>

