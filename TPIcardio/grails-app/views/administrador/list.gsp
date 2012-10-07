
<%@ page import="tpicardio.Administrador" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'administrador.label', default: 'Administrador')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
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
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="cedula" title="${message(code: 'administrador.cedula.label', default: 'Cedula')}" />
						
							<g:sortableColumn property="nombre" title="${message(code: 'administrador.nombre.label', default: 'Nombre')}" />
						
							<g:sortableColumn property="apellido" title="${message(code: 'administrador.apellido.label', default: 'Apellido')}" />
						
							<g:sortableColumn property="correo" title="${message(code: 'administrador.correo.label', default: 'Correo')}" />
						
							<g:sortableColumn property="password" title="${message(code: 'administrador.password.label', default: 'Password')}" />
						
							<g:sortableColumn property="edad" title="${message(code: 'administrador.edad.label', default: 'Edad')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${administradorInstanceList}" var="administradorInstance">
						<tr>
						
							<td>${fieldValue(bean: administradorInstance, field: "cedula")}</td>
						
							<td>${fieldValue(bean: administradorInstance, field: "nombre")}</td>
						
							<td>${fieldValue(bean: administradorInstance, field: "apellido")}</td>
						
							<td>${fieldValue(bean: administradorInstance, field: "correo")}</td>
						
							<td>${fieldValue(bean: administradorInstance, field: "password")}</td>
						
							<td>${fieldValue(bean: administradorInstance, field: "edad")}</td>
						
							<td class="link">
								<g:link action="show" id="${administradorInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${administradorInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
