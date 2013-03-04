<%@ page import="com.sourceallies.Owner" %>



<div class="fieldcontain ${hasErrors(bean: ownerInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="owner.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" value="${ownerInstance?.firstName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ownerInstance, field: 'vehicle', 'error')} required">
	<label for="vehicle">
		<g:message code="owner.vehicle.label" default="Vehicle" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="vehicle.id" from="${vehicleSelectOptions}" optionKey="id" value="${ownerInstance?.vehicle?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ownerInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="owner.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${ownerInstance?.lastName}" />
</div>

