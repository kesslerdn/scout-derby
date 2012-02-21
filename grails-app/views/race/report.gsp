<!doctype html>
<html>
	<head>
		<meta name="layout" content="mobile">
		<title>Race Report</title>
	</head>
	<body>
		<div data-role="header" data-position="inline">
			<h1>Race Report - ${raceInstance}</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				</ul>
			</div>
		</div>
		<div data-role="content">
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
			</g:if>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<g:link controller="race" action="report" id="${id}" data-ajax="false">Update Race Stats</g:link>
			<div class="ui-grid-d">
				<div class="ui-block-a">
				 <div class="ui-bar ui-bar-b" style="font-weight:bold;">Place</div>
				</div>
				<div class="ui-block-b">
				 <div class="ui-bar ui-bar-b" style="font-weight:bold;">Car #</div>
				</div>
				<div class="ui-block-c">
				 <div class="ui-bar ui-bar-b" style="font-weight:bold;">Car Name</div>
				</div>
				<div class="ui-block-d">
				 <div class="ui-bar ui-bar-b" style="font-weight:bold;">Car Owner</div>
				</div>
				<div class="ui-block-e">
				 <div class="ui-bar ui-bar-b" style="font-weight:bold;">Average Time</div>
				</div>
				
				<g:each in="${cars}" status="i" var="car">
					<div class="ui-block-a">
				 		<div class="ui-bar ui-bar-b">
				 			<g:ordinalFormat value="${i + 1}"/>
				 		</div>
				 	</div>															
					<div class="ui-block-b">
				 		<div class="ui-bar ui-bar-b">
				 			${car.id}
				 		</div>
				 	</div>							
					<div class="ui-block-c">
				 		<div class="ui-bar ui-bar-b">
							${car.carName}
						</div>
					</div>								
					<div class="ui-block-d">
				 		<div class="ui-bar ui-bar-b">
							${car.owner}
						</div>
					</div>	
					<div class="ui-block-e">
				 		<div class="ui-bar ui-bar-b">
							${car.averageTime()} seconds
						</div>
					</div>	
				</g:each>
			</div>
			<g:if test="${showMoreSize > 0}">
			<g:link data-role="button" action="report" params="[max:max, id:id]">Show ${showMoreSize} More</g:link>
			</g:if>
		</div>
		<div data-role="footer">
		</div>
	</body>
</html>
