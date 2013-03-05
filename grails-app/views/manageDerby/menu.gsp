
<!doctype html>
<html>
<head>
	<meta name="layout" content="derbyMobile">
	<title>Manage Derby</title>
</head>
<body>
	<div data-role="header" data-position="inline" data-theme="b">
		<h1>Manage Derby</h1>
		<div data-role="navbar">
			<ul>
				<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label" /></a></li>
			</ul>
		</div>
	</div>
	<div data-role="content" data-theme="b">
			<ul data-role="listview" data-filter="false">
				<li>
					<g:link controller="derbySetup" data-ajax="false">Setup New Derby</g:link>
				</li>
				<li>
					<g:link controller="manageScoutRegistration" data-ajax="false">Manage Scout Registration</g:link>
				</li>
				<li>
					<g:link controller="race" action="nextHeat" data-ajax="false">Start Race</g:link>
				</li>
				<li>
					<g:link action="advanced" data-ajax="false">Advanced Management</g:link>
				</li>
				<li>
					<g:link controller="donate">Donate</g:link>
				</li>
				<li>
					<a href="${createLink(uri: '/about')}">About</a>
				</li>
				<li>
					<a href="mailto:help@mobilederby.org?subject=MobileDerby.org%20Help">Contact</a>
				</li>
			</ul>
		</div>
		<div data-role="footer">
		</div>
</body>
</html>
