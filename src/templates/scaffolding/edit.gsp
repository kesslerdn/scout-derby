<% import grails.persistence.Event %>
<% import org.codehaus.groovy.grails.plugins.PluginManagerHolder %>
<%=packageName%>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="derbyMobile">
        <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
		<div data-role="header" data-position="inline" data-theme="b">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="\${createLink(uri: '/')}" data-ajax="false"><g:message code="default.home.label"/></a></li>
					<li><g:link data-icon="grid" data-ajax="false" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</div>
		<div data-role="content" data-theme="b">
			<g:if test="\${flash.message}">
			<div class="message" role="alert">\${flash.message}</div>
			</g:if>
			<g:hasErrors bean="\${${propertyName}}">
			<div class="errors" role="alert">
				<g:renderErrors bean="\${${propertyName}}" as="list" />
			</div>
			</g:hasErrors>
			<g:form data-ajax="false" method="post" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
				<g:hiddenField name="id" value="\${${propertyName}?.id}" />
				<g:hiddenField name="version" value="\${${propertyName}?.version}" />
			<%  excludedProps = Event.allEvents.toList() << 'version' << 'id' << 'dateCreated' << 'lastUpdated'
				persistentPropNames = domainClass.persistentProperties*.name
				props = domainClass.properties.findAll { persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) }
				Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
				display = true
				required = false
				boolean hasHibernate = PluginManagerHolder.pluginManager.hasGrailsPlugin('hibernate')
				props.each { p ->
					if (hasHibernate) {
						cp = domainClass.constrainedProperties[p.name]
						display = (cp?.display ?: true)
						required = (cp ? !(cp.propertyType in [boolean, Boolean]) && !cp.nullable : false)
					}
					if (display) { %>
				<div data-role="fieldcontain">
					<label for="${p.name}"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></label>
					${renderEditor(p)}
				</div>
			<%  }   } %>
				<button type='submit' id="_action_update"  name="_action_update" data-icon="check">Update</button>
			</g:form>
		</div>
		<div data-role="footer" data-theme="b">
		</div>
    </body>
</html>
