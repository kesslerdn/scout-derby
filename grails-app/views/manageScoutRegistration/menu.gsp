
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
				<li><g:link data-icon="arrow-l" controller="manageDerby" data-ajax="false">Manage Derby</g:link></li>
			</ul>
		</div>
	</div>
	<div data-role="content" data-theme="b">
			<ul data-role="listview" data-filter="false">
				<li>
					<a href="mailto:?subject=${derbyType}%20Registration%20Team%20Invitation&body=Please%20join%20our%20${derbyType}%20Registration%20Team.%20To%20start%20registering%20scouts%20please%20visit%20${registrationUrl.encodeAsURL()}">Invite Registration Team</a>
				</li>
				<li>
					<g:link action="registerScout" data-ajax="false" params="[hashKey:hashKey]">Register Scout</g:link>
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
