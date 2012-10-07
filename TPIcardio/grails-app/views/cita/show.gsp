
<%@ page import="tpicardio.Cita" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'cita.label', default: 'Cita')}" />
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
				
					<g:if test="${citaInstance?.fecha}">
						<dt><g:message code="cita.fecha.label" default="Fecha" /></dt>
						
							<dd><g:formatDate date="${citaInstance?.fecha}" /></dd>
						
					</g:if>
				
					<g:if test="${citaInstance?.entrenador}">
						<dt><g:message code="cita.entrenador.label" default="Entrenador" /></dt>
						
							<dd><g:link controller="entrenador" action="show" id="${citaInstance?.entrenador?.id}">${citaInstance?.entrenador?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${citaInstance?.usuario}">
						<dt><g:message code="cita.usuario.label" default="Usuario" /></dt>
						
							<g:each in="${citaInstance.usuario}" var="u">
							<dd><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${citaInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${citaInstance?.id}">
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
