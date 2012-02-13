<%@ page import="com.sourceallies.Derby" %>



<div class="fieldcontain ${hasErrors(bean: derbyInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="derby.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="location" required="required" value="${derbyInstance?.location}" />
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

