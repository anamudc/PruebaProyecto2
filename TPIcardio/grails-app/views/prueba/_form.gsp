<%@ page import="tpicardio.Prueba" %>



<div class="fieldcontain ${hasErrors(bean: pruebaInstance, field: 'altura', 'error')} required">
	<label for="altura">
		<g:message code="prueba.altura.label" default="Altura" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="altura" value="${fieldValue(bean: pruebaInstance, field: 'altura')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pruebaInstance, field: 'carga', 'error')} required">
	<label for="carga">
		<g:message code="prueba.carga.label" default="Carga" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="carga" type="number" value="${pruebaInstance.carga}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pruebaInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="prueba.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${pruebaInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pruebaInstance, field: 'grupo', 'error')} ">
	<label for="grupo">
		<g:message code="prueba.grupo.label" default="Grupo" />
		
	</label>
	<g:textField name="grupo" value="${pruebaInstance?.grupo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pruebaInstance, field: 'imc', 'error')} required">
	<label for="imc">
		<g:message code="prueba.imc.label" default="Imc" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="imc" value="${fieldValue(bean: pruebaInstance, field: 'imc')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pruebaInstance, field: 'obsevacion', 'error')} ">
	<label for="obsevacion">
		<g:message code="prueba.obsevacion.label" default="Obsevacion" />
		
	</label>
	<g:textField name="obsevacion" value="${pruebaInstance?.obsevacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pruebaInstance, field: 'peso', 'error')} required">
	<label for="peso">
		<g:message code="prueba.peso.label" default="Peso" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="peso" value="${fieldValue(bean: pruebaInstance, field: 'peso')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pruebaInstance, field: 'porcentajeGrasa', 'error')} required">
	<label for="porcentajeGrasa">
		<g:message code="prueba.porcentajeGrasa.label" default="Porcentaje Grasa" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="porcentajeGrasa" value="${fieldValue(bean: pruebaInstance, field: 'porcentajeGrasa')}" required=""/>
</div>

