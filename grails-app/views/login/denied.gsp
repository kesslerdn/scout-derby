<!doctype html>
<html>
<head>
	<meta name="layout" content="derbyMobile">
	<title><g:message code="springSecurity.denied.title" /></title>
</head>
<body>
	<div data-role="header" data-position="inline" data-theme="b">
		<h1><g:message code="springSecurity.denied.title" /></h1>
		<div data-role="navbar">
			<ul>
				<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label" /></a></li>
			</ul>
		</div>
	</div>
	<div data-role="content" data-theme="b" style="text-align: center">
		<p><g:message code="springSecurity.denied.message" /></p>
	</div>
	<div data-role="footer"></div>
</body>
</html>

