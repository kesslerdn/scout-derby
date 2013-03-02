<%@ page import="com.sourceallies.Race" %>



<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="race.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="required" value="${raceInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'numberOfLanes', 'error')} required">
	<label for="numberOfLanes">
		<g:message code="race.numberOfLanes.label" default="Number Of Lanes" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="numberOfLanes" from="${raceInstance.constraints.numberOfLanes.inList}" value="${fieldValue(bean: raceInstance, field: 'numberOfLanes')}" valueMessagePrefix="race.numberOfLanes"  />
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'vehicles', 'error')} ">
	<label for="vehicles">
		<g:message code="race.vehicles.label" default="Vehicles" />
		
	</label>
	<g:select name="vehicles" from="${com.sourceallies.Vehicle.list()}" multiple="multiple" optionKey="id" size="5" value="${raceInstance?.vehicles*.id}" />
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'currentHeat', 'error')} required">
	<label for="currentHeat">
		<g:message code="race.currentHeat.label" default="Current Heat" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="currentHeat" value="${fieldValue(bean: raceInstance, field: 'currentHeat')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'derby', 'error')} required">
	<label for="derby">
		<g:message code="race.derby.label" default="Derby" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="derby.id" from="${com.sourceallies.Derby.list()}" optionKey="id" value="${raceInstance?.derby?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'lanes', 'error')} ">
	<label for="lanes">
		<g:message code="race.lanes.label" default="Lanes" />
		
	</label>
	<g:select name="lanes" from="${com.sourceallies.Lane.list()}" multiple="multiple" optionKey="id" size="5" value="${raceInstance?.lanes*.id}" />
</div>

