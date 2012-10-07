
<%@ page import="tpicardio.Ejercicio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'ejercicio.label', default: 'Ejercicio')}" />
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
				
					<g:if test="${ejercicioInstance?.descripcion}">
						<dt><g:message code="ejercicio.descripcion.label" default="Descripcion" /></dt>
						
							<dd><g:fieldValue bean="${ejercicioInstance}" field="descripcion"/></dd>
						
					</g:if>
				
					<g:if test="${ejercicioInstance?.entrenador}">
						<dt><g:message code="ejercicio.entrenador.label" default="Entrenador" /></dt>
						
							<dd><g:link controller="entrenador" action="show" id="${ejercicioInstance?.entrenador?.id}">${ejercicioInstance?.entrenador?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${ejercicioInstance?.nombre}">
						<dt><g:message code="ejercicio.nombre.label" default="Nombre" /></dt>
						
							<dd><g:fieldValue bean="${ejercicioInstance}" field="nombre"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${ejercicioInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${ejercicioInstance?.id}">
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
