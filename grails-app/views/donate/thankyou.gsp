
<%@ page import="com.sourceallies.Car"%>
<!doctype html>
<html>
<head>
	<meta name="layout" content="derbyMobile">
	<title>Thank You</title>
</head>
<body>
	<div data-role="header" data-position="inline" data-theme="b">
		<h1>Thank You</h1>
		<div data-role="navbar">
			<ul>
				<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label" /></a></li>
			</ul>
		</div>
	</div>
	<div data-role="content" data-theme="b" style="text-align: center">
		<p>Thank you for your donation.  Your donation helps keep MobileDerby.org available to scouts free of charge.</p>
		<p>100% of all donations are used to support costs related to MobileDerby.org and local scouting.</p>
	</div>
	<div data-role="footer"></div>
</body>
</html>
