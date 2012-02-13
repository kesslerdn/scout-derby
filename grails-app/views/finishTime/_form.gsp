<%@ page import="com.sourceallies.FinishTime" %>



<div class="fieldcontain ${hasErrors(bean: finishTimeInstance, field: 'seconds', 'error')} required">
	<label for="seconds">
		<g:message code="finishTime.seconds.label" default="Seconds" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="seconds" value="${fieldValue(bean: finishTimeInstance, field: 'seconds')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: finishTimeInstance, field: 'laneNumber', 'error')} required">
	<label for="laneNumber">
		<g:message code="finishTime.laneNumber.label" default="Lane Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="laneNumber" value="${fieldValue(bean: finishTimeInstance, field: 'laneNumber')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: finishTimeInstance, field: 'car', 'error')} required">
	<label for="car">
		<g:message code="finishTime.car.label" default="Car" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="car.id" from="${com.sourceallies.Car.list()}" optionKey="id" value="${finishTimeInstance?.car?.id}"  />
</div>

