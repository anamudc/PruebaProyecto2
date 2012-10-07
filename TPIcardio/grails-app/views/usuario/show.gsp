
<%@ page import="tpicardio.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
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
				
					<g:if test="${usuarioInstance?.cedula}">
						<dt><g:message code="usuario.cedula.label" default="Cedula" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="cedula"/></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.nombre}">
						<dt><g:message code="usuario.nombre.label" default="Nombre" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="nombre"/></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.apellido}">
						<dt><g:message code="usuario.apellido.label" default="Apellido" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="apellido"/></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.correo}">
						<dt><g:message code="usuario.correo.label" default="Correo" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="correo"/></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.password}">
						<dt><g:message code="usuario.password.label" default="Password" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="password"/></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.edad}">
						<dt><g:message code="usuario.edad.label" default="Edad" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="edad"/></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.peso}">
						<dt><g:message code="usuario.peso.label" default="Peso" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="peso"/></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.altura}">
						<dt><g:message code="usuario.altura.label" default="Altura" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="altura"/></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.imc}">
						<dt><g:message code="usuario.imc.label" default="Imc" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="imc"/></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.cita}">
						<dt><g:message code="usuario.cita.label" default="Cita" /></dt>
						
							<g:each in="${usuarioInstance.cita}" var="c">
							<dd><g:link controller="cita" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.prueba}">
						<dt><g:message code="usuario.prueba.label" default="Prueba" /></dt>
						
							<g:each in="${usuarioInstance.prueba}" var="p">
							<dd><g:link controller="prueba" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${usuarioInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${usuarioInstance?.id}">
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
