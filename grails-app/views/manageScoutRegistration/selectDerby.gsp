<!doctype html>
<html>
	<head>
		<meta name="layout" content="derbyMobile">
		<title>Select Derby</title>
	</head>
	<body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1>Select Derby</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
				<li>
					<g:link data-icon="arrow-l" controller="manageDerby" data-ajax="false">Manage Scout Registration</g:link>
				</li>
				</ul>
			</div>
		</div>
		<div data-role="content" data-theme="b">
			<g:if test="${flash.message}">
			<div class="message" role="alert">${flash.message}</div>
			</g:if>
			<g:form action="menu" >
				<fieldset class="form">
					<div class="fieldcontain">
						<label for="derby">
							<g:message code="derby.label" default="Derby" />
							
						</label>
						<g:select id="derby" name="id" from="${derbySelectOptions}" optionKey="id"  noSelection="['':'- Select -']" value="${id}"/>
					</div>					
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Next" />
				</fieldset>
			</g:form>
		</div>
		<div data-role="footer">
		</div>
 		</div>
	</body>
</html>
