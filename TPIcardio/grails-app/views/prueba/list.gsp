
<%@ page import="tpicardio.Prueba" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'prueba.label', default: 'Prueba')}" />
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
						
							<g:sortableColumn property="altura" title="${message(code: 'prueba.altura.label', default: 'Altura')}" />
						
							<g:sortableColumn property="carga" title="${message(code: 'prueba.carga.label', default: 'Carga')}" />
						
							<g:sortableColumn property="descripcion" title="${message(code: 'prueba.descripcion.label', default: 'Descripcion')}" />
						
							<g:sortableColumn property="grupo" title="${message(code: 'prueba.grupo.label', default: 'Grupo')}" />
						
							<g:sortableColumn property="imc" title="${message(code: 'prueba.imc.label', default: 'Imc')}" />
						
							<g:sortableColumn property="obsevacion" title="${message(code: 'prueba.obsevacion.label', default: 'Obsevacion')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${pruebaInstanceList}" var="pruebaInstance">
						<tr>
						
							<td>${fieldValue(bean: pruebaInstance, field: "altura")}</td>
						
							<td>${fieldValue(bean: pruebaInstance, field: "carga")}</td>
						
							<td>${fieldValue(bean: pruebaInstance, field: "descripcion")}</td>
						
							<td>${fieldValue(bean: pruebaInstance, field: "grupo")}</td>
						
							<td>${fieldValue(bean: pruebaInstance, field: "imc")}</td>
						
							<td>${fieldValue(bean: pruebaInstance, field: "obsevacion")}</td>
						
							<td class="link">
								<g:link action="show" id="${pruebaInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${pruebaInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
