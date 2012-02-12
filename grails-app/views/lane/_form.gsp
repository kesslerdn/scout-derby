<%@ page import="com.sourceallies.Lane" %>



<div class="fieldcontain ${hasErrors(bean: laneInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="lane.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="number" required="" value="${fieldValue(bean: laneInstance, field: 'number')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: laneInstance, field: 'cars', 'error')} ">
	<label for="cars">
		<g:message code="lane.cars.label" default="Cars" />
		
	</label>
	<g:select name="cars" from="${com.sourceallies.Car.list()}" multiple="multiple" optionKey="id" size="5" value="${laneInstance?.cars*.id}" class="many-to-many"/>
</div>

