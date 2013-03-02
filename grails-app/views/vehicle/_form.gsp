<%@ page import="com.sourceallies.Vehicle" %>



<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'owner', 'error')} ">
	<label for="owner">
		<g:message code="vehicle.owner.label" default="Owner" />
		
	</label>
	<g:select name="owner.id" from="${ownerSelectOptions}" optionKey="id" value="${vehicleInstance?.owner?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'vehicleName', 'error')} required">
	<label for="vehicleName">
		<g:message code="vehicle.vehicleName.label" default="Vehicle Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="vehicleName" required="required" value="${vehicleInstance?.vehicleName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: vehicleInstance, field: 'finishTimes', 'error')} ">
	<label for="finishTimes">
		<g:message code="vehicle.finishTimes.label" default="Finish Times" />
		
	</label>
	
<ul>
<g:each in="${vehicleInstance?.finishTimes?}" var="f">
    <li><g:link controller="finishTime" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="finishTime" action="create" params="['vehicle.id': vehicleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'finishTime.label', default: 'FinishTime')])}</g:link>

</div>

