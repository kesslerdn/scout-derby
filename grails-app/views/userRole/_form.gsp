<%@ page import="com.sourceallies.UserRole" %>



<div class="fieldcontain ${hasErrors(bean: userRoleInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="userRole.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="role.id" from="${com.sourceallies.Role.list()}" optionKey="id" value="${userRoleInstance?.role?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userRoleInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userRole.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="user.id" from="${com.sourceallies.User.list()}" optionKey="id" value="${userRoleInstance?.user?.id}"  />
</div>

