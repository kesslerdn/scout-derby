<!doctype html>
<html>
	<head>
		<meta name="layout" content="mobile">
		<title>Next Heat</title>
	</head>
	<body>
		<div data-role="header" data-position="inline">
			<h1>Heat ${heatIndex + 1}</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				</ul>
			</div>
		</div>
		<div data-role="content">
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
							<th>Car #</th>					
							<th>Car Name</th>					
							<th>Car Owner</th>					
						</tr>
					</thead>
					<tbody>
					<g:each in="${lanes}" status="i" var="lane">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td><g:field id="finishTimes_${i}" type="number"  step="any" min="0" name="finishTimes" required="true"/></td>
							<td><input type="button" value="X" onClick="document.getElementById('finishTimes_${i}').value = '15.0'"" /></td>
							<td>${lane.number}</td>	
							<td>${lane.cars[heatIndex].id}</td>								
							<td>${lane.cars[heatIndex].carName}</td>								
							<td>${lane.cars[heatIndex].owner}</td>	
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
