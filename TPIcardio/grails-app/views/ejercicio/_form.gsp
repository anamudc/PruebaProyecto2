<%@ page import="tpicardio.Ejercicio" %>



<div class="fieldcontain ${hasErrors(bean: ejercicioInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="ejercicio.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${ejercicioInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ejercicioInstance, field: 'entrenador', 'error')} required">
	<label for="entrenador">
		<g:message code="ejercicio.entrenador.label" default="Entrenador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entrenador" name="entrenador.id" from="${tpicardio.Entrenador.list()}" optionKey="id" required="" value="${ejercicioInstance?.entrenador?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ejercicioInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="ejercicio.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${ejercicioInstance?.nombre}"/>
</div>

