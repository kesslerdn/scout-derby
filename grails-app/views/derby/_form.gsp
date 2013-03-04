<%@ page import="com.sourceallies.Derby" %>



<div class="fieldcontain ${hasErrors(bean: derbyInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="derby.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" maxlength="25" value="${derbyInstance?.city}" />
</div>

<div class="fieldcontain ${hasErrors(bean: derbyInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="derby.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="state" from="${derbyInstance.constraints.state.inList}" value="${derbyInstance?.state}" valueMessagePrefix="derby.state"  />
</div>

<div class="fieldcontain ${hasErrors(bean: derbyInstance, field: 'locationName', 'error')} required">
	<label for="locationName">
		<g:message code="derby.locationName.label" default="Location Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="locationName" maxlength="25" value="${derbyInstance?.locationName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: derbyInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="derby.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day" value="${derbyInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: derbyInstance, field: 'organizationNumber', 'error')} ">
	<label for="organizationNumber">
		<g:message code="derby.organizationNumber.label" default="Organization Number" />
		
	</label>
	<g:textField name="organizationNumber" value="${derbyInstance?.organizationNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: derbyInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="derby.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${derbyInstance.constraints.type.inList}" value="${derbyInstance?.type}" valueMessagePrefix="derby.type"  />
</div>

<div class="fieldcontain ${hasErrors(bean: derbyInstance, field: 'races', 'error')} ">
	<label for="races">
		<g:message code="derby.races.label" default="Races" />
		
	</label>
	
<ul>
<g:each in="${derbyInstance?.races?}" var="r">
    <li><g:link controller="race" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="race" action="create" params="['derby.id': derbyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'race.label', default: 'Race')])}</g:link>

</div>

