<%@ page import="com.sourceallies.Car" %>



<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'owner', 'error')} ">
	<label for="owner">
		<g:message code="car.owner.label" default="Owner" />
		
	</label>
	<g:select name="owner.id" from="${com.sourceallies.Owner.list()}" optionKey="id" value="${carInstance?.owner?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'carName', 'error')} required">
	<label for="carName">
		<g:message code="car.carName.label" default="Car Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="carName" required="required" value="${carInstance?.carName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'finishTimes', 'error')} ">
	<label for="finishTimes">
		<g:message code="car.finishTimes.label" default="Finish Times" />
		
	</label>
	
<ul>
<g:each in="${carInstance?.finishTimes?}" var="f">
    <li><g:link controller="finishTime" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="finishTime" action="create" params="['car.id': carInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'finishTime.label', default: 'FinishTime')])}</g:link>

</div>

