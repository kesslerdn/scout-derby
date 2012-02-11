<%@ page import="com.sourceallies.Car" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Next Heat</title>
	</head>
	<body>
		<a href="#create-car" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-car" class="content scaffold-create" role="main">
			<h1>Heat ${heatIndex + 1}</h1>
			<g:if test="${flash.message}">
			<div class="errors" role="alert">${flash.message}</div>
			</g:if>
			<g:form action="nextHeat" >
				<g:hiddenField name="id" value="${id}" />
				<table>
					<thead>
						<tr>
							<th>Time (secs)</th>	
							<th>Lane</th>					
							<th>Car #</th>					
							<th>Car Name</th>					
							<th>Car Owner</th>					
						</tr>
					</thead>
					<tbody>
					<g:each in="${lanes}" status="i" var="lane">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td><g:textField id="finishTimes_${i}" name="finishTimes" required="true"/> 
							<a href="javascript:func()" onclick="document.getElementById('finishTimes_${i}').value = '15.0'" tabindex="-1">Not Finished</a></td>
							<td>${lane.number}</td>	
							<td>${lane.cars[heatIndex].id}</td>								
							<td>${lane.cars[heatIndex].carName}</td>								
							<td>${lane.cars[heatIndex].owner}</td>	
						</tr>
					</g:each>
					</tbody>
				</table>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Next" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
