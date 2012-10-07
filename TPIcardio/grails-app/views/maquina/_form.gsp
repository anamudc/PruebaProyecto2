<%@ page import="tpicardio.Maquina" %>



<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'imagen', 'error')} required">
	<label for="imagen">
		<g:message code="maquina.imagen.label" default="Imagen" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="imagen" name="imagen" />
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'entrenador', 'error')} required">
	<label for="entrenador">
		<g:message code="maquina.entrenador.label" default="Entrenador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entrenador" name="entrenador.id" from="${tpicardio.Entrenador.list()}" optionKey="id" required="" value="${maquinaInstance?.entrenador?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'marca', 'error')} ">
	<label for="marca">
		<g:message code="maquina.marca.label" default="Marca" />
		
	</label>
	<g:textField name="marca" value="${maquinaInstance?.marca}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'modelo', 'error')} ">
	<label for="modelo">
		<g:message code="maquina.modelo.label" default="Modelo" />
		
	</label>
	<g:textField name="modelo" value="${maquinaInstance?.modelo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="maquina.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${maquinaInstance.numero}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'observacion', 'error')} ">
	<label for="observacion">
		<g:message code="maquina.observacion.label" default="Observacion" />
		
	</label>
	<g:textField name="observacion" value="${maquinaInstance?.observacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'placaReferencia', 'error')} required">
	<label for="placaReferencia">
		<g:message code="maquina.placaReferencia.label" default="Placa Referencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="placaReferencia" type="number" value="${maquinaInstance.placaReferencia}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="maquina.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" value="${maquinaInstance?.tipo}"/>
</div>

