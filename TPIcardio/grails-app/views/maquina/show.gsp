
<%@ page import="tpicardio.Maquina" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'maquina.label', default: 'Maquina')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${maquinaInstance?.imagen}">
						<dt><g:message code="maquina.imagen.label" default="Imagen" /></dt>
						
					</g:if>
				
					<g:if test="${maquinaInstance?.entrenador}">
						<dt><g:message code="maquina.entrenador.label" default="Entrenador" /></dt>
						
							<dd><g:link controller="entrenador" action="show" id="${maquinaInstance?.entrenador?.id}">${maquinaInstance?.entrenador?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${maquinaInstance?.marca}">
						<dt><g:message code="maquina.marca.label" default="Marca" /></dt>
						
							<dd><g:fieldValue bean="${maquinaInstance}" field="marca"/></dd>
						
					</g:if>
				
					<g:if test="${maquinaInstance?.modelo}">
						<dt><g:message code="maquina.modelo.label" default="Modelo" /></dt>
						
							<dd><g:fieldValue bean="${maquinaInstance}" field="modelo"/></dd>
						
					</g:if>
				
					<g:if test="${maquinaInstance?.numero}">
						<dt><g:message code="maquina.numero.label" default="Numero" /></dt>
						
							<dd><g:fieldValue bean="${maquinaInstance}" field="numero"/></dd>
						
					</g:if>
				
					<g:if test="${maquinaInstance?.observacion}">
						<dt><g:message code="maquina.observacion.label" default="Observacion" /></dt>
						
							<dd><g:fieldValue bean="${maquinaInstance}" field="observacion"/></dd>
						
					</g:if>
				
					<g:if test="${maquinaInstance?.placaReferencia}">
						<dt><g:message code="maquina.placaReferencia.label" default="Placa Referencia" /></dt>
						
							<dd><g:fieldValue bean="${maquinaInstance}" field="placaReferencia"/></dd>
						
					</g:if>
				
					<g:if test="${maquinaInstance?.tipo}">
						<dt><g:message code="maquina.tipo.label" default="Tipo" /></dt>
						
							<dd><g:fieldValue bean="${maquinaInstance}" field="tipo"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${maquinaInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${maquinaInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
