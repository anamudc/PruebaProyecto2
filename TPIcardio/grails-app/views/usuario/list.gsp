
<%@ page import="tpicardio.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
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
						
							<g:sortableColumn property="cedula" title="${message(code: 'usuario.cedula.label', default: 'Cedula')}" />
						
							<g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />
						
							<g:sortableColumn property="apellido" title="${message(code: 'usuario.apellido.label', default: 'Apellido')}" />
						
							<g:sortableColumn property="correo" title="${message(code: 'usuario.correo.label', default: 'Correo')}" />
						
							<g:sortableColumn property="password" title="${message(code: 'usuario.password.label', default: 'Password')}" />
						
							<g:sortableColumn property="edad" title="${message(code: 'usuario.edad.label', default: 'Edad')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${usuarioInstanceList}" var="usuarioInstance">
						<tr>
						
							<td>${fieldValue(bean: usuarioInstance, field: "cedula")}</td>
						
							<td>${fieldValue(bean: usuarioInstance, field: "nombre")}</td>
						
							<td>${fieldValue(bean: usuarioInstance, field: "apellido")}</td>
						
							<td>${fieldValue(bean: usuarioInstance, field: "correo")}</td>
						
							<td>${fieldValue(bean: usuarioInstance, field: "password")}</td>
						
							<td>${fieldValue(bean: usuarioInstance, field: "edad")}</td>
						
							<td class="link">
								<g:link action="show" id="${usuarioInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${usuarioInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
