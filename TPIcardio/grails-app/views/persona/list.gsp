
<%@ page import="tpicardio.Persona" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
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
						
							<g:sortableColumn property="cedula" title="${message(code: 'persona.cedula.label', default: 'Cedula')}" />
						
							<g:sortableColumn property="nombre" title="${message(code: 'persona.nombre.label', default: 'Nombre')}" />
						
							<g:sortableColumn property="apellido" title="${message(code: 'persona.apellido.label', default: 'Apellido')}" />
						
							<g:sortableColumn property="correo" title="${message(code: 'persona.correo.label', default: 'Correo')}" />
						
							<g:sortableColumn property="password" title="${message(code: 'persona.password.label', default: 'Password')}" />
						
							<g:sortableColumn property="edad" title="${message(code: 'persona.edad.label', default: 'Edad')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${personaInstanceList}" var="personaInstance">
						<tr>
						
							<td>${fieldValue(bean: personaInstance, field: "cedula")}</td>
						
							<td>${fieldValue(bean: personaInstance, field: "nombre")}</td>
						
							<td>${fieldValue(bean: personaInstance, field: "apellido")}</td>
						
							<td>${fieldValue(bean: personaInstance, field: "correo")}</td>
						
							<td>${fieldValue(bean: personaInstance, field: "password")}</td>
						
							<td>${fieldValue(bean: personaInstance, field: "edad")}</td>
						
							<td class="link">
								<g:link action="show" id="${personaInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${personaInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
