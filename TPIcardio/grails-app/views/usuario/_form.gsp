<%@ page import="tpicardio.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cedula', 'error')} required">
	<label for="cedula">
		<g:message code="usuario.cedula.label" default="Cedula" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cedula" type="number" value="${usuarioInstance.cedula}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="50" required="" value="${usuarioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="usuario.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" maxlength="50" required="" value="${usuarioInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'correo', 'error')} required">
	<label for="correo">
		<g:message code="usuario.correo.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="correo" required="" value="${usuarioInstance?.correo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${usuarioInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'edad', 'error')} required">
	<label for="edad">
		<g:message code="usuario.edad.label" default="Edad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="edad" type="number" value="${usuarioInstance.edad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'peso', 'error')} required">
	<label for="peso">
		<g:message code="usuario.peso.label" default="Peso" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="peso" value="${fieldValue(bean: usuarioInstance, field: 'peso')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'altura', 'error')} required">
	<label for="altura">
		<g:message code="usuario.altura.label" default="Altura" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="altura" value="${fieldValue(bean: usuarioInstance, field: 'altura')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'imc', 'error')} required">
	<label for="imc">
		<g:message code="usuario.imc.label" default="Imc" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="imc" value="${fieldValue(bean: usuarioInstance, field: 'imc')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cita', 'error')} ">
	<label for="cita">
		<g:message code="usuario.cita.label" default="Cita" />
		
	</label>
	<g:select name="cita" from="${tpicardio.Cita.list()}" multiple="multiple" optionKey="id" size="5" value="${usuarioInstance?.cita*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'prueba', 'error')} ">
	<label for="prueba">
		<g:message code="usuario.prueba.label" default="Prueba" />
		
	</label>
	<g:select name="prueba" from="${tpicardio.Prueba.list()}" multiple="multiple" optionKey="id" size="5" value="${usuarioInstance?.prueba*.id}" class="many-to-many"/>
</div>

