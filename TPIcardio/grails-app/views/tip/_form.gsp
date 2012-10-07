<%@ page import="tpicardio.Tip" %>



<div class="fieldcontain ${hasErrors(bean: tipInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tip.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${tipInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipInstance, field: 'entrenador', 'error')} required">
	<label for="entrenador">
		<g:message code="tip.entrenador.label" default="Entrenador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entrenador" name="entrenador.id" from="${tpicardio.Entrenador.list()}" optionKey="id" required="" value="${tipInstance?.entrenador?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="tip.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${tipInstance?.nombre}"/>
</div>

