<%@ page import="tpicardio.Cita" %>



<div class="fieldcontain ${hasErrors(bean: citaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="cita.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${citaInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: citaInstance, field: 'entrenador', 'error')} required">
	<label for="entrenador">
		<g:message code="cita.entrenador.label" default="Entrenador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entrenador" name="entrenador.id" from="${tpicardio.Entrenador.list()}" optionKey="id" required="" value="${citaInstance?.entrenador?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: citaInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="cita.usuario.label" default="Usuario" />
		
	</label>
	
</div>

