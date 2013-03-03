<!doctype html>
<html>
<head>
<title><g:layoutTitle default="Grails" /></title>
<!--  the one -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon" />
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
	<!-- before -->
<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
<!-- after -->
<style type="text/css">
	select{
		font-size: 50px;
	}
</style>
<r:require modules="jquery,jquery-mobile" />
<r:layoutResources />
<g:layoutHead />
</head>
<body>
	<div data-role="page" data-cache="never" id="mainpage">
		<g:layoutBody />
	</div>
</body>
</html>