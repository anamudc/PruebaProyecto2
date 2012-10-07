
<%@ page import="tpicardio.Administrador" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'administrador.label', default: 'Administrador')}" />
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
				
					<g:if test="${administradorInstance?.cedula}">
						<dt><g:message code="administrador.cedula.label" default="Cedula" /></dt>
						
							<dd><g:fieldValue bean="${administradorInstance}" field="cedula"/></dd>
						
					</g:if>
				
					<g:if test="${administradorInstance?.nombre}">
						<dt><g:message code="administrador.nombre.label" default="Nombre" /></dt>
						
							<dd><g:fieldValue bean="${administradorInstance}" field="nombre"/></dd>
						
					</g:if>
				
					<g:if test="${administradorInstance?.apellido}">
						<dt><g:message code="administrador.apellido.label" default="Apellido" /></dt>
						
							<dd><g:fieldValue bean="${administradorInstance}" field="apellido"/></dd>
						
					</g:if>
				
					<g:if test="${administradorInstance?.correo}">
						<dt><g:message code="administrador.correo.label" default="Correo" /></dt>
						
							<dd><g:fieldValue bean="${administradorInstance}" field="correo"/></dd>
						
					</g:if>
				
					<g:if test="${administradorInstance?.password}">
						<dt><g:message code="administrador.password.label" default="Password" /></dt>
						
							<dd><g:fieldValue bean="${administradorInstance}" field="password"/></dd>
						
					</g:if>
				
					<g:if test="${administradorInstance?.edad}">
						<dt><g:message code="administrador.edad.label" default="Edad" /></dt>
						
							<dd><g:fieldValue bean="${administradorInstance}" field="edad"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${administradorInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${administradorInstance?.id}">
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
