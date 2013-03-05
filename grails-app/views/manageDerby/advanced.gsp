
<!doctype html>
<html>
<head>
	<meta name="layout" content="derbyMobile">
	<title>Advanced Management</title>
</head>
<body>
	<div data-role="header" data-position="inline" data-theme="b">
		<h1>Advanced Management</h1>
		<div data-role="navbar">
			<ul>
				<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label" /></a></li>
				<li><g:link data-icon="arrow-l" controller="manageDerby" data-ajax="false">Manage Derby</g:link></li>
			</ul>
		</div>
	</div>
	<div data-role="content" data-theme="b">
			<ul data-role="listview" data-filter="false">
				<li>
					<g:link controller="derby" data-ajax="false">Advanced Derby Management</g:link>
				</li>
				<li>
					<g:link controller="race" data-ajax="false">Advanced Race Management</g:link>
				</li>
				<li>
					<g:link controller="owner" data-ajax="false">Advanced Owner Management</g:link>
				</li>
				<li>
					<g:link controller="vehicle" data-ajax="false">Advanced Vehicle Management</g:link>
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
