
<%@ page import="com.sourceallies.Car"%>
<!doctype html>
<html>
<head>
	<meta name="layout" content="derbyMobile">
	<title>Donate</title>
</head>
<body>
	<div data-role="header" data-position="inline" data-theme="b">
		<h1>Donate</h1>
		<div data-role="navbar">
			<ul>
				<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label" /></a></li>
			</ul>
		</div>
	</div>
	<div data-role="content"  data-theme="b" style="text-align: center">
		<p>Pack/Troop 133 in Carlisle Iowa makes this software available free of charge.
		Please help us ensure that this site remains available for scouts everywhere.</p>
		<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
			<input type="hidden" name="cmd" value="_s-xclick"> <input
				type="hidden" name="hosted_button_id" value="BSCKAX4P7WKHA">
			<input data-role="none" type="image"
				src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif"
				border="0" name="submit"
				alt="PayPal - The safer, easier way to pay online!"> <img
				alt="" border="0"
				src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1"
				height="1">
		</form>
		<p>100% of all donations are used to support costs related to MobileDerby.org and local scouting.</p>
	</div>
	<div data-role="footer"></div>
</body>
</html>
