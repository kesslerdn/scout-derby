<!doctype html>
<html>
	<head>
		<meta name="layout" content="derbyMobile">
		<title>Next Heat</title>
	</head>
	<body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1>Heat ${heatIndex + 1}</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
				</ul>
			</div>
		</div>
		<div data-role="content" data-theme="b">
			<g:if test="${flash.message}">
			<div class="message" role="alert">${flash.message}</div>
			</g:if>
			<g:form action="nextHeat" >
				<g:hiddenField name="id" value="${id}" />
				<table>
					<thead>
						<tr>
							<th>Time (secs)</th>
							<th>Not Finished</th>	
							<th>Lane</th>					
							<th>Vehicle #</th>					
							<th>Vehicle Name</th>					
							<th>Vehicle Owner</th>					
						</tr>
					</thead>
					<tbody>
					<g:each in="${lanes}" status="i" var="lane">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td><g:field id="finishTimes_${i}" type="number"  step="any" min="0" name="finishTimes" /></td>
							<td><input type="button" value="X" onClick="document.getElementById('finishTimes_${i}').value = '15.0'"" /></td>
							<td>${lane.number}</td>	
							<td>${lane.vehicles[heatIndex].id}</td>								
							<td>${lane.vehicles[heatIndex].vehicleName}</td>								
							<td>${lane.vehicles[heatIndex].owner}</td>	
						</tr>
					</g:each>
					</tbody>
				</table>
				<fieldset class="buttons">
					<g:submitButton name="create" data-icon="check" value="Next" />
				</fieldset>
			</g:form>
		</div>
		<div data-role="footer">
		</div>
 		</div>
	</body>
</html>
