
<%@ page import="tpicardio.Prueba" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'prueba.label', default: 'Prueba')}" />
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
				
					<g:if test="${pruebaInstance?.altura}">
						<dt><g:message code="prueba.altura.label" default="Altura" /></dt>
						
							<dd><g:fieldValue bean="${pruebaInstance}" field="altura"/></dd>
						
					</g:if>
				
					<g:if test="${pruebaInstance?.carga}">
						<dt><g:message code="prueba.carga.label" default="Carga" /></dt>
						
							<dd><g:fieldValue bean="${pruebaInstance}" field="carga"/></dd>
						
					</g:if>
				
					<g:if test="${pruebaInstance?.descripcion}">
						<dt><g:message code="prueba.descripcion.label" default="Descripcion" /></dt>
						
							<dd><g:fieldValue bean="${pruebaInstance}" field="descripcion"/></dd>
						
					</g:if>
				
					<g:if test="${pruebaInstance?.grupo}">
						<dt><g:message code="prueba.grupo.label" default="Grupo" /></dt>
						
							<dd><g:fieldValue bean="${pruebaInstance}" field="grupo"/></dd>
						
					</g:if>
				
					<g:if test="${pruebaInstance?.imc}">
						<dt><g:message code="prueba.imc.label" default="Imc" /></dt>
						
							<dd><g:fieldValue bean="${pruebaInstance}" field="imc"/></dd>
						
					</g:if>
				
					<g:if test="${pruebaInstance?.obsevacion}">
						<dt><g:message code="prueba.obsevacion.label" default="Obsevacion" /></dt>
						
							<dd><g:fieldValue bean="${pruebaInstance}" field="obsevacion"/></dd>
						
					</g:if>
				
					<g:if test="${pruebaInstance?.peso}">
						<dt><g:message code="prueba.peso.label" default="Peso" /></dt>
						
							<dd><g:fieldValue bean="${pruebaInstance}" field="peso"/></dd>
						
					</g:if>
				
					<g:if test="${pruebaInstance?.porcentajeGrasa}">
						<dt><g:message code="prueba.porcentajeGrasa.label" default="Porcentaje Grasa" /></dt>
						
							<dd><g:fieldValue bean="${pruebaInstance}" field="porcentajeGrasa"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${pruebaInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${pruebaInstance?.id}">
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
