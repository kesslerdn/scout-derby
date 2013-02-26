<!doctype html>
<html>
	<head>
		<!-- before -->
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'camera.css')}" type="text/css">
		<script src="${resource(dir: 'js', file: 'camera-min.js')}" type="text/javascript"></script>
		<script src="${resource(dir: 'js', file: 'jquery-easing.js')}" type="text/javascript"></script>
		<!-- after -->
		<meta name="layout" content="mobile"/>
		<title>Mobile Derby</title>
		<script>
			jQuery(function(){			
				jQuery('#camera_wrap_1').camera({
					thumbnails: false,
					pagination: false,
					navigation: false,
					pauseOnClick: false,
					playPause: false,
					loader: 'bar'
				});
			});
		</script>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<div class="fluid_container">
	        <div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
	            <div data-src="${createLinkTo(dir:'images/slides',file:'sm-mobilederby-banner-1.jpg')}"></div>
	            <div data-src="${createLinkTo(dir:'images/slides',file:'sm-mobilederby-banner-4.jpg')}"></div>
	            <div data-src="${createLinkTo(dir:'images/slides',file:'sm-mobilederby-banner-2.jpg')}"></div>
	            <div data-src="${createLinkTo(dir:'images/slides',file:'sm-mobilederby-banner-5.jpg')}"></div>
	            <div data-src="${createLinkTo(dir:'images/slides',file:'sm-mobilederby-banner-3.jpg')}"></div>
	        </div><!-- #camera_wrap_1 -->
	    </div><!-- .fluid_container -->
	    <div style="clear:both; display:block; height:1px"></div>
		<div data-role="content" data-theme="b">
			<ul data-role="listview" data-filter="false">
				<li>
					<g:link controller="race" action="report">View Derby</g:link>
				</li>
				<li>
					<g:link controller="derby" action="list">Manage Derby</g:link>
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
