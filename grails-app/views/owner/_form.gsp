<%@ page import="com.sourceallies.Owner" %>



<div class="fieldcontain ${hasErrors(bean: ownerInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="owner.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="required" value="${ownerInstance?.firstName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ownerInstance, field: 'car', 'error')} required">
	<label for="car">
		<g:message code="owner.car.label" default="Car" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="car.id" from="${com.sourceallies.Car.list()}" optionKey="id" value="${ownerInstance?.car?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ownerInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="owner.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${ownerInstance?.lastName}" />
</div>

