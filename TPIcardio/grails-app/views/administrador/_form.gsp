<%@ page import="tpicardio.Administrador" %>



<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'cedula', 'error')} required">
	<label for="cedula">
		<g:message code="administrador.cedula.label" default="Cedula" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cedula" type="number" value="${administradorInstance.cedula}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="administrador.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="50" required="" value="${administradorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="administrador.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" maxlength="50" required="" value="${administradorInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'correo', 'error')} required">
	<label for="correo">
		<g:message code="administrador.correo.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="correo" required="" value="${administradorInstance?.correo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="administrador.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${administradorInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: administradorInstance, field: 'edad', 'error')} required">
	<label for="edad">
		<g:message code="administrador.edad.label" default="Edad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="edad" type="number" value="${administradorInstance.edad}" required=""/>
</div>

