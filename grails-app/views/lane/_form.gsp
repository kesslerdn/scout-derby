<%@ page import="com.sourceallies.Lane" %>



<div class="fieldcontain ${hasErrors(bean: laneInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="lane.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="number" value="${fieldValue(bean: laneInstance, field: 'number')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: laneInstance, field: 'vehicles', 'error')} ">
	<label for="vehicles">
		<g:message code="lane.vehicles.label" default="Vehicles" />
		
	</label>
	<g:select name="vehicles" from="${com.sourceallies.Vehicle.list()}" multiple="multiple" optionKey="id" size="5" value="${laneInstance?.vehicles*.id}" />
</div>

