
<%@ page import="com.sourceallies.Vehicle"%>
<!doctype html>
<html>
<head>
	<meta name="layout" content="derbyMobile">
	<title>About</title>
</head>
<body>
	<div data-role="header" data-position="inline" data-theme="b">
		<h1>About</h1>
		<div data-role="navbar">
			<ul>
				<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label" /></a></li>
			</ul>
		</div>
	</div>
	<div data-role="content"  data-theme="b" style="text-align: center">
		<p>My name is David Kessler.  As a life-long scout and Eagle Scout, I'm committed to giving back to scouting.
		I developed MobileDerby.org to simplify the management of scouting derbies.  I started making and racing 
		Pinewood Derby cars as a young boy and now I help my four boys make a new generation of exciting memories.  
		While the races remain the same for every boy, technology just keeps improving.</p>
		<p>MobileDerby.org eliminates the need for laptops and costly software.  MobileDerby.org is designed for
		web-enabled mobile phones.  Organizers can quickly enlist volunteers with mobile phones to register scouts
		and record times, through our simple management tools.</p>
		<p>MobileDerby.org is developed and distributed free-of-charge.  While this service is provided at no cost 
		to the users, it is not free to develop, maintain, and distribute.  Please help us ensure that this site 
		remains available for scouts everywhere.</p>
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
