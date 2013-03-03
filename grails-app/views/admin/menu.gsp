
<!doctype html>
<html>
<head>
	<meta name="layout" content="derbyMobile">
	<title>Admin</title>
</head>
<body>
	<div data-role="header" data-position="inline" data-theme="b">
		<h1>Admin</h1>
		<div data-role="navbar">
			<ul>
				<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label" /></a></li>
			</ul>
		</div>
	</div>
	<div data-role="content" data-theme="b">
			<ul data-role="listview" data-filter="false">
				<li>
					<g:link controller="user" data-ajax="false">User</g:link>
				</li>
				<li>
					<g:link controller="role" data-ajax="false">Role</g:link>
				</li>
				<li>
					<g:link controller="userRole" data-ajax="false">User Role</g:link>
				</li>
			</ul>
		</div>
		<div data-role="footer">
		</div>
</body>
</html>
